extends Node3D

var asteroid = preload("res://scenes/asteroid.tscn")

func reset():
	for i in get_children():
		if(i is asteroid):
			i.process_mode = Node.PROCESS_MODE_DISABLED
			i.visible = false
		elif(i is space_ship):
			i.position = Vector3(0,0,0)
func _ready() -> void:
	_spawn_wave()

func _process(delta):
#	$FixedCamera.look_at($Executioner.transform.origin, $Executioner.transform.basis.y)
	pass
	
func _random_position():
	var pos
	pos = Vector3(randi_range(-500,500),
					0,
					randi_range(-500,500))
	while(pos.x < 150 and pos.x > -150):
		pos.x = randi_range(-500,500)
	#while(pos.y < 1500 and pos.y > -1500):
		#pos.y = randi_range(-5000,5000)
	while(pos.z < 150 and pos.z > -150):
		pos.z = randi_range(-500,500)
	return pos
func _spawn_wave():
	for i in range(0,10,1):
		var ast = asteroid.instantiate()
		ast.position = _random_position()
		var z = randi_range(1,6)
		if(z == 1):
			ast.r = 1
		elif(z == 2):
			ast.r = 1
		elif(z == 3):
			ast.r = 1
		elif(z == 4):
			ast.r = 1
		elif(z == 5):
			ast.r = 5
		elif(z == 6):
			ast.r = 5
		ast.linear_velocity = ast.position.direction_to($SpaceShip.position) * 100
		add_child(ast)


func _on_timer_timeout() -> void:
	pass#_spawn_wave() # Replace with function body.
