extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready(): #fukcje działające od początku gry
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event): #funkcje działające po input
	
	if event.is_action_pressed("ui_cancel"): #instant wyjscie z gry 
		get_tree().quit()
		
	#if event is InputEventMouseMotion : # obrót kamery?
		#rotate_y(deg_to_rad(-event.relative.x*sense_horizontal))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	
	# Rotation
	#var rot := 0;
	if Input.is_action_just_pressed("rotate_left"):
		rotate_y(deg_to_rad(-90))
	if Input.is_action_just_pressed("rotate_right"):
		rotate_y(deg_to_rad(90))
	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
