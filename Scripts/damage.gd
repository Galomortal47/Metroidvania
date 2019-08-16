extends RayCast2D

var damage = 10

func _process(delta):
	attack()

func attack():
	if Input.is_action_just_pressed("ui_left"):
		set_cast_to(Vector2(-60,0))
	elif Input.is_action_just_pressed("ui_right"):
		set_cast_to(Vector2(60,0))
	elif Input.is_action_just_pressed("ui_up"):
		set_cast_to(Vector2(0,-60))
	elif Input.is_action_just_pressed("ui_down"):
		set_cast_to(Vector2(0,60))
	if Input.is_action_just_pressed("ui_cancel"):
		if is_colliding():
			if get_collider().has_node("Health"):
				get_collider().get_node("Health").health -= damage
		$attack.play("attack")