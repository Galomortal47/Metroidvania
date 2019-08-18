extends RigidBody2D

var bolt_path = "res://assets/Bolts.tscn"
var bolt_number = rand_range(5,15)
var ramdom_pos = 30
var motion = Vector2(0,0)
func _process(delta):
	if $Health.health <= 0:
		for i in range(0,bolt_number):
			var bolts =  load(bolt_path)
			var bolt_instance = bolts.instance()
			bolt_instance.set_position(get_position()+ Vector2(rand_range(-ramdom_pos,ramdom_pos),rand_range(-ramdom_pos,ramdom_pos)))
			get_tree().get_root().add_child(bolt_instance)
		queue_free()