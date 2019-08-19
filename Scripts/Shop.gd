extends Node2D

var price = 50

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		if Input.is_action_pressed("ui_select"):
			var data = int(get_node("/root/Test/Coins/Number").get_text())
			if data >= price:
				if has_node("/root/Test/Coins/Number"):
					get_node("/root/Test/Coins/Number").set_text(str(data-price))
				if has_node("/root/Test/Player"):
					get_node("/root/Test/Player/Weapons").get_child(get_node("/root/Test/Player/Menu Items").a).ammo = get_node("/root/Test/Player/Weapons").get_child(get_node("/root/Test/Player/Menu Items").a).ammo_max
	#$Label.set_text("Buy Ammo X: " + str(get_parent().get_parent().get_node("Weapons/Label").get_text()))
#	pass
