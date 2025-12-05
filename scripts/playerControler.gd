extends CharacterBody3D

const SPEED = 5.0;
const ROTATION_TIME: float = 0.1 # in seconds

# func _ready() -> void:
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int());

func _input(event):
	# Handle rotation
	if event.is_action_pressed("rotate_left"):
		var rotate_tween := create_tween()
		rotate_tween.tween_property(self, "rotation:y", rotation.y - PI/2, ROTATION_TIME)
	elif event.is_action_pressed("rotate_right"):
		var rotate_tween := create_tween()
		rotate_tween.tween_property(self, "rotation:y", rotation.y + PI/2, ROTATION_TIME)

	# Handle quitting the game
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit();

func _physics_process(delta: float) -> void:
	if !is_multiplayer_authority(): return;
	
	# Add the gravity.
	if not is_on_floor(): 
		velocity += get_gravity() * delta
		
	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("left", "right", "forward", "back");
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized();
	if direction:
		velocity.x = direction.x * SPEED;
		velocity.z = direction.z * SPEED;
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED);
		velocity.z = move_toward(velocity.z, 0, SPEED);

	move_and_slide();
