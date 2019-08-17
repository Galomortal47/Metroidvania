extends StaticBody2D

func _process(delta):
	if Input.is_action_just_pressed("ui_block") and not Input.is_action_pressed("ui_select"):
		$block.play("block")
	if Input.is_action_just_pressed("ui_left"):
		$CollisionShape2D.set_position(Vector2(-30,0))
	if Input.is_action_just_pressed("ui_right"):
		$CollisionShape2D.set_position(Vector2(30,0))
#	pass
