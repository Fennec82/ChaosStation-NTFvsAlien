/obj/item/clothing/under/pj/red
	name = "red pj's"
	desc = "Sleepwear."
	icon_state = "red_pyjamas"
	worn_icon_state = "w_suit"

/obj/item/clothing/under/pj/blue
	name = "blue pj's"
	desc = "Sleepwear."
	icon_state = "blue_pyjamas"
	worn_icon_state = "w_suit"

/obj/item/clothing/under/captain_fly
	name = "rogue commander's uniform"
	desc = "For the man who doesn't care because he's still free."
	icon_state = "captain_fly"

/obj/item/clothing/under/scratch
	name = "white suit"
	desc = "A white suit, suitable for an excellent host"
	icon_state = "scratch"

/obj/item/clothing/under/sl_suit
	desc = "It's a very amish looking suit."
	name = "amish suit"
	icon_state = "sl_suit"

/obj/item/clothing/under/waiter
	name = "waiter's outfit"
	desc = "It's a very smart uniform with a special pocket for tip."
	icon_state = "waiter"

/obj/item/clothing/under/rank/prisoner
	name = "prison jumpsuit"
	desc = "It's standardised NTC prisoner-wear. Its suit sensors are stuck in the \"Fully On\" position."
	icon_state = "prisoner"
	worn_icon_state = "prisoner"
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS

/obj/item/clothing/under/sexyclown
	name = "sexy-clown suit"
	desc = "It makes you look HONKable!"
	icon_state = "sexyclown"
	worn_icon_state = "sexyclown"
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/rank/vice
	name = "vice officer's jumpsuit"
	desc = "It's the standard issue pretty-boy outfit, as seen on Holo-Vision."
	icon_state = "vice"
	worn_icon_state = "gy_suit"
	adjustment_variants = list()

/obj/item/clothing/under/rank/centcom_officer
	desc = "It's a jumpsuit worn by CentCom Officers."
	name = "\improper CentCom officer's jumpsuit"
	icon_state = "officer"
	worn_icon_state = "g_suit"
	adjustment_variants = list()

/obj/item/clothing/under/rank/centcom_commander
	desc = "It's a jumpsuit worn by CentCom's highest-tier Commanders."
	name = "\improper CentCom officer's jumpsuit"
	icon_state = "centcom"
	worn_icon_state = "dg_suit"
	adjustment_variants = list()

/obj/item/clothing/under/rank/centcom_commander/sa
	desc = "It's a jumpsuit worn by Spatial Agents."
	name = "\improper spatial agent's jumpsuit"
	has_sensor = 0
	sensor_mode = 0
	siemens_coefficient = 0

/obj/item/clothing/under/ert
	name = "ERT tactical uniform"
	desc = "A short-sleeved black uniform, paired with grey digital-camo cargo pants. It looks very tactical."
	icon_state = "ert_uniform"
	worn_icon_state = "bl_suit"

/obj/item/clothing/under/space
	name = "\improper NASA jumpsuit"
	desc = "It has a NASA logo on it and is made of space-proofed materials."
	icon_state = "black"
	worn_icon_state = "bl_suit"
	w_class = WEIGHT_CLASS_BULKY//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection_flags = CHEST|GROIN|LEGS|ARMS //Needs gloves and shoes with cold protection to be fully protected.
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/acj
	name = "administrative cybernetic jumpsuit"
	icon_state = "syndicate"
	worn_icon_state = "bl_suit"
	desc = "it's a cybernetically enhanced jumpsuit used for administrative duties."
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	soft_armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 100, BIO = 100, FIRE = 100, ACID = 100)
	cold_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/obj/item/clothing/under/owl
	name = "owl uniform"
	desc = "A jumpsuit with owl wings. Photorealistic owl feathers! Twooooo!"
	icon_state = "owl"

/obj/item/clothing/under/johnny
	name = "johnny~~ jumpsuit"
	desc = "Johnny~~"
	icon_state = "johnny"

/obj/item/clothing/under/rainbow
	name = "rainbow"
	desc = "rainbow"
	icon_state = "rainbow"

/obj/item/clothing/under/cloud
	name = "cloud"
	desc = "cloud"
	icon_state = "cloud"

/obj/item/clothing/under/psysuit
	name = "dark undersuit"
	desc = "A thick, layered grey undersuit lined with power cables. Feels a little like wearing an electrical storm."
	icon_state = "psysuit"
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/under/gentlesuit
	name = "Gentlemans Suit"
	desc = "A silk black shirt with a white tie and a matching gray vest and slacks. Feels proper."
	icon_state = "gentlesuit"

/obj/item/clothing/under/suit_jacket
	name = "black suit"
	desc = "A black suit and red tie. Very formal."
	icon_state = "black_suit"
	worn_icon_state = "bl_suit"

/obj/item/clothing/under/suit_jacket/detective
	icon_state = "detective"

/obj/item/clothing/under/suit_jacket/detective/alt
	icon_state = "greydet"

/obj/item/clothing/under/suit_jacket/really_black
	name = "executive suit"
	desc = "A formal black suit and red tie, intended for the station's finest."
	icon_state = "really_black_suit"
	worn_icon_state = "bl_suit"

/obj/item/clothing/under/suit_jacket/female
	name = "executive suit"
	desc = "A formal trouser suit for women, intended for the station's finest."
	icon_state = "black_suit_fem"

/obj/item/clothing/under/suit_jacket/red
	name = "red suit"
	desc = "A red suit and blue tie. Somewhat formal."
	icon_state = "red_suit"
	worn_icon_state = "r_suit"

/obj/item/clothing/under/overalls
	name = "laborer's overalls"
	desc = "A set of durable overalls for getting the job done."
	icon_state = "overalls"
	worn_icon_state = "lb_suit"

/obj/item/clothing/under/pirate
	name = "pirate outfit"
	desc = "Yarr."
	icon_state = "pirate"
	armor_protection_flags = CHEST|GROIN|LEGS

/obj/item/clothing/under/soviet
	name = "soviet uniform"
	desc = "For the Motherland!"
	icon_state = "soviet"

/obj/item/clothing/under/redcoat
	name = "redcoat uniform"
	desc = "Looks old."
	icon_state = "redcoat"

/obj/item/clothing/under/kilt
	name = "kilt"
	desc = "Includes shoes and plaid"
	icon_state = "kilt"
	armor_protection_flags = CHEST|GROIN|FEET

/obj/item/clothing/under/sexymime
	name = "sexy mime outfit"
	desc = "The only time when you DON'T enjoy looking at someone's rack."
	icon_state = "sexymime"
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/gladiator
	name = "gladiator uniform"
	desc = "Are you not entertained? Is that not why you are here?"
	icon_state = "gladiator"
	armor_protection_flags = GROIN

//dress
/obj/item/clothing/under/dress/
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/dress/dress_fire
	name = "flame dress"
	desc = "A small black dress with blue flames print on it."
	icon_state = "dress_fire"

/obj/item/clothing/under/dress/dress_green
	name = "green dress"
	desc = "A simple, tight fitting green dress."
	icon_state = "dress_green"

/obj/item/clothing/under/dress/dress_orange
	name = "orange dress"
	desc = "A fancy orange gown for those who like to show leg."
	icon_state = "dress_orange"

/obj/item/clothing/under/dress/dress_pink
	name = "pink dress"
	desc = "A simple, tight fitting pink dress."
	icon_state = "dress_pink"

/obj/item/clothing/under/dress/dress_yellow
	name = "yellow dress"
	desc = "A flirty, little yellow dress."
	icon_state = "dress_yellow"

/obj/item/clothing/under/dress/dress_saloon
	name = "saloon girl dress"
	desc = "A old western inspired gown for the girl who likes to drink."
	icon_state = "dress_saloon"


/obj/item/clothing/under/dress/dress_cap
	name = "commander's dress uniform"
	desc = "Feminine fashion for the style concious commander."
	icon_state = "dress_cap"
	armor_protection_flags = CHEST|GROIN|ARMS

/obj/item/clothing/under/dress/dress_hop
	name = "head of personnel dress uniform"
	desc = "Feminine fashion for the style concious HoP."
	icon_state = "dress_hop"
	armor_protection_flags = CHEST|GROIN|ARMS

/obj/item/clothing/under/dress/dress_hr
	name = "human resources director uniform"
	desc = "Superior class for the nosy H.R. Director."
	icon_state = "huresource"
	armor_protection_flags = CHEST|GROIN|ARMS

/obj/item/clothing/under/dress/plaid_blue
	name = "blue plaid skirt"
	desc = "A preppy blue skirt with a white blouse."
	icon_state = "plaid_blue"

/obj/item/clothing/under/dress/plaid_red
	name = "red plaid skirt"
	desc = "A preppy red skirt with a white blouse."
	icon_state = "plaid_red"

/obj/item/clothing/under/dress/plaid_purple
	name = "blue purple skirt"
	desc = "A preppy purple skirt with a white blouse."
	icon_state = "plaid_purple"

//wedding stuff
/obj/item/clothing/under/wedding/
	armor_protection_flags = CHEST|GROIN|LEGS

/obj/item/clothing/under/wedding/bride_orange
	name = "orange wedding dress"
	desc = "A big and puffy orange dress."
	icon_state = "bride_orange"
	inv_hide_flags = HIDESHOES

/obj/item/clothing/under/wedding/bride_purple
	name = "purple wedding dress"
	desc = "A big and puffy purple dress."
	icon_state = "bride_purple"
	inv_hide_flags = HIDESHOES

/obj/item/clothing/under/wedding/bride_blue
	name = "blue wedding dress"
	desc = "A big and puffy blue dress."
	icon_state = "bride_blue"
	inv_hide_flags = HIDESHOES

/obj/item/clothing/under/wedding/bride_red
	name = "red wedding dress"
	desc = "A big and puffy red dress."
	icon_state = "bride_red"
	inv_hide_flags = HIDESHOES

/obj/item/clothing/under/wedding/bride_white
	name = "silky wedding dress"
	desc = "A white wedding gown made from the finest silk."
	icon_state = "bride_white"
	inv_hide_flags = HIDESHOES
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/sundress
	name = "sundress"
	desc = "Makes you want to frolic in a field of daisies."
	icon_state = "sundress"
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/captainformal
	name = "commander's formal uniform"
	desc = "A commander's formal-wear, for special occasions."
	icon_state = "captain_formal"
	worn_icon_state = "by_suit"

/obj/item/clothing/under/hosformalmale
	name = "head of security's formal uniform"
	desc = "A male head of security's formal-wear, for special occasions."
	icon_state = "hos_formal_male"
	worn_icon_state = "r_suit"

/obj/item/clothing/under/hosformalfem
	name = "head of security's formal uniform"
	desc = "A female head of security's formal-wear, for special occasions."
	icon_state = "hos_formal_fem"
	worn_icon_state = "r_suit"

/obj/item/clothing/under/assistantformal
	name = "assistant's formal uniform"
	desc = "An assistant's formal-wear. Why an assistant needs formal-wear is still unknown."
	icon_state = "assistant_formal"
	worn_icon_state = "gy_suit"

/obj/item/clothing/under/suit_jacket/charcoal
	name = "charcoal suit"
	desc = "A charcoal suit and red tie. Very professional."
	icon_state = "charcoal_suit"

/obj/item/clothing/under/suit_jacket/navy
	name = "navy suit"
	desc = "A navy suit and red tie, intended for the station's finest."
	icon_state = "navy_suit"

/obj/item/clothing/under/suit_jacket/burgundy
	name = "burgundy suit"
	desc = "A burgundy suit and black tie. Somewhat formal."
	icon_state = "burgundy_suit"

/obj/item/clothing/under/suit_jacket/checkered
	name = "checkered suit"
	desc = "That's a very nice suit you have there. Shame if something were to happen to it, eh?"
	icon_state = "checkered_suit"

/obj/item/clothing/under/suit_jacket/tan
	name = "tan suit"
	desc = "A tan suit with a yellow tie. Smart, but casual."
	icon_state = "tan_suit"

/obj/item/clothing/under/marine/serviceoveralls
	name = "Workman outfit"
	desc = "The very image of a working man. Not that you're probably doing work."
	icon_state = "mechanic_s"

/obj/item/clothing/under/spec_operative
	name = "Special Operations Uniform"
	desc = "Created by an unknown corporation for high risk missions, made with several layers of a unknown nano-fiber that, while light, molds to the wearer's body shape and hardens protecting them."
	icon_state = "pilot_spec"
	worn_icon_state = "pilot_spec"
	resistance_flags = UNACIDABLE
	armor_protection_flags = CHEST|GROIN|LEGS|ARMS
	soft_armor = list(MELEE = 70, BULLET = 70, LASER = 70, ENERGY = 70, BOMB = 70, BIO = 70, FIRE = 70, ACID = 70)
	cold_protection_flags = CHEST|GROIN|LEGS|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0
	slowdown = -1
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01

/obj/item/clothing/under/techpriest
	name = "Techpriest Robes"
	desc = "Praise the omnissiah!"
	icon_state = "tp_bodyrobes"
	worn_icon_state = "tp_bodyrobes"
	armor_protection_flags = CHEST|GROIN|LEGS|ARMS


/obj/item/clothing/under/spec_operative
	name = "Old NTC Spec-Ops Uniform"
	desc = "An extremely expensive sneaking suit created by an Ninetails Corporation for high risk missions, made with several layers of a nano-fiber that, while light, molds to the wearer's body shape and hardens protecting them. Only provided rarely to most successful Senior Operatives or higher. This uniform allows you to crawl through vents with ALT-CLICK"
	icon_state = "syndicate"
	armor_protection_flags = CHEST|GROIN|LEGS|ARMS|HANDS|FEET
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 10, BIO = 15, FIRE = 15, ACID = 15)
	cold_protection_flags = CHEST|GROIN|LEGS|ARMS|HANDS|FEET
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown= -0.25

/obj/item/clothing/under/spec_operative/equipped(mob/user, i_clothing)
	. = ..()
	RegisterSignal(user, COMSIG_LIVING_ADD_VENTCRAWL)
	ADD_TRAIT(user, TRAIT_CAN_VENTCRAWL, ARMOR_TRAIT)

/obj/item/clothing/under/spec_operative/unequipped(mob/unequipper, i_clothing)
	. = ..()
	UnregisterSignal(unequipper, COMSIG_LIVING_ADD_VENTCRAWL)
	REMOVE_TRAIT(unequipper, TRAIT_CAN_VENTCRAWL, ARMOR_TRAIT)

/obj/item/clothing/under/spec_operative/tback
	name = "NTC Spec-Ops Tactical T-Back Leotard"
	desc = "An extremely expensive sneaking leotard with extra skin-showing properties created by an Ninetails Corporation for high risk missions with high risk clothes, made with several layers of a nano-fiber that, while light, molds to the wearer's body shape and hardens protecting them. Only provided rarely to most successful Senior Operatives or higher. This leotard allows you to crawl through vents with ALT-CLICK"
	icon_state = "swim_black"

/obj/item/clothing/under/spec_operative/armoredsuit
	name = "executive suit"
	desc = "An extremely expensive looking formal uniform with a short, side split skirt that seems to have toughened, kevlar or maybe another material fabric... Reminds you of john wick's suit."
	soft_armor = list(MELEE = 10, BULLET = 20, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 15, FIRE = 15, ACID = 15)
	icon_state = "charcoal_suit_skirt"
