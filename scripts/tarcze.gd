extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var viewport_center = Vector2(get_viewport().get_visible_rect().size.x /2, get_viewport().get_visible_rect().size.y /2)
	var mouse_pos = get_viewport().get_mouse_position()
	var dir = mouse_pos - viewport_center
	look_at(Vector3(position.x + dir.x * 100000000, 0, position.z + dir.y * 100000000), Vector3.UP)
	
