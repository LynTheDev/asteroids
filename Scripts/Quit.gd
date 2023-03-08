extends Area2D


func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("mouse_accept"):
		get_tree().quit()
