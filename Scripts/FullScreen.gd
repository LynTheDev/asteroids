extends Label


var can_toggle_fs = true
var can_toggle_v = true


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0.1

func _process(delta):
	if Input.is_action_pressed("fullscreen_toggle") && can_toggle_fs:
		can_toggle_fs = false
		if get_window().get_mode() != Window.Mode.MODE_FULLSCREEN:
			get_window().set_mode(Window.Mode.MODE_FULLSCREEN)
		else:
			get_window().set_mode(Window.Mode.MODE_WINDOWED)
	elif Input.is_action_just_released("fullscreen_toggle"):
		can_toggle_fs = true
	
	if Input.is_action_pressed("text_hide") && can_toggle_v:
		visible = not visible
		can_toggle_v = false
	if Input.is_action_just_released("text_hide"):
		can_toggle_v = true
