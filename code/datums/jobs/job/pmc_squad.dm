/datum/job/pmc/squad
	job_category =  JOB_CAT_PMC
	supervisors = "NTC command"
	selection_color = "#ffeeee"
	faction = FACTION_TERRAGOV

/datum/job/pmc/squad/radio_help_message(mob/M)
	. = ..()
	to_chat(M, {"You're a part of hired guns commanded by NTC. Follow orders, no screw ups. Hooah?"})

//PMC Standard
/datum/job/pmc/squad/standard
	title = PMC_STANDARD
	paygrade = "PMC1"
	comm_title = "PMC"
	minimap_icon = "pmc"
	total_positions = -1
	skills_type = /datum/skills/pmc
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	minimal_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	job_flags = JOB_FLAG_LATEJOINABLE|JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_ALLOWS_PREFS_GEAR|JOB_FLAG_PROVIDES_BANK_ACCOUNT|JOB_FLAG_ADDTOMANIFEST|JOB_FLAG_PROVIDES_SQUAD_HUD|JOB_FLAG_CAN_SEE_ORDERS|JOB_FLAG_OVERRIDELATEJOINSPAWN
	outfit = /datum/outfit/job/pmc/squad/standard
	jobworth = list(
		/datum/job/xenomorph = LARVA_POINTS_REGULAR,
		/datum/job/terragov/squad/smartgunner = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/corpsman = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/engineer = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/silicon/synthetic = SYNTH_POINTS_REGULAR,
		/datum/job/terragov/command/mech_pilot = MECH_POINTS_REGULAR,
	)

/datum/outfit/job/pmc/squad/standard
	name = "PMC Standard"
	jobtype = /datum/job/pmc/squad/standard

	id = /obj/item/card/id/dogtag/standard
	ears = /obj/item/radio/headset/mainship/marine/pmc


//PMC medic
/datum/job/pmc/squad/medic
	title = PMC_MEDIC
	paygrade = "PMC2"
	comm_title = "PMC"
	minimap_icon = "pmc"
	skills_type = /datum/skills/combat_medic/pmc
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	minimal_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	total_positions = -1
	job_flags = JOB_FLAG_LATEJOINABLE|JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_ALLOWS_PREFS_GEAR|JOB_FLAG_PROVIDES_BANK_ACCOUNT|JOB_FLAG_ADDTOMANIFEST|JOB_FLAG_PROVIDES_SQUAD_HUD|JOB_FLAG_CAN_SEE_ORDERS|JOB_FLAG_OVERRIDELATEJOINSPAWN
	outfit = /datum/outfit/job/pmc/squad/medic
	jobworth = list(
		/datum/job/xenomorph = LARVA_POINTS_REGULAR,
		/datum/job/terragov/squad/smartgunner = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/corpsman = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/engineer = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/silicon/synthetic = SYNTH_POINTS_REGULAR,
		/datum/job/terragov/command/mech_pilot = MECH_POINTS_REGULAR,
	)

/datum/outfit/job/pmc/squad/medic
	name = "PMC Medic"
	jobtype = /datum/outfit/job/pmc/squad/medic

	id = /obj/item/card/id/dogtag/corpsman
	ears = /obj/item/radio/headset/mainship/marine/pmc
	glasses = /obj/item/clothing/glasses/hud/health

//PMC Engineer
/datum/job/pmc/squad/engineer
	title = PMC_ENGINEER
	paygrade = "PMC2"
	comm_title = "PMC"
	minimap_icon = "pmc"
	skills_type = /datum/skills/combat_engineer/pmc
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	minimal_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	total_positions = -1
	job_flags = JOB_FLAG_LATEJOINABLE|JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_ALLOWS_PREFS_GEAR|JOB_FLAG_PROVIDES_BANK_ACCOUNT|JOB_FLAG_ADDTOMANIFEST|JOB_FLAG_PROVIDES_SQUAD_HUD|JOB_FLAG_CAN_SEE_ORDERS|JOB_FLAG_OVERRIDELATEJOINSPAWN
	outfit = /datum/outfit/job/pmc/squad/engineer
	jobworth = list(
		/datum/job/xenomorph = LARVA_POINTS_REGULAR,
		/datum/job/terragov/squad/smartgunner = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/corpsman = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/engineer = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/silicon/synthetic = SYNTH_POINTS_REGULAR,
		/datum/job/terragov/command/mech_pilot = MECH_POINTS_REGULAR,
	)

/datum/outfit/job/pmc/squad/engineer
	name = "PMC Engineer"
	jobtype = /datum/outfit/job/pmc/squad/engineer

	id = /obj/item/card/id/dogtag/engineer
	ears = /obj/item/radio/headset/mainship/marine/pmc
	glasses = /obj/item/clothing/glasses/hud/health

//PMC Gunner
/datum/job/pmc/squad/gunner
	title = PMC_GUNNER
	paygrade = "PMC2"
	comm_title = "PMC"
	minimap_icon = "pmc"
	skills_type = /datum/skills/smartgunner/pmc
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	minimal_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	total_positions = -1
	job_flags = JOB_FLAG_LATEJOINABLE|JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_ALLOWS_PREFS_GEAR|JOB_FLAG_PROVIDES_BANK_ACCOUNT|JOB_FLAG_ADDTOMANIFEST|JOB_FLAG_PROVIDES_SQUAD_HUD|JOB_FLAG_CAN_SEE_ORDERS|JOB_FLAG_OVERRIDELATEJOINSPAWN
	outfit = /datum/outfit/job/pmc/squad/gunner
	jobworth = list(
		/datum/job/xenomorph = LARVA_POINTS_REGULAR,
		/datum/job/terragov/squad/smartgunner = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/corpsman = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/engineer = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/silicon/synthetic = SYNTH_POINTS_REGULAR,
		/datum/job/terragov/command/mech_pilot = MECH_POINTS_REGULAR,
	)

/datum/outfit/job/pmc/squad/gunner
	name = "PMC Gunner"
	jobtype = /datum/job/pmc/squad/gunner

	id = /obj/item/card/id/dogtag/smartgun
	ears = /obj/item/radio/headset/mainship/marine/pmc


//PMC Specialist
/datum/job/pmc/squad/sniper
	title = PMC_SNIPER
	paygrade = "PMC3"
	comm_title = "PMC"
	minimap_icon = "pmc"
	total_positions = 3
	skills_type = /datum/skills/specialist/pmc
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	minimal_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_ENGINEERING, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	job_flags = JOB_FLAG_LATEJOINABLE|JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_ALLOWS_PREFS_GEAR|JOB_FLAG_PROVIDES_BANK_ACCOUNT|JOB_FLAG_ADDTOMANIFEST|JOB_FLAG_PROVIDES_SQUAD_HUD|JOB_FLAG_CAN_SEE_ORDERS|JOB_FLAG_OVERRIDELATEJOINSPAWN
	outfit = /datum/outfit/job/pmc/squad/sniper
	jobworth = list(
		/datum/job/xenomorph = LARVA_POINTS_REGULAR,
		/datum/job/terragov/squad/smartgunner = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/corpsman = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/engineer = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/silicon/synthetic = SYNTH_POINTS_REGULAR,
		/datum/job/terragov/command/mech_pilot = MECH_POINTS_REGULAR,
	)

/datum/outfit/job/pmc/squad/sniper
	name = "PMC Specialist"
	jobtype = /datum/job/pmc/squad/sniper

	id = /obj/item/card/id/dogtag/specialist
	ears = /obj/item/radio/headset/mainship/marine/pmc
	glasses = /obj/item/clothing/glasses/hud/health


//PMC Leader
/datum/job/pmc/squad/leader
	title = PMC_LEADER
	paygrade = "PMC4"
	comm_title = "PMC"
	minimap_icon = "pmc"
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_ENGINEERING, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_CIVILIAN_ENGINEERING, ACCESS_MARINE_REMOTEBUILD, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	minimal_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_ENGINEERING, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_CIVILIAN_ENGINEERING, ACCESS_MARINE_REMOTEBUILD, ACCESS_NT_PMC_MEDICAL, ACCESS_NT_PMC_COMMON)
	skills_type = /datum/skills/sl/pmc
	total_positions = 5
	job_flags = JOB_FLAG_LATEJOINABLE|JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_ALLOWS_PREFS_GEAR|JOB_FLAG_PROVIDES_BANK_ACCOUNT|JOB_FLAG_ADDTOMANIFEST|JOB_FLAG_PROVIDES_SQUAD_HUD|JOB_FLAG_CAN_SEE_ORDERS|JOB_FLAG_OVERRIDELATEJOINSPAWN
	outfit = /datum/outfit/job/pmc/squad/leader
	jobworth = list(
		/datum/job/xenomorph = LARVA_POINTS_REGULAR,
		/datum/job/terragov/squad/smartgunner = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/corpsman = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/squad/engineer = SMARTIE_POINTS_REGULAR,
		/datum/job/terragov/silicon/synthetic = SYNTH_POINTS_REGULAR,
		/datum/job/terragov/command/mech_pilot = MECH_POINTS_REGULAR,
	)

/datum/outfit/job/pmc/squad/leader
	name = "PMC Leader"
	jobtype = /datum/job/pmc/squad/leader

	id = /obj/item/card/id/dogtag/leader
	ears = /obj/item/radio/headset/mainship/marine/pmc
	glasses = /obj/item/clothing/glasses/hud/health
