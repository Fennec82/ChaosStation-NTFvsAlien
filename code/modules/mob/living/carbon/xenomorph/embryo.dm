/obj/item/alien_embryo
	name = "alien embryo"
	desc = "All slimy and yucky."
	icon = 'icons/Xeno/castes/larva.dmi'
	icon_state = "Embryo"
	var/grinder_datum = /datum/reagent/consumable/larvajelly //good ol cookin
	var/grinder_amount = 5
	var/mob/living/affected_mob
	///The stage of the bursts, with worsening effects.
	var/stage = 0
	///How developed the embryo is, if it ages up highly enough it has a chance to burst.
	var/counter = 0
	///How long before the larva is kicked out, * SSobj wait
	var/larva_autoburst_countdown = 20
	///How long will the embryo's growth rate be increased
	var/boost_timer = 0
	var/hivenumber = XENO_HIVE_NORMAL
	var/admin = FALSE
	var/emerge_target = 1
	var/emerge_target_flavor = null


/obj/item/alien_embryo/Initialize(mapload)
	. = ..()
	if(!isliving(loc))
		return
	if(istype(loc, /mob/living/carbon/xenomorph/puppet))
		return INITIALIZE_HINT_QDEL //letting puppets be larva farms makes it too easy to get larva.
	affected_mob = loc
	affected_mob.status_flags |= XENO_HOST
	log_combat(affected_mob, null, "been infected with an embryo")
	START_PROCESSING(SSobj, src)
	var/mob/living/C = affected_mob
	C.med_hud_set_status()


/obj/item/alien_embryo/Destroy()
	if(affected_mob)
		log_combat(affected_mob, null, "had their embryo removed")
		var/obj/item/alien_embryo/remainingembryo = locate() in affected_mob
		if(!remainingembryo)
			var/mob/living/carbon/xenomorph/larva/remaininglarva = locate() in affected_mob
			if(!remaininglarva)
				affected_mob.status_flags &= ~(XENO_HOST)
		var/mob/living/C = affected_mob
		C.med_hud_set_status()
		STOP_PROCESSING(SSobj, src)
		affected_mob = null
	return ..()


/obj/item/alien_embryo/process()
	if(!affected_mob)
		qdel(src)
		return PROCESS_KILL

	if(affected_mob.stat == DEAD) //No more corpsefucking for infinite larva, thanks
		return FALSE

	if(loc != affected_mob)
		var/obj/item/alien_embryo/remainingembryo = locate() in affected_mob
		if(!remainingembryo)
			var/mob/living/carbon/xenomorph/larva/remaininglarva = locate() in affected_mob
			if(!remaininglarva)
				affected_mob.status_flags &= ~(XENO_HOST)
		var/mob/living/C = affected_mob
		C.med_hud_set_status()
		affected_mob = null
		return PROCESS_KILL

	if(affected_mob.stat == DEAD) //Runs after the first proc, which should entirely null the need for the check in initiate_burst, but to be safe...
		for(var/mob/living/carbon/xenomorph/larva/L in affected_mob.contents)
			L?.initiate_burst(affected_mob)
			if(!L)
				return PROCESS_KILL

	if(HAS_TRAIT(affected_mob, TRAIT_STASIS))
		return //If they are in cryo, bag or cell, the embryo won't grow.

	process_growth()

	/*
///Kills larva when host goes DNR
/obj/item/alien_embryo/proc/on_host_dnr(datum/source)
	SIGNAL_HANDLER
	qdel(src)
	*/

/obj/item/alien_embryo/proc/process_growth()
	if(affected_mob.stat == DEAD) //No more corpsefucking for infinite larva, thanks
		return FALSE

	if(stage <= 4)
		counter += 2.5 //Free burst time in ~7/8 min.

	if(affected_mob.reagents.get_reagent_amount(/datum/reagent/consumable/larvajelly))
		counter += 5 //Accelerates larval growth massively. Voluntarily drinking larval jelly while infected is straight-up suicide. Larva hits Stage 5 in exactly ONE minute.

	if(affected_mob.reagents.get_reagent_amount(/datum/reagent/medicine/larvaway))
		counter -= 1 //Halves larval growth progress, for some tradeoffs. Larval toxin purges this

	if(boost_timer)
		counter += 2.5 //Doubles larval growth progress. Burst time in ~4 min.
		adjust_boost_timer(-1)

	if(stage < 5 && counter >= 120)
		counter = 0
		stage++
		log_combat(affected_mob, null, "had their embryo advance to stage [stage]")
		var/mob/living/carbon/C = affected_mob
		C.med_hud_set_status()
		affected_mob.jitter(stage * 5)

	switch(stage)
		if(2)
			if(prob(2))
				to_chat(affected_mob, span_warning("[pick("You feel something in your belly.", "You feel something in your stomach.")]."))
		if(3)
			if(prob(2))
				to_chat(affected_mob, span_warning("[pick("You feel something move inside your belly.", "You feel something move in your stomach.")]."))
			else if(prob(1))
				to_chat(affected_mob, span_warning("Your belly aches a little."))
		if(4)
			if(prob(1))
				if(!affected_mob.IsParalyzed())
					affected_mob.visible_message(span_danger("\The [affected_mob] starts shaking uncontrollably!"), \
												span_danger("You start shaking uncontrollably!"))
					affected_mob.jitter(105)
			if(prob(2))
				to_chat(affected_mob, span_warning("[pick("You feel something squirming inside you!.", "It becomes a bit difficult to breathe.")]."))
		if(5)
			become_larva()
		if(6)
			larva_autoburst_countdown--
			if(!larva_autoburst_countdown)
				for(var/mob/living/carbon/xenomorph/larva/L in affected_mob.contents)
					L?.initiate_burst(affected_mob)
					if(!L)
						break


//We look for a candidate. If found, we spawn the candidate as a larva.
//Order of priority is bursted individual (if xeno is enabled), then random candidate, and then it's up for grabs and spawns braindead.
/obj/item/alien_embryo/proc/become_larva()
	if(!affected_mob)
		return

	var/area/mob_area = get_area(affected_mob)
	if(is_centcom_level(affected_mob.z) && !istype(mob_area, /area/deathmatch) && !admin)
		return

	var/mob/picked

	//If the bursted person themselves has Xeno enabled, they get the honor of first dibs on the new larva.
	if(affected_mob.client?.prefs && (affected_mob.client.prefs.be_special & (BE_ALIEN|BE_ALIEN_UNREVIVABLE)) && !is_banned_from(affected_mob.ckey, ROLE_XENOMORPH))
		picked = get_alien_candidate()

	//Spawn the larva.
	var/mob/living/carbon/xenomorph/larva/new_xeno

	new_xeno = new(affected_mob)

	new_xeno.transfer_to_hive(hivenumber)
	new_xeno.update_icons()

	//If we have a candidate, transfer it over.
	if(picked)
		picked.mind.transfer_to(new_xeno, TRUE)
		to_chat(new_xeno, span_xenoannounce("We are a xenomorph larva inside a host! Move to squirm out of it!"))
		new_xeno << sound('sound/effects/alien/new_larva.ogg')

	stage = 6


/mob/living/carbon/xenomorph/larva/proc/initiate_burst(mob/living/victim)
	if(loc != victim)
		return

	to_chat(src, span_danger("We start slithering out of [victim]!"))
	var/obj/item/alien_embryo/birth_owner = locate() in victim
	if(birth_owner.emerge_target == 1)
		playsound(victim, 'modular_skyrat/sound/weapons/gagging.ogg', 15, TRUE)
	else
		if(victim.client.prefs.burst_screams_enabled)
			victim.emote_burstscream()
	victim.Paralyze(15 SECONDS)
	victim.visible_message("<span class='danger'>\The [victim] starts shaking uncontrollably!</span>", \
								"<span class='danger'>You feel something wiggling in your [birth_owner.emerge_target_flavor]!</span>")
	victim.jitter(150)

	addtimer(CALLBACK(src, PROC_REF(burst), victim), 3 SECONDS)

/mob/living/carbon/xenomorph/larva/proc/burst(mob/living/victim)
	if(QDELETED(victim))
		return

	if(istype(victim.loc, /obj/vehicle/sealed))
		var/obj/vehicle/sealed/armored/veh = victim.loc
		forceMove(veh.exit_location(src))
	else
		forceMove(get_turf(victim)) //moved to the turf directly so we don't get stuck inside a cryopod or another mob container.
	var/obj/item/alien_embryo/AE = locate() in victim
	playsound(src, pick('sound/voice/alien/chestburst.ogg','sound/voice/alien/chestburst2.ogg'), 10)
	victim.visible_message("<span class='danger'>The Larva forces its way out of [victim]'s [AE.emerge_target_flavor]!</span>")
	GLOB.round_statistics.total_larva_burst++
	SSblackbox.record_feedback("tally", "round_statistics", 1, "total_larva_burst")

	if(AE)
		qdel(AE)

	var/obj/item/alien_embryo/remainingembryo = locate() in victim
	if(!remainingembryo)
		var/mob/living/carbon/xenomorph/larva/remaininglarva = locate() in victim
		if(!remaininglarva)
			victim.status_flags &= ~(XENO_HOST)
	victim.med_hud_set_status()

	log_combat(src, null, "was born as a larva.")
	log_game("[key_name(src)] was born as a larva at [AREACOORD(src)].")
	if(ismonkey(victim))
		victim.apply_damage(25, BRUTE, BODY_ZONE_HEAD, updating_health = TRUE)
		victim.adjustCloneLoss(25)
	if((((locate(/obj/structure/bed/nest) in loc) || loc_weeds_type) && hive.living_xeno_ruler?.z == loc.z) && !mind)
		addtimer(CALLBACK(src, PROC_REF(burrow)), 4 SECONDS)


/mob/living/proc/emote_burstscream()
	return


/mob/living/carbon/human/emote_burstscream()
	if(species.species_flags & NO_PAIN)
		return
	emote("burstscream")


///Adjusts the growth acceleration timer
/obj/item/alien_embryo/proc/adjust_boost_timer(amount, capped = 0, override_time = FALSE)
	if(override_time)
		boost_timer = max(amount, 0)
	else
		boost_timer = max(boost_timer + amount, 0)

	if(capped > 0)
		boost_timer = min(boost_timer, capped)
	return
