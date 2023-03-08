extends Area2D


var rng = RandomNumberGenerator.new()
const game_size: Vector2 = Vector2(1024, 600)

var is_held = false


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = rng.randf_range(0, game_size.x)
	position.y = rng.randf_range(0, game_size.y)


func _process(delta):
	if not is_held:
		position.x += 150 * delta
	
	if position.x > game_size.x + 60:
		position.x = -60
		position.y = rng.randf_range(0, game_size.y)


func _on_mouse_entered():
	$Panic.visible = true


func _on_mouse_exited():
	$Panic.visible = false
