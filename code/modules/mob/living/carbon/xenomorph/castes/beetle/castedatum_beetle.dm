/datum/xeno_caste/beetle
	caste_name = "Beetle"
	display_name = "Beetle"
	upgrade_name = ""
	caste_desc = ""
	wound_type = ""
	base_strain_type = /mob/living/carbon/xenomorph/beetle
	caste_type_path = /mob/living/carbon/xenomorph/beetle

	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE

	// *** Melee Attacks *** //
	melee_damage = 17

	// *** Speed *** //
	speed = 0

	// *** Plasma *** //
	plasma_max = 320 ///4 forward charges
	plasma_gain = 10

	// *** Health *** //
	max_health = 260

	// *** Flags *** //
	caste_flags = CASTE_DO_NOT_ALERT_LOW_LIFE|CASTE_IS_A_MINION
	can_flags = CASTE_CAN_BE_GIVEN_PLASMA|CASTE_CAN_RIDE_CRUSHER
	caste_traits = null

	// *** Defense *** //
	soft_armor = list(MELEE = 30, BULLET = 30, LASER = 25, ENERGY = 20, BOMB = 20, BIO = 20, FIRE = 30, ACID = 20)

	minimap_icon = "xenominion"

	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/psychic_whisper,
		/datum/action/ability/xeno_action/psychic_influence,
		/datum/action/ability/activable/xeno/impregnate,
		/datum/action/ability/activable/xeno/charge/forward_charge/unprecise,
	)
