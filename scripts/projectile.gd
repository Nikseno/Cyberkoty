extends Area3D

var speed = 400
var velocity = Vector3.ZERO

func _ready():
	velocity = -global_transform.basis.z * speed

func _physics_process(delta):
	global_position += velocity * delta


func _on_body_entered(body: Node3D) -> void:
	if(body is asteroid):
		body.kill()
		queue_free()
