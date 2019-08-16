extends Node2D

var health_max = 100.0
var health = 100.0
var invicible= false
var size = 100

#func _ready():
#	$Health.play("health")
#	$Health.set_speed_scale(0.0001) 

func _process(delta):
	$Label.set_text(str(health) + " / " + str(health_max))

func damage(var damage):
	if invicible == false:
		health -= damage
#		$Health.advance(damage*100)
		$Label2.set_text(str(-damage))
	invicible = true
	get_node("Invicibility timer").play("invicible")

func _on_Invicibility_timer_animation_finished(anim_name):
	invicible = false
	pass # Replace with function body.
