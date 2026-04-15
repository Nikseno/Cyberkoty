extends RigidBody3D
class_name cat
var r
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angular_velocity = Vector3(randi_range(1,20),randi_range(1,20),randi_range(1,20))
	# Replace with function body.
#	$CollisionShape3D.scale = Vector3(1,1,1) * 8 * r# = Vector3(randf_range(1,3),randf_range(1,3),randf_range(1,3))
	#PhysicsServer3D.body_set_param(get_rid(), 3, Vector3(10000,10000,10000) * r)
	mass = 1000
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
#		$MeshInstance3D.mesh.material.albedo_color = Color(0.015, 0.369, 0.335, 1.0)
		#$MeshInstance3D2.mesh.material.albedo_color = Color(c,c,c,z)
	position.y = 0

func _on_timer_timeout() -> void:
	pass
