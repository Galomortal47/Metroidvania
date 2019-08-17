extends StaticBody2D

func _process(delta):
	if Input.is_action_pressed("ui_block") and not Input.is_action_pressed("ui_select") and not Input.is_action_pressed("ui_cancel") :
		$CollisionShape2D.set_disabled(false)
	else:
		$CollisionShape2D.set_disabled(true)
	if Input.is_action_just_pressed("ui_left") and not Input.is_action_pressed("ui_block"):
		$CollisionShape2D.set_position(Vector2(-35,0))
	if Input.is_action_just_pressed("ui_right") and not Input.is_action_pressed("ui_block"):
		$CollisionShape2D.set_position(Vector2(35,0))
#	pass
