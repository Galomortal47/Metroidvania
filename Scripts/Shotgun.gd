extends Node2D

export var weapon = ""
var dir = 1
export var speed = 500
export var bullet_n = 10
export var spreed = 20

func _process(delta):
	shoot()
#	pass

func shoot():
	if Input.is_action_just_pressed("ui_left"):
		dir = 1
	elif Input.is_action_just_pressed("ui_right"):
		dir = 2
	elif Input.is_action_just_pressed("ui_up"):
		dir = 3
	elif Input.is_action_just_pressed("ui_down"):
		dir = 4
	if Input.is_action_just_pressed("ui_cancel"):
		for i in range(1,bullet_n):
			var bullet =  load(weapon)
			var bullet_instance = bullet.instance()
			bullet_instance.set_position(get_global_position())
			match (dir):
				1:
					bullet_instance.set_rotation_degrees(-180 +rand_range(-spreed,spreed))
				2:
					bullet_instance.set_rotation_degrees(0 +rand_range(-spreed,spreed))
				3:
					bullet_instance.set_rotation_degrees(-90 +rand_range(-spreed,spreed))
				4:
					bullet_instance.set_rotation_degrees(90 +rand_range(-spreed,spreed))
			get_parent().get_parent().add_child(bullet_instance)