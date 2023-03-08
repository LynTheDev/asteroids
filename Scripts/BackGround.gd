extends Node2D


var star = preload("res://Scenes/Entities/Stars/Star.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(50):
		var s = star.instantiate()
		add_child(s)
