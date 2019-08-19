extends Node2D

var price = 50

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		if Input.is_action_pressed("ui_select"):
			var data = int(get_parent().get_parent().get_node("Coins/Number").get_text())
			if data >= price:
				get_parent().get_parent().get_node("Coins/Number").set_text(str(data-price))
				get_parent().get_parent().get_node("Weapons").get_child(get_parent().a).ammo = get_parent().get_parent().get_node("Weapons").get_child(get_parent().a).ammo_max
	#$Label.set_text("Buy Ammo X: " + str(get_parent().get_parent().get_node("Weapons/Label").get_text()))
#	pass
