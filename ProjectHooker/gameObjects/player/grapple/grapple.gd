extends CharacterBody2D
@export var distance_mult = 1.0
@export var curr_rotation = 5

var _player
# Called when the node enters the scene tree for the first time.
func _ready():
	_player = get_parent().get_node("YannikCharacter")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# read the four directional inputs "RStick_Up", "RStick_Down", "RStick_Left", "RStick_Right"
	# and build a vector2 from them
	var direction = Vector2(0,0)
	direction.y += Input.get_action_strength("RStick_Up")
	direction.y -= Input.get_action_strength("RStick_Down")
	direction.x += Input.get_action_strength("RStick_Left")
	direction.x -= Input.get_action_strength("RStick_Right")
	direction = direction.normalized()
	print(direction)
	# position to player pos + direction * distance_mult
	if _player != null:
		var player_pos = _player.global_position
		var new_pos = player_pos + direction * distance_mult
		global_position = new_pos
		global_rotation = direction.angle() + deg_to_rad(90)
		

	pass
