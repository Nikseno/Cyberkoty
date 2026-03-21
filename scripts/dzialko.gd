extends Node3D
var projectile = preload("res://scenes/projectile.tscn")
var occupied = false
var other = false
var s_r = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(rotation.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	handle_input()

func handle_input():
	if(occupied == false):
		return
	if(other == true):	
		if Input.is_action_pressed("arrow_left"):
			if(s_r > - 90):
				var z = deg_to_rad(5)
				s_r -= 5
				rotate_y(-z)

		if Input.is_action_pressed("arrow_right"):
			if(s_r < 90):
				var z = deg_to_rad(5)
				s_r += 5
				rotate_y(z)			
	elif(other == false):
		if Input.is_action_pressed("arrow_left"):
			if(rotation_degrees.y > - 90):
				rotate_y(-0.1)

		if Input.is_action_pressed("arrow_right"):
			if(rotation_degrees.y < 90):
				rotate_y(0.1)			
	if Input.is_action_just_released("shoot"):
		var p = projectile.instantiate()
		p.rotation = global_rotation
		p.rotation.y -= deg_to_rad(90)
		p.position = global_position
		get_tree().root.add_child(p)
