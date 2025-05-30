#define PARROT_PERCH (1<<0)	//Sitting/sleeping, not moving
#define PARROT_SWOOP (1<<1)	//Moving towards or away from a target
#define PARROT_WANDER (1<<2)	//Moving without a specific target in mind
#define PARROT_STEAL (1<<3)	//Flying towards a target to steal it/from it
#define PARROT_ATTACK (1<<4)	//Flying towards a target to attack it
#define PARROT_RETURN (1<<5)	//Flying towards its perch
#define PARROT_FLEE (1<<6)	//Flying away from its attacker

GLOBAL_LIST_INIT(strippable_parrot_items, create_strippable_list(list(
	/datum/strippable_item/parrot_headset
)))

/mob/living/simple_animal/parrot
	name = "parrot"
	desc = "The parrot squaks, \"It's a Parrot! BAWWK!\""
	icon = 'icons/mob/animal.dmi'
	icon_state = "parrot_fly"
	icon_living = "parrot_fly"
	icon_dead = "parrot_dead"
	var/icon_sit = "parrot_sit"
	density = FALSE
	health = 80
	maxHealth = 80
	allow_pass_flags = PASS_MOB
	pass_flags = PASS_LOW_STRUCTURE|PASS_MOB

	speak = list("Hi!","Hello!","Cracker?","BAWWWWK george mellons griffing me!")
	speak_emote = list("squawks","says","yells")
	emote_hear = list("squawks.","bawks!")
	emote_see = list("flutters its wings.")

	speak_chance = 1
	turns_per_move = 5
	melee_damage = 8

	response_help = "pets"
	response_disarm = "gently moves aside"
	response_harm = "swats"
	stop_automated_movement = TRUE
	a_intent = INTENT_HARM
	attacktext = "chomps"
	friendly = "grooms"
	mob_size = MOB_SIZE_SMALL

	var/parrot_damage_upper = 10
	var/parrot_state = PARROT_WANDER //Hunt for a perch when created
	var/parrot_sleep_max = 25 //The time the parrot sits while perched before looking around. Mosly a way to avoid the parrot's AI in life() being run every single tick.
	var/parrot_sleep_dur = 25 //Same as above, this is the var that physically counts down
	var/parrot_dam_zone = list(BODY_ZONE_CHEST, BODY_ZONE_HEAD, BODY_ZONE_L_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_ARM, BODY_ZONE_R_LEG) //For humans, select a bodypart to attack

	var/parrot_speed = 5 //"Delay in world ticks between movement." according to byond. Yeah, that's BS but it does directly affect movement. Higher number = slower.
	var/parrot_lastmove = null //Updates/Stores position of the parrot while it's moving
	var/parrot_stuck = 0	//If parrot_lastmove hasnt changed, this will increment until it reaches parrot_stuck_threshold
	var/parrot_stuck_threshold = 10 //if this == parrot_stuck, it'll force the parrot back to wandering

	var/list/speech_buffer = list()
	var/speech_shuffle_rate = 20
	var/list/available_channels = list()

	var/obj/item/radio/headset/ears = null

	//The thing the parrot is currently interested in. This gets used for items the parrot wants to pick up, mobs it wants to steal from,
	//mobs it wants to attack or mobs that have attacked it
	var/atom/movable/parrot_interest = null

	//Parrots will generally sit on their perch unless something catches their eye.
	//These vars store their preffered perch and if they dont have one, what they can use as a perch
	var/obj/parrot_perch = null
	var/obj/desired_perches = list(/obj/structure/displaycase, /obj/structure/filingcabinet, /obj/machinery/teleport, \
									/obj/machinery/computer, /obj/machinery/telecomms, /obj/machinery/nuclearbomb,	\
									/obj/machinery/recharge_station, /obj/machinery/smartfridge, /obj/machinery/suit_storage_unit)
	var/obj/item/held_item = null


/mob/living/simple_animal/parrot/Initialize(mapload)
	. = ..()
	if(!ears)
		ears = new /obj/item/radio/headset/mainship/mcom(src)

	parrot_sleep_dur = parrot_sleep_max //In case someone decides to change the max without changing the duration var

	AddElement(/datum/element/strippable, GLOB.strippable_parrot_items)

/mob/living/simple_animal/parrot/death(gibbing, deathmessage, silent)
	if(stat == DEAD)
		return ..()
	if(held_item)
		held_item.forceMove(drop_location())
		held_item = null
	walk(src, 0)

	pixel_x = initial(pixel_x)
	pixel_y = initial(pixel_y)

	return ..()


/mob/living/simple_animal/parrot/get_status_tab_items()
	. = ..()
	. += "Held Item: [held_item]"


/mob/living/simple_animal/parrot/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, list/spans, message_mode)
	. = ..()
	if(speaker != src && prob(50)) //Dont imitate ourselves
		if(!radio_freq || prob(10))
			if(length(speech_buffer) >= 500)
				speech_buffer -= pick(speech_buffer)
			speech_buffer |= html_decode(raw_message)
	if(speaker == src && !client) //If a parrot squawks in the woods and no one is around to hear it, does it make a sound? This code says yes!
		return message


/mob/living/simple_animal/parrot/radio(message, message_mode, list/spans, language) //literally copied from human/radio(), but there's no other way to do this. at least it's better than it used to be.
	. = ..()
	if(. != 0)
		return

	switch(message_mode)
		if(MODE_HEADSET)
			if(ears)
				ears.talk_into(src, message, , spans, language)
			return ITALICS | REDUCE_RANGE

		if(MODE_DEPARTMENT)
			if(ears)
				ears.talk_into(src, message, message_mode, spans, language)
			return ITALICS | REDUCE_RANGE

	if(message_mode in GLOB.radiochannels)
		if(ears)
			ears.talk_into(src, message, message_mode, spans, language)
			return ITALICS | REDUCE_RANGE

	return 0

/mob/living/simple_animal/parrot/attack_hand(mob/living/user)
	. = ..()
	if(client)
		return
	if(!stat && user.a_intent == INTENT_HARM)

		icon_state = icon_living //It is going to be flying regardless of whether it flees or attacks

		if(parrot_state == PARROT_PERCH)
			parrot_sleep_dur = parrot_sleep_max //Reset it's sleep timer if it was perched

		parrot_interest = user
		parrot_state = PARROT_SWOOP //The parrot just got hit, it WILL move, now to pick a direction..

		if(health > 30) //Let's get in there and squawk it up!
			parrot_state |= PARROT_ATTACK
		else
			parrot_state |= PARROT_FLEE		//Otherwise, fly like a bat out of hell!
			drop_held_item(0)
	if(stat != DEAD && user.a_intent == INTENT_HELP)
		handle_automated_speech(1) //assured speak/emote

/mob/living/simple_animal/parrot/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	return attack_hand(xeno_attacker)


/mob/living/simple_animal/parrot/attack_animal(mob/living/simple_animal/M)
	. = ..() //goodbye immortal parrots

	if(client)
		return

	if(parrot_state == PARROT_PERCH)
		parrot_sleep_dur = parrot_sleep_max //Reset it's sleep timer if it was perched

	if(M.melee_damage > 0 && !stat)
		parrot_interest = M
		parrot_state = PARROT_SWOOP | PARROT_ATTACK //Attack other animals regardless
		icon_state = icon_living


/mob/living/simple_animal/parrot/bullet_act(atom/movable/projectile/proj)
	. = ..()
	if(!stat && !client)
		if(parrot_state == PARROT_PERCH)
			parrot_sleep_dur = parrot_sleep_max //Reset it's sleep timer if it was perched

		parrot_interest = null
		parrot_state = PARROT_WANDER | PARROT_FLEE //Been shot and survived! RUN LIKE HELL!
		//parrot_been_shot += 5
		icon_state = icon_living
		drop_held_item(0)


/mob/living/simple_animal/parrot/Life(seconds_per_tick, times_fired)
	. = ..()

	//Sprite update for when a parrot gets pulled
	if(pulledby && !stat && parrot_state != PARROT_WANDER)
		icon_state = icon_living
		parrot_state = PARROT_WANDER
		pixel_x = initial(pixel_x)
		pixel_y = initial(pixel_y)


/mob/living/simple_animal/parrot/handle_automated_speech()
	. = ..()
	if(length(speech_buffer) && prob(speech_shuffle_rate)) //shuffle out a phrase and add in a new one
		if(length(speak))
			speak -= pick(speak)

		speak += pick(speech_buffer)


/mob/living/simple_animal/parrot/handle_automated_movement()
	if(!isturf(loc) || !canmove || buckled)
		return

	if(client && stat == CONSCIOUS && parrot_state != icon_living)
		icon_state = icon_living

	if(parrot_state == PARROT_PERCH)
		if(parrot_perch && parrot_perch.loc != loc) //Make sure someone hasnt moved our perch on us
			if(parrot_perch in view(src))
				parrot_state = PARROT_SWOOP | PARROT_RETURN
				icon_state = icon_living
				return
			else
				parrot_state = PARROT_WANDER
				icon_state = icon_living
				return

		if(--parrot_sleep_dur)
			return

		//This way we only call the stuff below once every [sleep_max] ticks.
		parrot_sleep_dur = parrot_sleep_max

		//Cycle through message modes for the headset
		if(length(speak))
			var/list/newspeak = list()

			if(length(available_channels) && ears)
				for(var/possible_phrase in speak)

					//50/50 chance to not use the radio at all
					var/useradio = prob(50)

					if((possible_phrase[1] in GLOB.department_radio_prefixes) && (copytext_char(possible_phrase, 2, 3) in GLOB.department_radio_keys))
						possible_phrase = "[useradio ? pick(available_channels) : ""][copytext_char(possible_phrase, 3)]" //crop out the channel prefix
					else
						possible_phrase = "[useradio ? pick(available_channels) : ""][possible_phrase]"

					newspeak += possible_phrase

			else //If we have no headset or channels to use, dont try to use any!
				for(var/possible_phrase in speak)
					if((possible_phrase[1] in GLOB.department_radio_prefixes) && (copytext_char(possible_phrase, 2, 3) in GLOB.department_radio_keys))
						possible_phrase = copytext_char(possible_phrase, 3) //crop out the channel prefix
					newspeak.Add(possible_phrase)
			speak = newspeak


	else if(parrot_state == PARROT_WANDER)
		//Stop movement, we'll set it later
		walk(src, 0)
		parrot_interest = null

		//Wander around aimlessly. This will help keep the loops from searches down
		//and possibly move the mob into a new are in view of something they can use
		if(prob(90))
			step(src, pick(GLOB.cardinals))
			return

		if(!held_item && !parrot_perch) //If we've got nothing to do.. look for something to do.
			var/atom/movable/AM = search_for_perch_and_item() //This handles checking through lists so we know it's either a perch or stealable item
			if(!AM)
				return

			if(istype(AM, /obj/item) || isliving(AM))	//If stealable item
				parrot_interest = AM
				emote("me", 1, "turns and flies towards [parrot_interest].")
				parrot_state = PARROT_SWOOP | PARROT_STEAL
			else	//Else it's a perch
				parrot_perch = AM
				parrot_state = PARROT_SWOOP | PARROT_RETURN
			return

		if(parrot_interest && (parrot_interest in view(src)))
			parrot_state = PARROT_SWOOP | PARROT_STEAL
			return

		if(parrot_perch && (parrot_perch in view(src)))
			parrot_state = PARROT_SWOOP | PARROT_RETURN
			return

		parrot_perch = search_for_perch()
		if(parrot_perch)
			parrot_state = PARROT_SWOOP | PARROT_RETURN
			return

	else if(parrot_state == (PARROT_SWOOP | PARROT_STEAL))
		walk(src, 0)
		if(!parrot_interest || held_item)
			parrot_state = PARROT_SWOOP | PARROT_RETURN
			return

		if(!(parrot_interest in view(src)))
			parrot_state = PARROT_SWOOP | PARROT_RETURN
			return

		if(Adjacent(parrot_interest))
			if(!isliving(parrot_interest) && (!parrot_perch || parrot_interest.loc != parrot_perch.loc))
				held_item = parrot_interest
				parrot_interest.forceMove(src)
				visible_message("[src] grabs [held_item]!", span_notice("You grab [held_item]!"), span_italics("You hear the sounds of wings flapping furiously."))

			parrot_interest = null
			parrot_state = PARROT_SWOOP|PARROT_RETURN
			return

		walk_to(src, parrot_interest, 1, parrot_speed)


	else if(parrot_state == (PARROT_SWOOP|PARROT_RETURN))
		walk(src, 0)
		if(!parrot_perch || !isturf(parrot_perch.loc)) //Make sure the perch exists and somehow isnt inside of something else.
			parrot_perch = null
			parrot_state = PARROT_WANDER
			return

		if(Adjacent(parrot_perch))
			forceMove(parrot_perch.loc)
			drop_held_item()
			parrot_state = PARROT_PERCH
			icon_state = icon_sit
			return

		walk_to(src, parrot_perch, 1, parrot_speed)

	else if(parrot_state == (PARROT_SWOOP|PARROT_FLEE))
		walk(src, 0)
		if(!parrot_interest || !isliving(parrot_interest)) //Sanity
			parrot_state = PARROT_WANDER

		walk_away(src, parrot_interest, 1, parrot_speed)

	else if(parrot_state == (PARROT_SWOOP|PARROT_ATTACK))

		//If we're attacking a nothing, an object, a turf or a ghost for some stupid reason, switch to wander
		if(!parrot_interest || !isliving(parrot_interest))
			parrot_interest = null
			parrot_state = PARROT_WANDER
			return

		var/mob/living/L = parrot_interest
		if(melee_damage == 0)
			melee_damage = parrot_damage_upper
			a_intent = INTENT_HARM


		if(!Adjacent(parrot_interest))
			walk_to(src, parrot_interest, 1, parrot_speed)
			return

		//If the mob we've been chasing/attacking dies or falls into crit, check for loot!
		if(L.stat != CONSCIOUS)
			parrot_interest = null
			if(!held_item)
				held_item = steal_from_ground()
			if(parrot_perch in view(src)) //If we have a home nearby, go to it, otherwise find a new home
				parrot_state = PARROT_SWOOP | PARROT_RETURN
			else
				parrot_state = PARROT_WANDER
			return

		attacktext = pick("claws at", "chomps")
		L.attack_animal(src)

	else
		walk(src,0)
		parrot_interest = null
		parrot_perch = null
		drop_held_item()
		parrot_state = PARROT_WANDER


/mob/living/simple_animal/parrot/proc/steal_from_ground()
	for(var/obj/item/I in view(1, src))
		//Make sure we're not already holding it and it's small enough
		if(I.loc == src || I.w_class > WEIGHT_CLASS_SMALL)
			continue

		//If we have a perch and the item is sitting on it, continue
		if(!client && parrot_perch && I.loc == parrot_perch.loc)
			continue

		held_item = I
		I.forceMove(src)
		visible_message("[src] grabs [held_item]!", span_notice("You grab [held_item]!"), span_italics("You hear the sounds of wings flapping furiously."))
		return held_item

/mob/living/simple_animal/parrot/proc/search_for_perch()
	for(var/obj/O in view(src))
		for(var/path in desired_perches)
			if(istype(O, path))
				return O
	return null


//This proc was made to save on doing two 'in view' loops seperatly
/mob/living/simple_animal/parrot/proc/search_for_perch_and_item()
	for(var/atom/movable/AM in view(src))
		for(var/perch_path in desired_perches)
			if(istype(AM, perch_path))
				return AM

		//Skip items we already stole or are wearing or are too big
		if(parrot_perch && AM.loc == parrot_perch.loc || AM.loc == src)
			continue

		if(istype(AM, /obj/item))
			var/obj/item/I = AM
			if(I.w_class <= WEIGHT_CLASS_SMALL)
				return I

	return null


/mob/living/simple_animal/parrot/Moved(oldLoc, dir)
	. = ..()
	if(. && !stat && client && parrot_state == PARROT_PERCH)
		parrot_state = PARROT_WANDER
		icon_state = icon_living
		pixel_x = initial(pixel_x)
		pixel_y = initial(pixel_y)


/mob/living/simple_animal/parrot/Poly
	name = "Poly"
	desc = "Poly the Parrot. An expert on quantum cracker theory."
	speak = list("Poly wanna cracker!", ":e Check the engines, you chucklefucks!",":e Set up the engines, you lazy bums!",":e WHO TOOK THE DAMN HARDSUITS?")
	speak_chance = 3
	voice_filter = "rubberband=pitch=1.5"
	var/memory_saved = FALSE


/mob/living/simple_animal/parrot/Poly/Initialize(mapload)
	ears = new /obj/item/radio/headset/mainship/st(src)
	available_channels = list(RADIO_TOKEN_ENGINEERING)
	Read_Memory()
	if(SStts.tts_enabled)
		voice = pick(SStts.available_speakers)
		if(SStts.pitch_enabled)
			if(findtext(voice, "Woman")) // todo will be replaced by tagging
				pitch = 12 // up-pitch by one octave
			else
				pitch = 24 // up-pitch by 2 octaves
		else
			voice_filter = "rubberband=pitch=1.5" // Use the filter to pitch up if we can't naturally pitch up.
	return ..()


/mob/living/simple_animal/parrot/Poly/Life(seconds_per_tick, times_fired)
	if(!stat && SSticker.current_state == GAME_STATE_FINISHED && !memory_saved)
		Write_Memory(FALSE)
		memory_saved = TRUE
	return ..()


/mob/living/simple_animal/parrot/Poly/on_death()
	if(!memory_saved)
		Write_Memory(TRUE)
	if(prob(0.666))
		var/mob/living/simple_animal/parrot/Poly/ghost/G = new(loc)
		if(mind)
			mind.transfer_to(G)
		else
			G.key = key
	return ..()


/mob/living/simple_animal/parrot/Poly/proc/Read_Memory()
	if(fexists("data/npc_saves/Poly.sav")) //legacy compatability to convert old format to new
		var/savefile/S = new /savefile("data/npc_saves/Poly.sav")
		S["phrases"] 			>> speech_buffer
		fdel("data/npc_saves/Poly.sav")
	else
		var/json_file = file("data/npc_saves/Poly.json")
		if(!fexists(json_file))
			return
		var/list/json = json_decode(file2text(json_file))
		speech_buffer = json["phrases"]
	if(!islist(speech_buffer))
		speech_buffer = list()


/mob/living/simple_animal/parrot/Poly/proc/Write_Memory(dead)
	var/json_file = file("data/npc_saves/Poly.json")
	var/list/file_data = list()
	if(islist(speech_buffer))
		file_data["phrases"] = speech_buffer
	fdel(json_file)
	WRITE_FILE(json_file, json_encode(file_data))


/mob/living/simple_animal/parrot/Poly/ghost
	name = "The Ghost of Poly"
	desc = "Doomed to squawk the Earth."
	color = "#FFFFFF77"
	speak_chance = 20
	status_flags = GODMODE
	resistance_flags = RESIST_ALL


/mob/living/simple_animal/parrot/Poly/ghost/Initialize(mapload)
	memory_saved = TRUE
	return ..()


/mob/living/simple_animal/parrot/Poly/ghost/handle_automated_speech()
	if(ismob(loc))
		return
	return ..()


/mob/living/simple_animal/parrot/Poly/ghost/handle_automated_movement()
	if(isliving(parrot_interest))
		if(!ishuman(parrot_interest))
			parrot_interest = null
		else if(parrot_state == (PARROT_SWOOP | PARROT_ATTACK) && Adjacent(parrot_interest))
			walk_to(src, parrot_interest, 0, parrot_speed)
	return ..()


/mob/living/simple_animal/parrot/clock_hawk
	name = "clock hawk"
	desc = "Cbyl jnaan penpxre! Fdhnnnjx!"
	icon_state = "clock_hawk_fly"
	icon_living = "clock_hawk_fly"
	icon_sit = "clock_hawk_sit"
	speak = list("Penpxre!", "Ratvar vf n qhzo anzr naljnl!")
	speak_emote = list("squawks rustily", "says crassly", "yells brassly")
	emote_hear = list("squawks rustily.", "bawks metallically!")
	emote_see = list("flutters its metal wings.")
	del_on_death = TRUE

/datum/strippable_item/parrot_headset
	key = STRIPPABLE_ITEM_PARROT_HEADSET

/datum/strippable_item/parrot_headset/get_item(atom/source)
	var/mob/living/simple_animal/parrot/parrot_source = source
	return istype(parrot_source) ? parrot_source.ears : null

/datum/strippable_item/parrot_headset/try_equip(atom/source, obj/item/equipping, mob/user)
	. = ..()
	if(!.)
		return FALSE
	if(!istype(equipping, /obj/item/radio/headset))
		to_chat(user, span_warning("[equipping] won't fit!"))
		return FALSE

	return TRUE

// There is no delay for putting a headset on a parrot.
/datum/strippable_item/parrot_headset/start_equip(atom/source, obj/item/equipping, mob/user)
	return TRUE

/datum/strippable_item/parrot_headset/finish_equip(atom/source, obj/item/equipping, mob/user)
	var/obj/item/radio/headset/radio = equipping
	if(!istype(radio))
		return

	var/mob/living/simple_animal/parrot/parrot_source = source
	if(!istype(parrot_source))
		return

	if(!user.transferItemToLoc(radio, source))
		return

	parrot_source.ears = radio

	to_chat(user, span_notice("You fit [radio] onto [source]"))

	parrot_source.available_channels.Cut()

	for(var/channel in radio.channels)
		switch(channel)
			if(RADIO_CHANNEL_ENGINEERING)
				parrot_source.available_channels.Add(RADIO_TOKEN_ENGINEERING)
			if(RADIO_CHANNEL_COMMAND)
				parrot_source.available_channels.Add(RADIO_TOKEN_COMMAND)
			if(RADIO_CHANNEL_CAS)
				parrot_source.available_channels.Add(RADIO_TOKEN_CAS)
			if(RADIO_CHANNEL_SEC)
				parrot_source.available_channels.Add(RADIO_TOKEN_SEC)
			if(RADIO_CHANNEL_MEDICAL)
				parrot_source.available_channels.Add(RADIO_TOKEN_MEDICAL)
			if(RADIO_CHANNEL_REQUISITIONS)
				parrot_source.available_channels.Add(RADIO_TOKEN_REQUISITIONS)
			if(RADIO_CHANNEL_ALPHA)
				parrot_source.available_channels.Add(RADIO_TOKEN_ALPHA)
			if(RADIO_CHANNEL_BRAVO)
				parrot_source.available_channels.Add(RADIO_TOKEN_BRAVO)
			if(RADIO_CHANNEL_CHARLIE)
				parrot_source.available_channels.Add(RADIO_TOKEN_CHARLIE)
			if(RADIO_CHANNEL_DELTA)
				parrot_source.available_channels.Add(RADIO_TOKEN_DELTA)


/datum/strippable_item/parrot_headset/start_unequip(atom/source, mob/user)
	. = ..()
	if(!.)
		return FALSE

	var/mob/living/simple_animal/parrot/parrot_source = source
	if(!istype(parrot_source))
		return

	if(!parrot_source.stat)
		parrot_source.say("[parrot_source.available_channels.len ? "[pick(parrot_source.available_channels)] " : null]BAWWWWWK LEAVE THE HEADSET BAWKKKKK!")

	return TRUE

/datum/strippable_item/parrot_headset/finish_unequip(atom/source, mob/user)
	var/mob/living/simple_animal/parrot/parrot_source = source
	if(!istype(parrot_source))
		return

	parrot_source.ears.forceMove(parrot_source.drop_location())
	parrot_source.ears = null
