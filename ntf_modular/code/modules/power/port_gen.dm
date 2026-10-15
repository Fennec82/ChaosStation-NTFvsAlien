

/obj/machinery/power/port_gen/pacman/empty
	start_full = FALSE

/obj/machinery/power/port_gen/pacman/super/empty
	start_full = FALSE

/obj/machinery/power/port_gen/pacman/preset
	anchored = TRUE
	power_output = 4

/obj/machinery/power/port_gen/pacman/preset/Initialize(mapload)
	. = ..()
	if(SSticker.HasRoundStarted())
		TogglePower()
		return
	else
		RegisterSignal(SSdcs, COMSIG_GLOB_GAMEMODE_LOADED, PROC_REF(TogglePower))
		return

/obj/machinery/power/port_gen/pacman/super/preset
	anchored = TRUE
	power_output = 4

/obj/machinery/power/port_gen/pacman/super/preset/Initialize(mapload)
	. = ..()
	if(SSticker.HasRoundStarted())
		TogglePower()
		return
	else
		RegisterSignal(SSdcs, COMSIG_GLOB_GAMEMODE_LOADED, PROC_REF(TogglePower))
		return

/obj/machinery/power/port_gen/pacman/mrs/preset
	anchored = TRUE
	power_output = 4

/obj/machinery/power/port_gen/pacman/mrs/preset/Initialize(mapload)
	. = ..()
	if(SSticker.HasRoundStarted())
		TogglePower()
		return
	else
		RegisterSignal(SSdcs, COMSIG_GLOB_GAMEMODE_LOADED, PROC_REF(TogglePower))
		return


/obj/effect/spawner/random/engineering/structure/powergenerator/preset
	name = "preset generator spawner"
	icon_state = "random_generator"
	spawn_loot_chance = 75
	loot = list(
		/obj/machinery/power/port_gen/pacman/preset = 9,
		/obj/machinery/power/port_gen/pacman/mrs/preset = 1,
	)

/obj/effect/spawner/random/engineering/structure/powergenerator/superweighted/preset
	spawn_loot_chance = 90
	name = "preset super generator spawner"
	icon_state = "random_generator_super"
	loot = list(
		/obj/machinery/power/port_gen/pacman/super/preset = 9,
		/obj/effect/spawner/random/engineering/structure/powergenerator/preset = 1,
	)

/obj/effect/spawner/random/engineering/structure/powergenerator/preset/guaranteed
	name = "preset generator spawner (guaranteed)"
	icon_state = "random_generator"
	spawn_loot_chance = 100
	loot = list(
		/obj/machinery/power/port_gen/pacman/preset = 9,
		/obj/machinery/power/port_gen/pacman/mrs/preset = 1,
	)

/obj/effect/spawner/random/engineering/structure/powergenerator/superweighted/preset/guaranteed
	spawn_loot_chance = 100
	name = "preset super generator spawner (guaranteed)"
	icon_state = "random_generator_super"
	loot = list(
		/obj/machinery/power/port_gen/pacman/super/preset = 9,
		/obj/effect/spawner/random/engineering/structure/powergenerator/preset/guaranteed = 1,
	)
