#define XENO_CURTAIN_PULL_DELAY 5 SECONDS

/obj/structure/curtain
	icon = 'icons/obj/structures/curtain.dmi'
	name = "curtain"
	icon_state = "curtain"
	///used to reset curtain back to default state when closing
	var/initial_icon_state = "curtain"
	layer = ABOVE_MOB_LAYER
	opacity = TRUE
	density = FALSE
	///possible sounds we play when opening the curtain
	var/list/possiblesounds = list(
		'sound/effects/medcurtain1.ogg',
		'sound/effects/medcurtain2.ogg',
	)
	var/stack_type = /obj/item/stack/sheet/mineral/plastic
	var/destroyed_stack_amount = 4

/obj/structure/curtain/deconstruct(disassembled = TRUE, mob/living/blame_mob)
	if(stack_type)
		if(destroyed_stack_amount)
			new stack_type (loc, destroyed_stack_amount)
	return ..()

/obj/structure/curtain/open
	icon_state = "curtain_open"
	layer = OBJ_LAYER
	opacity = FALSE


/obj/structure/curtain/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	playsound(get_turf(loc), pick(possiblesounds), 15, 1, 6)
	toggle()

/obj/structure/curtain/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(!do_after(xeno_attacker, XENO_CURTAIN_PULL_DELAY, NONE, src, BUSY_ICON_FRIENDLY))
		return
	xeno_attacker.do_attack_animation(src, ATTACK_EFFECT_CLAW)
	xeno_attacker.visible_message(span_danger("\The [xeno_attacker] pulls [src] down and slices it apart!"), \
	span_danger("You pull the [src] down and rip it to shreds!"), null, 5)
	deconstruct(src)

/obj/structure/curtain/proc/toggle()
	opacity = !opacity
	if(opacity)
		icon_state = initial_icon_state
		layer = ABOVE_MOB_LAYER
	else
		icon_state += "_open"
		layer = OBJ_LAYER

/obj/structure/curtain/shower
	name = "shower curtain"
	color = "#ACD1E9"
	alpha = 200

/obj/structure/curtain/black
	name = "black curtain"
	color = "#6d6d6d"

/obj/structure/curtain/medical
	name = "plastic curtain"
	icon_state = "medicalcurtain"
	initial_icon_state = "medicalcurtain"
	color = "#B8F5E3"
	alpha = 200

/obj/structure/curtain/temple
	name = "fabric curtain"
	color = "#690000"
	icon_state = "fabric_curtain"
	initial_icon_state = "fabric_curtain"
	alpha = 230
	possiblesounds = list(
		'sound/effects/clothcurtain.ogg',
	)
	stack_type = /obj/item/stack/sheet/cloth

/obj/structure/curtain/open/shower
	name = "shower curtain"
	color = "#ACD1E9"
	alpha = 200

/obj/structure/curtain/open/black
	name = "black curtain"
	color = "#222222"

/obj/structure/curtain/open/temple
	name = "black curtain"
	color = "#690000"
	icon_state = "fabric_curtain_open"
	alpha = 230
	stack_type = /obj/item/stack/sheet/cloth

/obj/structure/curtain/open/medical
	name = "plastic curtain"
	color = "#B8F5E3"
	alpha = 200

#undef XENO_CURTAIN_PULL_DELAY
