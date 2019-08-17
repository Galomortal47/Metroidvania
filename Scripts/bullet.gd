extends KinematicBody2D

var damage = 10
var motion = Vector2(0,0)
var speed = 500
var gravity = 0
var curve = 500

func _ready():
	motion.y += curve

func _process(delta):
	attack()
	var dir = Vector2(cos(get_rotation()), sin(get_rotation()))
	set_position(get_position() + dir * (speed * delta))
	motion.y += gravity
	motion = move_and_slide(motion)

func attack():
	if $bullet.is_colliding():
		if $bullet.get_collider().is_in_group("enemy"):
			if $bullet.get_collider().has_node("Health"):
				$bullet.get_collider().get_node("Health").health -= damage
				queue_free()
