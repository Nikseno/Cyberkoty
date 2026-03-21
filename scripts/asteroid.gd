extends RigidBody3D
class_name asteroid
var r
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Replace with function body.
	$CollisionShape3D.scale = Vector3(1,1,1) * 8 * r# = Vector3(randf_range(1,3),randf_range(1,3),randf_range(1,3))
	$MeshInstance3D.scale =  Vector3(1,1,1) * 6 * r
	$MeshInstance3D2.scale =  Vector3(1,1,1) * 6 * r
	PhysicsServer3D.body_set_param(get_rid(), 3, Vector3(10000,10000,10000) * r)
	mass = 1000 * r
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if($MeshInstance3D2.scale != Vector3(1,1,1) * 6 * r):
		print("huj")
func _physics_process(delta: float) -> void:
	if(position.distance_to(get_parent().get_node("SpaceShip").position) > 5000):
		linear_velocity = position.direction_to(get_parent().get_node("SpaceShip").position) * 100
	if(position.distance_to(get_parent().get_node("SpaceShip").position) <= 25500):
		var c = int(position.distance_to(get_parent().get_node("SpaceShip").position) / 100)
		var z = 255 - c
#		$MeshInstance3D.mesh.material.albedo_color = Color(0.015, 0.369, 0.335, 1.0)
		#$MeshInstance3D2.mesh.material.albedo_color = Color(c,c,c,z)
	position.y = 0

func _on_timer_timeout() -> void:
	if(position.distance_to(get_parent().get_node("SpaceShip").position) > 2000):
		queue_free()
