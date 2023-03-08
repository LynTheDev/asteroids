extends Area2D


var rng = RandomNumberGenerator.new()
var speed = null

const game_size: Vector2 = Vector2(1024, 600)

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = randf_range(100, 300)
	if speed <= 160:
		modulate.a = 0.5
	elif speed <= 200:
		modulate.a = 0.7
	elif speed <= 260:
		modulate.a = 0.9
		
	position.x = randf_range(0, game_size.x)
	position.y = randf_range(0, game_size.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += speed * delta
	
	if position.x > game_size.x + 10:
		position.x = -10
		position.y = randf_range(0, game_size.y)
