extends Area2D


var rng = RandomNumberGenerator.new()
const game_size: Vector2 = Vector2(1024, 600)

const speed = 5
var velocity = Vector2.ZERO

var rotation_speed: float = 0
var angle: float = 0

const LIMIT = 200

var asteroid_small = preload("res://Scenes/Entities/Asteroids/Asteroid_Small.tscn")


func kill():
	queue_free()
	for i in range(2):
		var a = asteroid_small.instantiate()
		get_parent().add_child(a)
		
		a.position = position


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_speed = rng.randf_range(0.01, 0.05)
	angle = rng.randf_range(1, 360)


func handle_pos_change():
	if global_position.x > game_size.x + 60:
		angle = rng.randf_range(1, 360)
		global_position.x = 0

	if global_position.x < -60: 
		angle = rng.randf_range(1, 360)
		global_position.x = game_size.x

	if global_position.y > game_size.y + 60:
		angle = rng.randf_range(1, 360)
		global_position.y = 0

	if global_position.y < -60:
		angle = rng.randf_range(1, 360)
		global_position.y = game_size.y
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation += rotation_speed
	
	handle_pos_change()
	
	velocity += Vector2(cos(angle) * speed, sin(angle) * speed)
	if velocity.length() > LIMIT:
		velocity = velocity.normalized() * LIMIT
	
	position += velocity * delta


func _on_body_entered(body):
	if body.get_collision_layer() == 1:
		body.kill()
