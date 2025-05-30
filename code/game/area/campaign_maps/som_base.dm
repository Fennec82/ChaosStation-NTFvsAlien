//rocinanteBase AREAS//
/area/rocinante_base
	name = "rocinante Polar Base"
	icon_state = "dark"
	area_flags = ALWAYS_RADIO

/area/rocinante_base/ground
	name = "Ground"
	icon_state = "green"
	always_unpowered = TRUE
	minimap_color = MINIMAP_AREA_COLONY
	ambience = list('sound/ambience/ambi_snow.ogg')

/area/rocinante_base/surface
	name = "Surface"
	icon_state = "red"

/area/rocinante_base/surface/building
	name = "Rocinante Interior"
	icon_state = "clear"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COLONY

/area/rocinante_base/surface/building/building_underground
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_CAVES

/area/rocinante_base/ground/underground
	name = "rocinante Base Underground"
	icon_state = "cave"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES

//landingZone
/area/rocinante_base/surface/landing

/area/rocinante_base/surface/landing/landing_pad_one
	name = "Landing Pad 1"
	icon_state = "landing_pad"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/landing/landing_pad_one_external
	name = "Landing Zone 1"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/landing/landing_pad_two
	name = "Landing Pad 2"
	icon_state = "landing_pad"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/landing/landing_pad_two_external
	name = "Landing Zone 2"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_LZ

//BaseGround
/area/rocinante_base/ground/base_se
	name ="Southeast Base"
	icon_state = "southeast"

/area/rocinante_base/ground/base_s
	name ="Southern Base"
	icon_state = "south"

/area/rocinante_base/ground/base_sw
	name ="Southwest Base"
	icon_state = "southwest"

/area/rocinante_base/ground/base_w
	name ="Western Base"
	icon_state = "west"

/area/rocinante_base/ground/base_e
	name ="Eastern Base"
	icon_state = "east"

/area/rocinante_base/ground/base_nw
	name ="Northwest Base"
	icon_state = "northwest"

/area/rocinante_base/ground/base_n
	name ="Northern Base"
	icon_state = "north"

/area/rocinante_base/ground/base_ne
	name ="Northeast Base"
	icon_state = "northeast"

/area/rocinante_base/ground/base_cent
	name ="Central Base"
	icon_state = "central"

/area/rocinante_base/ground/southern_containers
	name ="Southern container storage"
	icon_state = "primarystorage"
	minimap_color = MINIMAP_AREA_REQ

/area/rocinante_base/ground/firing_range
	name ="Firing range"
	icon_state = "armory"

//BaseCaves
/area/rocinante_base/ground/underground/cave
	name = "Underground Caves"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveN
	name = "Northern Caves"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveCent
	name = "Central Caves"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveE
	name = "Eastern Caves"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveS
	name = "Southern Caves"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveW
	name = "Western Caves"
	icon_state = "cave"

//BaseBuildings

//admin
/area/rocinante_base/surface/building/administration
	name = "Administration"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/rocinante_base/surface/building/administration/breakroom
	name = "Administration Break Room"

/area/rocinante_base/surface/building/administration/command
	name = "Logistics command"

/area/rocinante_base/surface/building/administration/north_com
	name = "Northern command section"

/area/rocinante_base/surface/building/administration/central_com
	name = "Central command section"

/area/rocinante_base/surface/building/administration/south_com
	name = "Southern command section"

/area/rocinante_base/surface/building/administration/comm_post
	name = "Communication post"

/area/rocinante_base/surface/building/administration/meeting
	name = "Meeting rooms"

/area/rocinante_base/surface/building/administration/air_com
	name = "Southern air command section"

/area/rocinante_base/surface/building/administration/north_air_com
	name = "Northern air command section"

//living
/area/rocinante_base/surface/building/living
	name = "living"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/rocinante_base/surface/building/living/prep
	name = "Marine Preparations"
	minimap_color = MINIMAP_AREA_PREP

/area/rocinante_base/surface/building/living/barracks
	name = "Marine barracks"
	minimap_color = MINIMAP_AREA_PREP

/area/rocinante_base/surface/building/living/west_barracks
	name = "Western barracks"

/area/rocinante_base/surface/building/living/po_quarters
	name = "Pilot quarters"

/area/rocinante_base/surface/building/living/laundromat
	name = "Laundromat"

/area/rocinante_base/surface/building/living/bar
	name = "Bar"

/area/rocinante_base/surface/building/living/janitor
	name = "Janitorial closet"
	icon_state = "janitor"

/area/rocinante_base/surface/building/living/chapel_ne
	name = "Northeastern Chapel"
	icon_state = "chapel"

//tram
/area/rocinante_base/surface/building/tramstation
	name = "Tram Station"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/building/tramstation/tramstation_nw
	name = "Northwestern Tram Station"

/area/rocinante_base/surface/building/tramstation/tramstation_cent
	name = "Central Tram Station"

/area/rocinante_base/surface/building/tramstation/tramstation_e
	name = "Eastern Tram Station"

//sci
/area/rocinante_base/surface/building/science
	name = "Science"
	icon_state = "toxlab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/rocinante_base/surface/building/science/research_lab
	name = "Central Research Labs"

/area/rocinante_base/surface/building/science/crystal_lab
	name = "Crystal Research Labs"

/area/rocinante_base/surface/building/science/tele_lab
	name = "Teleportation Research Labs"

/area/rocinante_base/surface/building/science/bio_lab
	name = "Biological Research Labs"
	icon_state = "xeno_lab"

/area/rocinante_base/surface/building/science/complex_hall
	name = "Western Research Complex Hallway"
	icon_state = "purple"

/area/rocinante_base/surface/building/science/complex_hall_e
	name = "Eastern Research Complex Hallway"
	icon_state = "purple"

/area/rocinante_base/surface/building/science/break_room
	name = "Research break area"

//security
/area/rocinante_base/surface/building/security
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/rocinante_base/surface/building/security/hub
	name = "Security hub"

/area/rocinante_base/surface/building/security/brig
	name = "Brig"

/area/rocinante_base/surface/building/security/sec_dorms
	name = "Security dorms"

/area/rocinante_base/surface/building/security/complex_sec
	name = "Research Complex Security Post"

/area/rocinante_base/surface/building/security/garage_sec
	name = "Vehicle Garage Security Post"

/area/rocinante_base/surface/building/security/medical_sec
	name = "Medical Security Post"

/area/rocinante_base/surface/building/security/west_sec
	name = "Western Security Post"

/area/rocinante_base/surface/building/security/command_sec
	name = "Command Security Post"

//cargo
/area/rocinante_base/surface/building/cargo
	name = "Cargo"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_REQ

/area/rocinante_base/surface/building/cargo/vehicle_garage
	name = "Vehicle Garage"

/area/rocinante_base/surface/building/cargo/southern_aux
	name = "Southern auxiliary storage"

/area/rocinante_base/surface/building/cargo/air_storage
	name = "Munitions storage"

//engie
/area/rocinante_base/surface/building/engineering
	name = "Engineering"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI

/area/rocinante_base/surface/building/engineering/north_smes
	name = "Northern SMES station"

/area/rocinante_base/surface/building/engineering/south_smes
	name = "Southern SMES station"

//medical
/area/rocinante_base/surface/building/medical
	name = "Medical"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

//misc
/area/rocinante_base/surface/building/office_n
	name = "Northern Office Building"
	icon_state = "law"

/area/rocinante_base/surface/building/north_aux
	name = "Northern auxiliary storage"

/area/rocinante_base/surface/building/central_aux
	name = "Central auxiliary storage"

/area/rocinante_base/surface/building/command_hall
	name = "Northern command hallway"

/area/rocinante_base/surface/building/southern_construction
	name = "Southern construction site"

/area/rocinante_base/surface/building/mining_construction
	name = "Mining construction site"

/area/rocinante_base/surface/building/lz_control
	name = "Landing zone control"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/building/tram_line
	name = "Tram line"
	icon_state = "yellow"

/area/rocinante_base/surface/building/west_aux
	name = "Western auxiliary storage"

/area/rocinante_base/surface/building/train_station
	name = "Ttrain Station"
	icon_state = "landing_pad_ext"
	outside = FALSE
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_REQ_CAVE

/// canora_desert new base

/area/canora_desert/surface/building/command
	name = "Command Dome"
	icon_state = "blueold"
	ambience = list('sound/ambience/ambimalf.ogg')
	minimap_color = MINIMAP_AREA_COMMAND
	ceiling = CEILING_METAL

/area/canora_desert/surface/outside/desert
	name = "Canora Desert"
	icon_state = "transparent"
	ambience = list('sound/ambience/ambiwind.ogg', 'sound/ambience/ambiatmos2.ogg')
	ceiling = CEILING_NONE

/area/canora_desert/surface/underground/cave
	name = "North Caves"
	icon_state = "north"
	ceiling = CEILING_DEEP_UNDERGROUND
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambigen11.ogg')

/area/canora_desert/surface/underground/mines
	name = "South Mining"
	icon_state = "south"
	ceiling = CEILING_DEEP_UNDERGROUND
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambigen11.ogg')
/area/canora_desert/surface/building/closed
	name = "off borders"
	icon_state = "dark"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/canora_desert/surface/building/abandoned_wooden_building
	name = "abandoned wooden building"
	ceiling = CEILING_METAL
	icon_state = "blank"
	ambience = list('sound/ambience/ambiwood.ogg')
/area/canora_desert/surface/building/abandoned_wooden_building2
	name = "abandoned wooden building"
	ceiling = CEILING_METAL
	icon_state = "blank"
	ambience = list('sound/ambience/ambiwood.ogg')
/area/canora_desert/surface/building/street_food_canora
	name = "street food"
	ceiling = CEILING_METAL
	icon_state = "blank"
/area/canora_desert/surface/building/crashed
	name = "utterly destroyed building"
	ceiling = CEILING_METAL
	icon_state = "blank"
	ambience = list('sound/ambience/ambiwood.ogg')
/area/canora_desert/surface/building/police_station
	name = "Police Station"
	icon_state = "security"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC

/area/canora_desert/surface/building/som_engineering
	name = "SOM Engineering"
	icon_state = "yellow"
	ambience = list('sound/ambience/ambigen1.ogg', 'sound/ambience/ambigen10.ogg')
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_ENGI

/area/canora_desert/surface/building/som_medical
	name = "SOM Sanitary"
	icon_state = "medbay1"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_MEDBAY

/area/canora_desert/surface/building/som_janitor
	name = "Janitorial Custody"
	icon_state = "purple"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_RESEARCH

/area/canora_desert/surface/building/som_barracks
	name = "SOM barracks"
	icon_state = "living"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_LIVING

/area/canora_desert/surface/building/som_restrooms
	name = "Restrooms"
	icon_state = "green"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_LIVING

/area/canora_desert/surface/building/som_smaint
	name = "South Maintenance"
	ambience = list('sound/ambience/ambibigroom.ogg')
	icon_state = "dark"
	ceiling = CEILING_METAL

/area/canora_desert/surface/building/som_engimedmaint
	name = "Engi-Med Maintenance"
	ambience = list('sound/ambience/ambibigroom.ogg')
	icon_state = "dark"
	ceiling = CEILING_METAL

/area/canora_desert/surface/building/som_mechbay_maint
	name = "Robotics Maintenance"
	ambience = list('sound/ambience/ambibigroom.ogg')
	icon_state = "dark"
	ceiling = CEILING_METAL

/area/canora_desert/surface/building/som_torturechamber
	name = "Torture Chamber"
	icon_state = "red"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC

/area/canora_desert/surface/building/som_security_hallway
	name = "Security Hallway"
	icon_state = "brig"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC

/area/canora_desert/surface/building/som_armory
	name = "Secure Armory"
	icon_state = "armory"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC

/area/canora_desert/surface/building/som_prison
	name = "Prisoner Contaiment"
	icon_state = "orange"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC

/area/canora_desert/surface/building/som_kitchen
	name = "Food Court"
	icon_state = "living"
	ceiling = CEILING_METAL

/area/canora_desert/surface/building/som_robotics
	name = "Robotics Hallway"
	icon_state = "explored"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_RESEARCH

/area/canora_desert/surface/building/som_sservicing
	name = "Robot Servicing"
	icon_state = "explored"
	ceiling = CEILING_METAL

/area/canora_desert/surface/building/som_mechbay
	name = "Mech Bay"
	icon_state = "storage"
	ceiling = CEILING_METAL

/area/canora_desert/surface/building/som_admiral
	name = "Admiral Quarters"
	icon_state = "bluenew"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_COMMAND

/area/canora_desert/surface/building/som_surgery1
	name = "Surgery Operation Room 1"
	icon_state = "medbay"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_MEDBAY

/area/canora_desert/surface/building/som_surgery2
	name = "Surgery Operation Room 2"
	icon_state = "medbay"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_MEDBAY

/area/canora_desert/surface/building/som_chemistry
	name = "Chemistry"
	icon_state = "explored"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_RESEARCH

/area/canora_desert/surface/building/som_morgue
	name = "Morgue"
	icon_state = "blue"
	ambience = list('sound/ambience/ambimo1.ogg', 'sound/ambience/ambimo2.ogg')
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_MEDBAY

/area/canora_desert/surface/building/som_nmaint
	name = "North Maintenance"
	ambience = list('sound/ambience/ambibigroom.ogg')
	icon_state = "dark"
	ceiling = CEILING_METAL

/area/canora_desert/surface/building/som_floortwomain
	name = "Main Tower Area"
	ambience = list('sound/ambience/ambibigroom.ogg')
	icon_state = "red"
	ceiling = CEILING_METAL

/area/canora_desert/surface/building/som_engidome
	name = "SMES Dome"
	icon_state = "engine_smes"

	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_ENGI

/area/canora_desert/surface/building/som_requesitions
	name = "Syndicate Delivery"
	ambience = list('sound/ambience/ambibigroom.ogg', 'sound/ambience/ambicargo.ogg')
	icon_state = "req"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_REQ

/area/canora_desert/surface/building/som_spider
	name = "Aviary"
	icon_state = "green"
	ceiling = CEILING_METAL
