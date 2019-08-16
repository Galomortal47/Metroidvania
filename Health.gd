extends Node2D

var health_max = 20
var health = 20
var invicible= false
var size = 20

#func _ready():
#	$Health.play("health")
#	$Health.set_speed_scale(0.0001) 

func _process(delta):
	$Label.set_text(str(health) + " / " + str(health_max))

func damage(var damage):
	if invicible == false:
		health -= damage
#		$Health.advance(damage*100)
		$Polygon2D.set_scale(Vector2(health/health_max,1))
		$Label2.set_text(str(-damage))
	invicible = true
	get_node("Invicibility timer").set_current_animation("invicible")

func _on_Invicibility_timer_animation_finished(anim_name):
	invicible = false
	pass # Replace with function body.
