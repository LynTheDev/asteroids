extends Node2D


var game_start = false

var rng = RandomNumberGenerator.new()

var score: int = 0

var timer = null

var asteroid_big = preload("res://Scenes/Entities/Asteroids/Asteroid_Big.tscn")

var asteroid_spawn = preload("res://Assets/Audio/asteroid-spawn.wav")
var asteroid_kill = preload("res://Assets/Audio/asteroid-kill.mp3")


func children_physics(should_work: bool):
	for asteroid_child in $Asteroid_Manager.get_children():
		asteroid_child.set_physics_process(should_work)
		
	for star_child in $BackGround.get_children():
		star_child.set_physics_process(should_work)

	for child in get_children():
		child.set_physics_process(should_work)


func spawn_asteroid():
	var a: Node2D = asteroid_big.instantiate()
	add_child(a)
	a.position.x = rng.randf_range(-60, -100)
	a.position.y = rng.randf_range(-50, -300)
	
	if $AudioStream != asteroid_spawn:
		$AudioStream.stream = asteroid_spawn
	$AudioStream.play()


func _ready():
	children_physics(false)
	timer = get_node("Asteroid_Manager/Asteroid_Spawner")


func _physics_process(_delta):
	if not game_start:
		if Input.is_action_pressed("shoot"):
			children_physics(true)
			timer.start()
			$Start_Text.visible = false
			game_start = true

func _on_asteroid_spawner_timeout():
	spawn_asteroid()


func _on_aste_killed():
	if $AudioStream != asteroid_kill:
		$AudioStream.stream = asteroid_kill
	$AudioStream.play()
	
	score += 100
	$Score.text = "Score: " + str(score)


func _on_player_death():
	get_tree().change_scene_to_file("res://Scenes/Death.tscn")
	queue_free()
