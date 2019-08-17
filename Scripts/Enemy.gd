extends KinematicBody2D

var angle = 0.0
var motion = Vector2(0,0)
var speed = 20
var max_speed = 200
var gravity = 10
var jump = 200
export var damage = 5
export var health = 20

func _ready():
	$Health.health = health

func _process(delta):
	if not $Ground_Detect.is_colliding():
		motion.y += gravity
	hunt_player()
	damage()
	die()
	motion = move_and_slide(motion)

#ar dano ao encostar no jgador
func damage():
	if $Damage.is_colliding():
		motion.x = motion.x * -2
		if $Damage.get_collider().has_node("Health"):
			$Damage.get_collider().get_node("Health").damage(damage) 

#virar raycast em direçao ao jogador se mover ate ele
func hunt_player():
	if $Vision.is_colliding():
		if $Vision.get_collider().is_in_group("player"):
			$Vision.rotate(get_angle_to($Vision.get_collider().get_position()) - $Vision.get_rotation() - 1.57)
			if $Vision.get_collider().get_position().x - get_position().x > 0:
				if motion.x < max_speed:
					motion.x += speed
				$Damage.set_cast_to(Vector2(60,0))
			else:
				if motion.x > -max_speed:
					motion.x -= speed
				$Damage.set_cast_to(Vector2(-60,0))
			if $Vision.get_collider().get_position().y - get_position().y < -100:
				motion.y += -jump
	else:
		motion.x = 0

#mudar a direçao do raycasyt na direçao do jogador

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	angle = get_angle_to(body.get_position()) -1.57
	$Vision.rotate(angle - $Vision.get_rotation())
	pass # Replace with function body.

func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	angle = get_angle_to(body.get_position()) -1.57
	$Vision.rotate(angle - $Vision.get_rotation())
	pass # Replace with function body.

# verifica a vida do inimigo e o destruir caso ela seja igual ou menor que 0
func die():
	if get_node("Health").health <= 0:
		queue_free()
		