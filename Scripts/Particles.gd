extends CPUParticles2D

var orig_speed = 0.6
var orig_lifetime = 0.7

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("speed_up"):
		speed_scale = 1
		lifetime = 1
	elif Input.is_action_just_released("speed_up"):
		speed_scale = orig_speed
		lifetime = orig_lifetime
 
