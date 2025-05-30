//Baseline portable generator. Has all the default handling. Not intended to be used on it's own (since it generates unlimited power).
/obj/machinery/power/port_gen
	name = "portable generator"
	desc = "A portable generator for emergency backup power."
	icon = 'icons/obj/power.dmi'
	icon_state = "portgen0"
	density = TRUE
	anchored = FALSE
	use_power = NO_POWER_USE

	var/active = FALSE
	var/power_gen = 5000
	var/power_output = 1
	var/consumption = 0
	var/base_icon = "portgen0"
	var/datum/looping_sound/generator/soundloop

/obj/machinery/power/port_gen/Initialize(mapload)
	. = ..()
	soundloop = new(list(src), active)

/obj/machinery/power/port_gen/Destroy()
	QDEL_NULL(soundloop)
	return ..()

/obj/machinery/power/port_gen/attacked_by(obj/item/I, mob/living/user, def_zone)
	. = ..()
	if(!.)
		return FALSE
	record_generator_sabotages(user)
	return TRUE

/obj/machinery/power/port_gen/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	. = ..()
	if(!.)
		return FALSE
	record_generator_sabotages(xeno_attacker)
	return TRUE

/obj/machinery/power/port_gen/should_have_node()
	return anchored

/obj/machinery/power/port_gen/connect_to_network()
	if(!anchored)
		return FALSE
	. = ..()

/obj/machinery/power/port_gen/proc/HasFuel() //Placeholder for fuel check.
	return TRUE

/obj/machinery/power/port_gen/proc/UseFuel() //Placeholder for fuel use.
	return

/obj/machinery/power/port_gen/proc/DropFuel()
	return

/obj/machinery/power/port_gen/proc/handleInactive()
	return

/obj/machinery/power/port_gen/proc/TogglePower()
	SEND_SIGNAL(src, COMSIG_PORTGEN_POWER_TOGGLE, !active)
	if(active)
		active = FALSE
		update_icon()
		soundloop.stop()
	else if(HasFuel())
		active = TRUE
		START_PROCESSING(SSmachines, src)
		update_icon()
		soundloop.start()

/obj/machinery/power/port_gen/update_icon_state()
	. = ..()
	icon_state = "[base_icon]"

/obj/machinery/power/port_gen/process()
	if(active)
		if(!HasFuel() || !anchored)
			TogglePower()
			return
		if(powernet)
			add_avail(power_gen * power_output)
		UseFuel()
		SEND_SIGNAL(src, COMSIG_PORTGEN_PROCESS)
	else
		handleInactive()

/obj/machinery/power/port_gen/examine(mob/user)
	. = ..()
	. += "It is[!active?"n't":""] running."

/////////////////
// P.A.C.M.A.N //
/////////////////
/obj/machinery/power/port_gen/pacman
	name = "\improper P.A.C.M.A.N.-type portable generator"
	circuit = /obj/item/circuitboard/machine/pacman
	var/sheets = 0
	var/max_sheets = 10
	var/sheet_name = ""
	var/sheet_path = /obj/item/stack/sheet/mineral/phoron
	var/sheet_left = 0 // How much is left of the sheet
	var/time_per_sheet = 300
	var/current_heat = 0
	power_gen = 15000
	interaction_flags = INTERACT_MACHINE_TGUI

/obj/machinery/power/port_gen/pacman/Initialize(mapload)
	. = ..()
	if(anchored)
		connect_to_network()
	component_parts = list()
	component_parts += new /obj/item/stock_parts/matter_bin(src)
	component_parts += new /obj/item/stock_parts/micro_laser(src)
	component_parts += new /obj/item/stack/cable_coil(src)
	component_parts += new /obj/item/stack/cable_coil(src)
	component_parts += new /obj/item/stock_parts/capacitor(src)
	RefreshParts()

	var/obj/S = sheet_path
	sheet_name = initial(S.name)

/obj/machinery/power/port_gen/pacman/Destroy()
	DropFuel()
	return ..()

/obj/machinery/power/port_gen/pacman/RefreshParts()
	var/temp_rating = 0
	var/consumption_coeff = 0
	for(var/obj/item/stock_parts/SP in component_parts)
		if(istype(SP, /obj/item/stock_parts/matter_bin))
			max_sheets = SP.rating * SP.rating * 50
		else if(istype(SP, /obj/item/stock_parts/capacitor))
			temp_rating += SP.rating
		else
			consumption_coeff += SP.rating
	power_gen = round(initial(power_gen) * temp_rating * 2)
	consumption = consumption_coeff

/obj/machinery/power/port_gen/pacman/examine(mob/user)
	. = ..()
	. += span_notice("The generator has [sheets] units of [sheet_name] fuel left, producing [DisplayPower(power_gen)] per cycle.")
	if(anchored)
		. += span_notice("It is anchored to the ground.")
	if(in_range(user, src) || isobserver(user))
		. += span_notice("The status display reads: Fuel efficiency increased by <b>[(consumption*100)-100]%</b>.")

/obj/machinery/power/port_gen/pacman/HasFuel()
	if(sheets >= 1 / (time_per_sheet / power_output) - sheet_left)
		return TRUE
	return FALSE

/obj/machinery/power/port_gen/pacman/DropFuel()
	if(sheets)
		new sheet_path(drop_location(), sheets)
		sheets = 0

/obj/machinery/power/port_gen/pacman/UseFuel()
	var/needed_sheets = 1 / (time_per_sheet * consumption / power_output)
	var/temp = min(needed_sheets, sheet_left)
	needed_sheets -= temp
	sheet_left -= temp
	sheets -= round(needed_sheets)
	needed_sheets -= round(needed_sheets)
	if (sheet_left <= 0 && sheets > 0)
		sheet_left = 1 - needed_sheets
		sheets--

	var/lower_limit = 56 + power_output * 10
	var/upper_limit = 76 + power_output * 10
	var/bias = 0
	if (power_output > 4)
		upper_limit = 400
		bias = power_output - consumption * (4 - consumption)
	if (current_heat < lower_limit)
		current_heat += 4 - consumption
	else
		current_heat += rand(-7 + bias, 7 + bias)
		if (current_heat < lower_limit)
			current_heat = lower_limit
		if (current_heat > upper_limit)
			current_heat = upper_limit

	if (current_heat > 300)
		overheat()
		qdel(src)

/obj/machinery/power/port_gen/pacman/handleInactive()
	current_heat = max(current_heat - 2, 0)
	if(current_heat == 0)
		STOP_PROCESSING(SSmachines, src)

/obj/machinery/power/port_gen/pacman/proc/overheat()
	explosion(loc, 3, 6, explosion_cause=src)

/obj/machinery/power/port_gen/pacman/attackby(obj/item/O, mob/user, params)
	if(istype(O, sheet_path))
		var/obj/item/stack/addstack = O
		var/amount = min((max_sheets - sheets), addstack.amount)
		if(amount < 1)
			to_chat(user, span_notice("The [src.name] is full!"))
			return
		to_chat(user, span_notice("You add [amount] sheets to the [src.name]."))
		sheets += amount
		addstack.use(amount)
		return
	else if(!active)
		if(O.tool_behaviour == TOOL_WRENCH)
			if(!anchored)
				anchored = TRUE
				connect_to_network()
				to_chat(user, span_notice("You secure the generator to the floor."))
			else if(anchored)
				anchored = FALSE
				disconnect_from_network()
				to_chat(user, span_notice("You unsecure the generator from the floor."))

			playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
			return
		else if(O.tool_behaviour == TOOL_SCREWDRIVER)
			TOGGLE_BITFIELD(machine_stat, PANEL_OPEN)
			O.play_tool_sound(src)
			if(machine_stat & PANEL_OPEN)
				to_chat(user, span_notice("You open the access panel."))
			else
				to_chat(user, span_notice("You close the access panel."))
			return
		//else if(default_deconstruction_crowbar(O))
		//	return
	return ..()

/obj/machinery/power/port_gen/pacman/attack_ai(mob/user)
	interact(user)

/obj/machinery/power/port_gen/pacman/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "PortableGenerator", name)
		ui.open()

/obj/machinery/power/port_gen/pacman/ui_data()
	var/data = list()

	data["active"] = active
	data["sheet_name"] = capitalize(sheet_name)
	data["sheets"] = sheets
	data["stack_percent"] = round(sheet_left * 100, 0.1)

	data["anchored"] = anchored
	data["connected"] = (powernet == null ? 0 : 1)
	data["ready_to_boot"] = anchored && HasFuel()
	data["power_generated"] = DisplayPower(power_gen)
	data["power_output"] = DisplayPower(power_gen * power_output)
	data["power_available"] = (powernet == null ? 0 : DisplayPower(avail()))
	data["current_heat"] = current_heat
	. = data

/obj/machinery/power/port_gen/pacman/ui_act(action, list/params)
	. = ..()
	if(.)
		return
	switch(action)
		if("toggle_power")
			TogglePower()
			. = TRUE

		if("eject")
			if(!active)
				DropFuel()
				. = TRUE

		if("lower_power")
			if (power_output > 1)
				power_output--
				. = TRUE

		if("higher_power")
			if (power_output < 4)
				power_output++
				. = TRUE

/obj/machinery/power/port_gen/pacman/super
	name = "\improper S.U.P.E.R.P.A.C.M.A.N.-type portable generator"
	icon_state = "portgen1"
	base_icon = "portgen1"
	circuit = /obj/item/circuitboard/machine/pacman/super
	sheet_path = /obj/item/stack/sheet/mineral/uranium
	power_gen = 30000
	time_per_sheet = 600

/obj/machinery/power/port_gen/pacman/super/overheat()
	explosion(loc, 4, explosion_cause=src)

/obj/machinery/power/port_gen/pacman/mrs
	name = "\improper M.R.S.P.A.C.M.A.N.-type portable generator"
	base_icon = "portgen2"
	icon_state = "portgen2"
	circuit = /obj/item/circuitboard/machine/pacman/mrs
	sheet_path = /obj/item/stack/sheet/mineral/diamond
	power_gen = 40000
	time_per_sheet = 80

/obj/machinery/power/port_gen/pacman/mrs/overheat()
	explosion(loc, 4, explosion_cause=src)

/obj/machinery/power/port_gen/pacman/mobile_power
	name = "\improper A.D.V.P.A.C.M.A.N.-type portable generator"

/obj/machinery/power/port_gen/pacman/mobile_power/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/mobile_power, active, 10)

/obj/machinery/power/port_gen/pacman/mobile_power/connect_to_network()
	return FALSE // Don't connect this to networks to stop it doubling up

/obj/machinery/power/port_gen/pacman/mobile_power/should_have_node()
	return FALSE // Works by magic
