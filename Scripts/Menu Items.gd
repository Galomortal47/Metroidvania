extends CanvasLayer

var select = [false,false,false,false]
var select_aux = select

func _process(delta):
	if Input.is_action_pressed("ui_select"):
		Engine.set_time_scale(0.1) 
		$"Menu Anim".set_current_animation("open")
		for i in range(0,4):
				get_parent().get_node("Weapons").get_child(i).enable = select[i]
				if select[i]:
					get_parent().get_node("Weapons").get_child(i).update_text()
		if Input.is_action_pressed("ui_left"):
			$Menu/icon_left.set_scale(Vector2(2,2))
			select = [true,false,false,false]
		else:
			$Menu/icon_left.set_scale(Vector2(1,1))
		if Input.is_action_pressed("ui_right"):
			$Menu/icon_right.set_scale(Vector2(2,2))
			select = [false,true,false,false]
		else:
			$Menu/icon_right.set_scale(Vector2(1,1))
			
		if Input.is_action_pressed("ui_up"):
			$Menu/icon_up.set_scale(Vector2(2,2))
			select = [false,false,true,false]
		else:
			$Menu/icon_up.set_scale(Vector2(1,1))
			
		if Input.is_action_pressed("ui_down"):
			$Menu/icon_down.set_scale(Vector2(2,2))
			select = [false,false,false,true]
		else:
			$Menu/icon_down.set_scale(Vector2(1,1))
	else:
		$Menu.set_scale(Vector2(0,0))
		Engine.set_time_scale(1) 