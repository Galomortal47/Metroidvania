extends Node2D

export var weapon = ""
var dir = 1
export var speed = 1000
export var bullet_n = 1
export var spreed = 0
export var timer = 2.0
export var gravity = 0
export var damage = 1
export var curve = 0
var timer_aux = 0.0 
var enable = false

func _process(delta):
	if enable:
		shoot()
	timer_aux -= delta
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
	if Input.is_action_pressed("ui_cancel") and timer_aux < 0:
		timer_aux = timer
		for i in range(0,bullet_n):
			var bullet =  load(weapon)
			var bullet_instance = bullet.instance()
			bullet_instance.speed = speed
			bullet_instance.gravity = gravity
			bullet_instance.damage = damage
			bullet_instance.curve = curve
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
			get_tree().get_root().add_child(bullet_instance)