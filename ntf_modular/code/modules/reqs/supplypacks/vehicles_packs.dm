/*******************************************************************************
VEHICLES
*******************************************************************************/

/datum/supply_packs/vehicles/transporttruck
	name = "Transport Truck Crate"
	contains = list(/obj/structure/largecrate/supply/vehicle/truck)
	cost = 400

/datum/supply_packs/vehicles/transporttrucktreaded
	name = "Treaded Armored Transport Truck Crate"
	contains = list(/obj/structure/largecrate/supply/vehicle/truck_treaded)
	cost = 800

/datum/supply_packs/vehicles/transporttruckFS
	name = "Transport Truck Crate (TransCO Supply)"
	contains = list(/obj/structure/largecrate/supply/vehicle/truck)
	cost = 300
	faction_lock = list(FACTION_TERRAGOV, FACTION_ICC)

/datum/supply_packs/vehicles/transporttrucktreadedFS
	name = "Treaded Armored Transport Truck Crate (TransCO Supply)"
	contains = list(/obj/structure/largecrate/supply/vehicle/truck_treaded)
	cost = 600
	faction_lock = list(FACTION_TERRAGOV, FACTION_ICC)
