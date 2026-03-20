extends Node3D
var projectile = preload("res://scenes/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	handle_input()

func handle_input():
	# 🚀 Forward / Backward thrust
	if Input.is_action_pressed("arrow_left"):
		if(rotation_degrees.y > -90):
			rotate_y(-0.1)

	if Input.is_action_pressed("arrow_right"):
		if(rotation_degrees.y < 90):
			rotate_y(0.1)
			
	if Input.is_action_just_released("shoot"):
		var p = projectile.instantiate()
		p.rotation = rotation
		p.rotation.y -= deg_to_rad(90)
		p.position = global_position
		get_tree().root.add_child(p)
