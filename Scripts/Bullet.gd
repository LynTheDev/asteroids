extends Area2D

signal aste_killed


var angle = null
var marker_pos = null
var velocity = Vector2.ZERO

const game_size: Vector2 = Vector2(1024, 600)


func _process(delta):
	velocity += Vector2(cos(angle) * 100, sin(angle) * 100)
	position += velocity * delta
		
	if global_position.x > game_size.x + 10 or global_position.y > game_size.y + 10:
		queue_free()
	elif global_position.x < -10 or global_position.y < -10:
		queue_free()


func _on_area_entered(area):
	# Big asteroid is 4 and small is 8
	if area.get_collision_layer() == 4 or area.get_collision_layer() == 8:
		queue_free()
		area.kill()
		emit_signal("aste_killed")
