extends CanvasLayer

func _process(delta):
	if Input.is_action_pressed("ui_select"):
		Engine.set_time_scale(0.1) 
		$"Menu Anim".set_current_animation("open")
		if Input.is_action_pressed("ui_left"):
			$Menu/icon_left.set_scale(Vector2(2,2))
			get_parent().get_node("Weapons/Sword").enable = true
			get_parent().get_node("Weapons/Gun").enable = false
			get_parent().get_node("Weapons/Bomb").enable = false
			get_parent().get_node("Weapons/Shotgun").enable = false
		else:
			$Menu/icon_left.set_scale(Vector2(1,1))
		if Input.is_action_pressed("ui_right"):
			$Menu/icon_right.set_scale(Vector2(2,2))
			get_parent().get_node("Weapons/Gun").enable = true
			get_parent().get_node("Weapons/Sword").enable = false
			get_parent().get_node("Weapons/Bomb").enable = false
			get_parent().get_node("Weapons/Shotgun").enable = false
		else:
			$Menu/icon_right.set_scale(Vector2(1,1))
			
		if Input.is_action_pressed("ui_up"):
			$Menu/icon_up.set_scale(Vector2(2,2))
			get_parent().get_node("Weapons/Shotgun").enable = true
			get_parent().get_node("Weapons/Gun").enable = false
			get_parent().get_node("Weapons/Bomb").enable = false
			get_parent().get_node("Weapons/Sword").enable = false
		else:
			$Menu/icon_up.set_scale(Vector2(1,1))
			
		if Input.is_action_pressed("ui_down"):
			$Menu/icon_down.set_scale(Vector2(2,2))
			get_parent().get_node("Weapons/Bomb").enable = true
			get_parent().get_node("Weapons/Gun").enable = false
			get_parent().get_node("Weapons/Sword").enable = false
			get_parent().get_node("Weapons/Shotgun").enable = false
		else:
			$Menu/icon_down.set_scale(Vector2(1,1))
	else:
		$Menu.set_scale(Vector2(0,0))
		Engine.set_time_scale(1) 