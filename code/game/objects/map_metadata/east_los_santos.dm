/obj/map_metadata/east_los_santos
	ID = MAP_EAST_LOS_SANTOS
	title = "East Los Santos"
	lobby_icon = "icons/lobby/east_los_santos.png"
	no_winner = "The fight for the hood is still going on."
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall, /area/caribbean/no_mans_land/invisible_wall/one, /area/caribbean/no_mans_land/invisible_wall/two)
	respawn_delay = 0
	faction_organization = list(
		AMERICAN,
		INDIANS,)
	roundend_condition_sides = list(
		list(AMERICAN) = /area/caribbean/british,//Don't exist on the map
		list(INDIANS) = /area/caribbean/russian,//Don't exist on the map
		)
	age = "1992"
	ordinal_age = 7
	faction_distribution_coeffs = list(AMERICAN = 0.5, INDIANS = 0.5)
	battle_name = "East Los Santos"
	mission_start_message = "<font size=4>Grove Street and Ballas are competing against each other to capture all the territories in East Los Santos.<br> Points are generated by capturing turfs. The gang with most points (40) wins!"
	faction1 = AMERICAN
	faction2 = INDIANS
	grace_wall_timer = 1200
	gamemode = "Turf War"
	no_hardcore = TRUE
	songs = list(
		"Compton\'s Most Wanted - Hood Took Me Under:1" = "sound/music/hood_took_me_under.ogg",)
	var/grove_points = 0
	var/ballas_points = 0
	var/a1_control = "None"
	var/a2_control = "None"
	var/a3_control = "None"
	var/a4_control = "None"
	var/spam_check_g = 0
	var/spam_check_b = 0

/obj/map_metadata/east_los_santos/New()
	..()
	spawn(1200)
		points_check()
		rewards()

/obj/map_metadata/east_los_santos/proc/points_check()
	if (processes.ticker.playtime_elapsed > 1200)
		var/c1 = 0
		var/c2 = 0
		var/cust_color = "white"
		for (var/mob/living/human/H in player_list)
			var/area/temp_area = get_area(H)
			if (istype(temp_area, /area/caribbean/no_mans_land/capturable/one/outside))
				if (H.faction_text == "AMERICAN" && H.stat == CONSCIOUS)
					c1++
				else if (H.faction_text == "INDIANS" && H.stat == CONSCIOUS)
					c2++
		if ((c1 == c2) && c1 != 0)
			a1_control = "none"
			cust_color= "white"
		else if (c1 > c2)
			a1_control = "Grove Street"
			cust_color= "green"
		else if (c2 > c1)
			a1_control = "Ballas"
			cust_color= "purple"
		if (a1_control != "none")
			if (a1_control == "Grove Street")
				cust_color = "green"
				grove_points++
			else if (a1_control == "Ballas")
				cust_color = "purple"
				ballas_points++
			else
				cust_color = "white"
			world << "<big><font color='[cust_color]'><b>Basketball Court (South-West)</b>: [a1_control]</font></big>"
		else
			world << "<big><b>Basketball Court (South-West)</b>: Nobody</big>"
		c1 = 0
		c2 = 0
		for (var/mob/living/human/H in player_list)
			var/area/temp_area = get_area(H)
			if (istype(temp_area, /area/caribbean/no_mans_land/capturable/two/outside))
				if (H.faction_text == "AMERICAN" && H.stat == CONSCIOUS)
					c1++
				else if (H.faction_text == "INDIANS" && H.stat == CONSCIOUS)
					c2++
		if ((c1 == c2) && c1 != 0)
			a2_control = "none"
			cust_color= "white"
		else if (c1 > c2)
			a2_control = "Grove Street"
			cust_color= "green"
		else if (c2 > c1)
			a2_control = "Ballas"
			cust_color= "purple"
		if (a2_control != "none")
			if (a2_control == "Grove Street")
				cust_color = "green"
				grove_points++
			else if (a2_control == "Ballas")
				cust_color = "purple"
				ballas_points++
			else
				cust_color = "white"
			world << "<big><font color='[cust_color]'><b>Abandoned Lot (South-East)</b>: [a2_control]</font></big>"
		else
			world << "<big><b>Abandoned Lot (South-East)</b>: Nobody</big>"
		c1 = 0
		c2 = 0
		for (var/mob/living/human/H in player_list)
			var/area/temp_area = get_area(H)
			if (istype(temp_area, /area/caribbean/no_mans_land/capturable/three/))
				if (H.faction_text == "AMERICAN" && H.stat == CONSCIOUS)
					c1++
				else if (H.faction_text == "INDIANS" && H.stat == CONSCIOUS)
					c2++
		if ((c1 == c2) && c1 != 0)
			a3_control = "none"
			cust_color= "white"
		else if (c1 > c2)
			a3_control = "Grove Street"
			cust_color= "green"
		else if (c2 > c1)
			a3_control = "Ballas"
			cust_color= "purple"
		if (a3_control != "none")
			if (a3_control == "Grove Street")
				cust_color = "green"
				grove_points++
			else if (a3_control == "Ballas")
				cust_color = "purple"
				ballas_points++
			else
				cust_color = "white"
			world << "<big><font color='[cust_color]'><b>Rodriguez Steelworks</b>: [a3_control]</font></big>"
		else
			world << "<big><b>Rodriguez Steelworks</b>: Nobody</big>"
		c1 = 0
		c2 = 0
		for (var/mob/living/human/H in player_list)
			var/area/temp_area = get_area(H)
			if (istype(temp_area, /area/caribbean/no_mans_land/capturable/four))
				if (H.faction_text == "AMERICAN" && H.stat == CONSCIOUS)
					c1++
				else if (H.faction_text == "INDIANS" && H.stat == CONSCIOUS)
					c2++
		if ((c1 == c2) && c1 != 0)
			a4_control = "none"
			cust_color= "white"
		else if (c1 > c2)
			a4_control = "Grove Street"
			cust_color= "green"
		else if (c2 > c1)
			a4_control = "Ballas"
			cust_color= "purple"
		if (a4_control != "none")
			if (a4_control == "Grove Street")
				cust_color = "green"
				grove_points++
			else if (a4_control == "Ballas")
				cust_color = "purple"
				ballas_points++
			else
				cust_color = "white"
			world << "<big><font color='[cust_color]'><b>Pig Pen Parking Lot (North-East)</b>: [a4_control]</font></big>"
		else
			world << "<big><b>Pig Pen Parking Lot (North-East)</b>: Nobody</big>"
	spawn(300)
		points_check()
		world << "Ballas Influence: [ballas_points]/40"
		world << "Grove Influence: [grove_points]/40"

/obj/map_metadata/east_los_santos/job_enabled_specialcheck(var/datum/job/J)
	..()
	if (J.is_gta == TRUE)
		. = TRUE
	else
		. = FALSE

/obj/map_metadata/east_los_santos/roundend_condition_def2name(define)
	..()
	switch (define)
		if (INDIANS)
			return "Ballas"
		if (AMERICAN)
			return "Grove Street"

/obj/map_metadata/east_los_santos/roundend_condition_def2army(define)
	..()
	switch (define)
		if (INDIANS)
			return "Ballas"
		if (AMERICAN)
			return "Grove Street"

/obj/map_metadata/east_los_santos/army2name(army)
	..()
	switch (army)
		if ("Ballas")
			return "Ballas"
		if ("Grove Street")
			return "Grove Street"

/obj/map_metadata/east_los_santos/cross_message(faction)
	if (faction == AMERICAN)
		return "<font size = 4>Both gangs may now cross the invisible wall!</font>"
	else if (faction == INDIANS)
		return ""
	else
		return ""

/obj/map_metadata/east_los_santos/reverse_cross_message(faction)
	if (faction == AMERICAN)
		return "<span class = 'userdanger'>Both gangs may no longer cross the invisible wall!</span>"
	else if (faction == INDIANS)
		return ""
	else
		return ""

/obj/map_metadata/east_los_santos/update_win_condition()
	if (processes.ticker.playtime_elapsed > 1200)
		if (grove_points < 40 && ballas_points < 40)
			return TRUE
		if (grove_points >= 40 && grove_points > ballas_points)
			if (win_condition_spam_check)
				return FALSE
			ticker.finished = TRUE
			var/message = "The <b><font color ='green'>Grove Street Families</font></b> have reached [grove_points] points and won! The hood is theirs!"
			world << "<font size = 4><span class = 'notice'>[message]</span></font>"
			show_global_battle_report(null)
			win_condition_spam_check = TRUE
			return FALSE
		if (ballas_points >= 40 && ballas_points > grove_points)
			if (win_condition_spam_check)
				return FALSE
			ticker.finished = TRUE
			var/message = "The <b><font color ='purple'>Ballas</font></b> have reached [ballas_points] points and won! The hood is theirs!"
			world << "<font size = 4><span class = 'notice'>[message]</span></font>"
			show_global_battle_report(null)
			win_condition_spam_check = TRUE
			return FALSE
	return TRUE

/obj/map_metadata/east_los_santos/check_caribbean_block(var/mob/living/human/H, var/turf/T)
	if (!istype(H) || !istype(T))
		return FALSE
	var/area/A = get_area(T)
	if (istype(A, /area/caribbean/no_mans_land/invisible_wall))
		if (istype(A, /area/caribbean/no_mans_land/invisible_wall/one))
			if (H.faction_text == faction1)
				return TRUE
		else if (istype(A, /area/caribbean/no_mans_land/invisible_wall/two))
			if (H.faction_text == faction2)
				return TRUE
		else
			return !faction1_can_cross_blocks()
			return !faction2_can_cross_blocks()
	return FALSE

/obj/map_metadata/east_los_santos/proc/rewards()
	for (var/mob/living/human/H in player_list)
		if (!H || H.stat == DEAD)
			return
		if (H.faction_text == "AMERICAN")
			if ((grove_points >= 10 && grove_points < 20) && spam_check_g == 0)
				var/rand_pistol = rand(1,3)
				switch(rand_pistol)
					if (1)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/pistol/m1911(H), slot_r_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/m1911(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/m1911(H), slot_r_store)
					if (2)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/pistol/glock17(H), slot_r_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/glock17(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/glock17(H), slot_r_store)
					if (3)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/pistol/m9beretta(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/m9beretta(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/m9beretta(H), slot_r_store)
				spam_check_g = 1
				world << "The <b><font color = 'green'>Grove Street Families</font></b> are now strapped with <b>pistols</b>!"
			else if ((grove_points >= 20 && grove_points < 30) && spam_check_g == 1)
				var/rand_smg = rand(1,3)
				switch(rand_smg)
					if (1)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/tec9(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/tec9(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/tec9(H), slot_r_store)
					if (2)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/uzi(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/uzi(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/uzi(H), slot_r_store)
					if (3)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/mac10(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/mac10(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/mac10(H), slot_r_store)
				spam_check_g = 2
				world << "The <b><font color = 'green'> Grove Street Families</font></b> are now strapped with <b>SMGs</b>!"
			else if (grove_points >= 30 && spam_check_g == 2)
				var/rand_rifle = pick(1,2)
				switch(rand_rifle)
					if (1)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/ak47(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/ak47(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/ak47(H), slot_r_store)
					if (2)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/mp40/mp5(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/mp40/mp5(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/mp40/mp5(H), slot_r_store)
				spam_check_g = 3
				world << "The <b><font color = 'green'>Grove Street Families</font></b> are now strapped with <b>assault rifles</b>!"
		else
			if ((ballas_points >= 10 && ballas_points < 20) && spam_check_b == 0)
				var/rand_pistol = rand(1,3)
				switch(rand_pistol)
					if (1)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/pistol/m1911(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/m1911(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/m1911(H), slot_r_store)
					if (2)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/pistol/glock17(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/glock17(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/glock17(H), slot_r_store)
					if (3)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/pistol/m9beretta(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/m9beretta(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/m9beretta(H), slot_r_store)
				spam_check_b = 1
				world << "The <b><font color ='purple'>Ballas</font></b> are now strapped with <b>pistols</b>!"
			else if ((ballas_points >= 20 && ballas_points < 30) && spam_check_b == 1)
				var/rand_smg = rand(1,3)
				switch(rand_smg)
					if (1)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/tec9(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/tec9(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/tec9(H), slot_r_store)
					if (2)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/uzi(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/uzi(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/uzi(H), slot_r_store)
					if (3)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/mac10(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/mac10(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/mac10(H), slot_r_store)
				spam_check_b = 2
				world << "The <b><font color ='purple'>Ballas</font></b> are now strapped with <b>SMGs</b>!"
			else if (ballas_points >= 30 && spam_check_b == 2)
				var/rand_rifle = pick(1,2)
				switch(rand_rifle)
					if (1)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/ak47(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/ak47(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/ak47(H), slot_r_store)
					if (2)
						H.equip_to_slot_or_drop(new /obj/item/weapon/gun/projectile/submachinegun/mp40/mp5(H), slot_l_hand)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/mp40/mp5(H), slot_l_store)
						H.equip_to_slot_or_drop(new /obj/item/ammo_magazine/mp40/mp5(H), slot_r_store)
				spam_check_b = 3
				world << "The <b><font color ='purple'>Ballas</font></b> are now strapped with <b>assault rifles</b>!"
	spawn(300)
		rewards()

//////////////MAP SPECIFIC OBJECTS///////////////////

/obj/item/clothing/under/ballas1
	name = "white t-shirt and purple shorts"
	desc = "An oversized white t-shirt and purple cargo shorts."
	icon_state = "ballas1"
	item_state = "ballas1"
	worn_state = "ballas1"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/ballas2
	name = "baggy black clothing"
	desc = "An oversized black outfit."
	icon_state = "ballas2"
	item_state = "ballas2"
	worn_state = "ballas2"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/ballas3
	name = "purple shirt and khaki pants"
	desc = "An oversized purple shirt and khaki cargo pants."
	icon_state = "ballas3"
	item_state = "ballas3"
	worn_state = "ballas3"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/grove1
	name = "green sweatshirt and jeans"
	desc = "An oversized green sweatshirt and jeans."
	icon_state = "grove1"
	item_state = "grove1"
	worn_state = "grove1"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/grove2
	name = "green checkered outfit"
	desc = "A green checkered shirt and beige pants."
	icon_state = "grove2"
	item_state = "grove2"
	worn_state = "grove2"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/grove3
	name = "green jersey and jeans"
	desc = "A green basketball jersey and black jeans."
	icon_state = "grove3"
	item_state = "grove3"
	worn_state = "grove3"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/head/custom/custom_beanie/black
	color = "#0d0d0d"
	uncolored1 = FALSE

/obj/item/clothing/head/bandana_ballas
	name = "purple bandana"
	desc = "A purple bandana tied in the front."
	icon_state = "bandana_ballas1"
	item_state = "bandana_ballas1"
	worn_state = "bandana_ballas1"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/bandana_ballas/two
	icon_state = "bandana_ballas2"
	item_state = "bandana_ballas2"
	worn_state = "bandana_ballas2"

/obj/item/clothing/head/bandana_grove
	name = "green bandana"
	desc = "A green bandana tied in the front."
	icon_state = "bandana_grove"
	item_state = "bandana_grove"
	worn_state = "bandana_grove"
	flags_inv = BLOCKHEADHAIR
