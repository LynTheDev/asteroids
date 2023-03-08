extends Node2D


var death_audio = preload("res://Assets/Audio/player-death.mp3")


# Called when the node enters the scene tree for the first time.
func _ready():
	$Audio.stream = death_audio
	$Audio.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
