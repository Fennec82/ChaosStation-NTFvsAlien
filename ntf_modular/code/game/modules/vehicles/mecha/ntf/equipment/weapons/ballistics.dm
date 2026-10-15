/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/exosuit_lmg
	name = "\improper exosuit-mounted R-84 LMG"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "A exosuit-mounted heavy machinegun, offering a good combination of mobility and firepower thanks to being on an exosuit."
	icon_state = "smg"
	muzzle_iconstate = "muzzle_flash"
	fire_sound = 'sound/weapons/guns/fire/m16.ogg'
	mech_flags = EXOSUIT_MODULE_NTF
	ammotype = /datum/ammo/bullet/rifle/heavy/ap //its still a lmg so cant give it hmg
	max_integrity = 75
	//basically a MG-27?
	projectiles = 150
	projectiles_cache = 310
	projectiles_cache_max = 310
	variance = 5
	projectile_delay = 0.2 SECONDS
	slowdown = 0
	rearm_time = 3 SECONDS
	harmful = TRUE
	weight = 5
	ammo_type = EXOSUIT_AMMO_LMG
	hud_icons = list("smg", "smg_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC
	cooldown_key = MECH_COOLDOWN_KEY_RAPIDFIRE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/exosuit_smg
	name = "\improper exosuit-mounted SMG"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "A mounted heavy submachinegun, it offers excellent rate of fire and stability."
	icon_state = "smg"
	muzzle_iconstate = "muzzle_flash"
	fire_sound = 'sound/weapons/guns/fire/colt.ogg'
	mech_flags = EXOSUIT_MODULE_NTF|EXOSUIT_MODULE_COMBAT
	//smg25 ap like
	ammotype = /datum/ammo/bullet/smg/ap //scary
	max_integrity = 75
	projectiles = 60
	projectiles_cache = 840
	projectiles_cache_max = 840
	variance = 10
	projectile_delay = 0.2 SECONDS
	slowdown = 0
	rearm_time = 1.5 SECONDS
	harmful = TRUE
	weight = 5
	ammo_type = EXOSUIT_AMMO_SMG
	hud_icons = list("smg", "smg_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC
	cooldown_key = MECH_COOLDOWN_KEY_RAPIDFIRE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/exosuit_gl
	name = "\improper exosuit-mounted grenade launcher"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "A exosuit-mounted four-barrel grenade launcher, chambered in low-pressure, high-explosive 40mm grenades."
	icon_state = "smg"
	muzzle_iconstate = "muzzle_flash"
	fire_sound = 'sound/weapons/guns/fire/mortar_fire.ogg'
	mech_flags = EXOSUIT_MODULE_NTF|EXOSUIT_MODULE_COMBAT
	ammotype = /datum/ammo/grenade_container
	max_integrity = 75

	projectiles = 4
	projectiles_cache = 34
	projectiles_cache_max = 34
	variance = 5
	projectile_delay = 1.5 SECONDS
	slowdown = 0
	rearm_time = 5 SECONDS
	harmful = TRUE
	weight = 5
	ammo_type = EXOSUIT_AMMO_GRENADE
	hud_icons = list("smg", "smg_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC
	cooldown_key = MECH_COOLDOWN_KEY_RAPIDFIRE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/exosuit_br
	name = "\improper exosuit-mounted 'Rangemaster' battle rifle"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "A mounted battle rifle, it offers good precision and heavy stopping power."
	icon_state = "smg"
	muzzle_iconstate = "muzzle_flash"
	fire_sound = 'sound/mecha/weapons/mech_smg.ogg'
	mech_flags = EXOSUIT_MODULE_NTF|EXOSUIT_MODULE_COMBAT
	ammotype = /datum/ammo/bullet/rifle/standard_dmr
	max_integrity = 75

	projectiles = 40
	projectiles_cache = 120
	projectiles_cache_max = 120
	variance = 1.5
	projectile_delay = 0.3 SECONDS //gotta be better than regular dmr somehow
	slowdown = 0
	rearm_time = 3 SECONDS
	harmful = TRUE
	weight = 5
	ammo_type = EXOSUIT_AMMO_BATTLERIFLE
	hud_icons = list("smg", "smg_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC
	cooldown_key = MECH_COOLDOWN_KEY_RAPIDFIRE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/exosuit_minigun
	name = "\improper exosuit-mounted minigun"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "A exosuit-mounted minigun. Requires a longer wind-up before firing, but is excellent for providing large-volume supportive fire."
	icon_state = "smg"
	muzzle_iconstate = "muzzle_flash"
	fire_sound = 'sound/weapons/guns/fire/ppsh.ogg'
	mech_flags = EXOSUIT_MODULE_NTF|EXOSUIT_MODULE_COMBAT
	ammotype = /datum/ammo/bullet/minigun
	max_integrity = 75
	projectiles = 500
	projectiles_cache = 500 //its like two vindicator packs
	projectiles_cache_max = 500
	variance = 2
	projectile_delay = 0.1 SECONDS
	slowdown = 0
	rearm_time = 8 SECONDS
	harmful = TRUE
	weight = 5
	ammo_type = EXOSUIT_AMMO_MINIGUN
	hud_icons = list("smg", "smg_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC
	windup_delay = 1 SECONDS
	cooldown_key = MECH_COOLDOWN_KEY_RAPIDFIRE
