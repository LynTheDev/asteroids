extends CharacterBody2D


var orig_speed: int = 150
var move_speed: int = orig_speed

var has_shot: bool = false

const game_size: Vector2 = Vector2(1024, 600)

const bullet: PackedScene = preload("res://Scenes/Entities/Bullet.tscn")


var shoot_audio = preload("res://Assets/Audio/mixkit-shoot.wav")


signal death


func kill():
	queue_free()
	emit_signal("death")


func shoot():
	var b: Node2D = bullet.instantiate()
	
	get_parent().add_child(b)
	b.aste_killed.connect(get_parent()._on_aste_killed)
	
	$Audio.stream = shoot_audio
	$Audio.play()
	
	b.position = $Marker2D.global_position
	b.angle = atan2(b.position.y - global_position.y, b.position.x - global_position.x)


func check_pos():
	if global_position.x > game_size.x + 10:
		global_position.x = 0

	if global_position.x < -5: 
		global_position.x = game_size.x

	if global_position.y > game_size.y + 10:
		global_position.y = 0

	if global_position.y < -5:
		global_position.y = game_size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	velocity = Vector2(move_speed, 0)
	velocity = velocity.rotated(global_rotation)

	if Input.is_action_pressed("move_right"):
		global_rotation += 0.03
	if Input.is_action_pressed("move_left"):
		global_rotation -= 0.03

	if Input.is_action_pressed("speed_up"):
		move_speed = 300
	elif Input.is_action_just_released("speed_up"):
		move_speed = orig_speed

	if Input.is_action_pressed("shoot") and not has_shot:
		shoot()
		has_shot = true
	elif Input.is_action_just_released("shoot"):
		has_shot = false

	check_pos()
	move_and_slide()
