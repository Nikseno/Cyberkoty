extends Area3D

var speed = 400
var velocity = Vector3.ZERO

func _ready():
	velocity = -global_transform.basis.z * speed

func _physics_process(delta):
	global_position += velocity * delta
