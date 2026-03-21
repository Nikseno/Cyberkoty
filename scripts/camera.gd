extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = Vector3(0,30,-30) * 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_rotation_degrees = Vector3(-45,-180,0) 
	global_position = get_parent().global_position + Vector3(0,30,-30) * 2
