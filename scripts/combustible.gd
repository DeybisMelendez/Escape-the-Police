extends Area2D

var velocidad = autoload.velocidad * 2

func _physics_process(delta):
	global_position.x = global_position.x - velocidad * delta
	if global_position.x < -64:
		queue_free()
	elif autoload.final1:
		queue_free()

func _on_combustible_body_entered(body):
	if body.is_in_group("jugador"):
		autoload.combustible = 100
		autoload.get_node("combustible").play()
		queue_free()