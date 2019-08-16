extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var minigame = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if minigame:
		if Input.is_action_just_pressed("ui_cancel"):
			for i in range(0,3):
				get_parent().get_node("Weapons").get_child(i).timer_aux = 0
#	pass

func load_minigame():
	minigame = true

func unload_minigame():
	minigame = false