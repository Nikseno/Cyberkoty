extends RigidBody3D
class_name space_ship
@export var max_speed = 300.0#50.0
@export var acceleration = 1.2#0.6
@export var pitch_speed = 1.5
@export var roll_speed = 1.9
@export var yaw_speed = 1.25  # Set lower for linked roll/yaw
@export var input_response = 8.0

@export var thrust_force: float = 2.0
@export var torque_force: float = 5.0

var forward_speed = 0.0
var pitch_input = 0.0
var roll_input = 0.0
var yaw_input = 0.0

func _ready():
	get_node("dzialko").occupied = true
	get_node("dzialko2").other = true
	pass
	
func get_input(delta):
	if Input.is_action_pressed("forward"):
		forward_speed = lerp(forward_speed, max_speed, acceleration * delta)
	if Input.is_action_pressed("back"):
		forward_speed = lerp(forward_speed, 0.0, acceleration * delta)

	#pitch_input = lerp(pitch_input, Input.get_axis("pitch_down", "pitch_up"), input_response * delta)
	roll_input = lerp(roll_input, Input.get_axis("right", "left"), input_response * delta)
#	yaw_input = lerp(yaw_input, Input.get_axis("yaw_right", "yaw_left"), input_response * delta)
	yaw_input = roll_input
		
#func _push_away_rigid_bodies():
	#for i in get_slide_collision_count():
		#var c := get_slide_collision(i)
		#if c.get_collider() is RigidBody3D:
			#position = Vector3(position.x + 2000, position.y + 2000, position.z + 2000)
		#	var push_dir = -c.get_normal()
			# How much velocity the object needs to increase to match player velocity in the push direction
		#	var velocity_diff_in_push_dir = self.velocity.dot(push_dir) - c.get_collider().linear_velocity.dot(push_dir)
			# Only count velocity towards push dir, away from character
		#	velocity_diff_in_push_dir = max(0., velocity_diff_in_push_dir)
			# Objects with more mass than us should be harder to push. But doesn't really make sense to push faster than we are going
			#const MY_APPROX_MASS_KG = 80.0
			#var mass_ratio = min(1., MY_APPROX_MASS_KG / c.get_collider().mass)
			# Optional add: Don't push object at all if it's 4x heavier or more
			#if mass_ratio < 0.25:
			#	continue
			# Don't push object from above/below
			#push_dir.y = 0
			# 5.0 is a magic number, adjust to your needs
			#var push_force = mass_ratio * 2.0#5.0
			#c.get_collider().apply_impulse(push_dir * velocity_diff_in_push_dir * push_force, c.get_position() - c.get_collider().global_position)

func _physics_process(delta):
	handle_input()
	position.y = 0

func handle_input():
	var forward_dir = -transform.basis.z 
	if Input.is_action_just_pressed("dzialko1"):
		print("ss_1")
		get_node("dzialko").occupied = true
		get_node("dzialko2").occupied = false
	if Input.is_action_just_pressed("dzialko2"):
		print("ss_2")
		get_node("dzialko").occupied = false
		get_node("dzialko2").occupied = true
	# 🚀 Forward / Backward thrust
	if Input.is_action_pressed("forward"):
		apply_central_impulse(forward_dir * thrust_force)

	if Input.is_action_pressed("back"):
		apply_central_impulse(-forward_dir * thrust_force)

	# 🔄 Left / Right rotation (yaw)
	if Input.is_action_pressed("right"):
		rotation_degrees.y = rotation_degrees.y + 2
		#get_node("Imperial2").rotation_degrees.y = get_node("Imperial2").rotation_degrees.y + 2
		#get_node("CollisionShape3D").rotation_degrees.y = get_node("CollisionShape3D").rotation_degrees.y + 2
		#get_node("dzialko").rotation_degrees.y = get_node("dzialko").rotation_degrees.y + 2
		#get_node("dzialko2").rotation_degrees.y = get_node("dzialko2").rotation_degrees.y + 2
	if Input.is_action_pressed("left"):
		rotation_degrees.y = rotation_degrees.y - 2
		#get_node("Imperial2").rotation_degrees.y = get_node("Imperial2").rotation_degrees.y - 2
		#get_node("CollisionShape3D").rotation_degrees.y = get_node("CollisionShape3D").rotation_degrees.y - 2
		#get_node("dzialko").rotation_degrees.y = get_node("dzialko").rotation_degrees.y - 2
		#get_node("dzialko2").rotation_degrees.y = get_node("dzialko2").rotation_degrees.y - 2
	#move_and_slide()
