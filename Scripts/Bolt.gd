extends Node2D

var body2
var speed = 1
var accel = 1.1
var gravity = 10
var collect = false

func _process(delta):
	if not $ground_detect.is_colliding():
		set_position(get_position() + Vector2(0,gravity))
	if collect:
		var rotation = get_angle_to(body2.get_position())
		var dir = Vector2(cos(rotation), sin(rotation))
		set_position(get_position() + dir * (speed * delta))
		speed *= accel

func _on_magnetic_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		collect = true
		body2 = body
	pass # Replace with function body.

func _on_destroy_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		queue_free()
	pass # Replace with function body.
