extends KinematicBody2D

export (PackedScene) var moneda

var dir = {
	arriba = Vector2(0,-1),
	abajo = Vector2(0,1),
	derecha = Vector2(1,0),
	izquierda = Vector2(-1,0)
}
var movimiento = Vector2()
var aceleracion = 500
var velMax = 500

func _physics_process(delta):
	#Control
	if autoload.combustible > 0:
		if Input.is_action_pressed("arriba"):
			movimiento += dir.arriba * aceleracion * delta
			rotation_degrees = -5
		elif Input.is_action_pressed("abajo"):
			movimiento += dir.abajo * aceleracion * delta
			rotation_degrees = 5
		else:
			movimiento.y = 0
			rotation_degrees = 0
		if Input.is_action_pressed("derecha"):
			movimiento += dir.derecha * aceleracion * delta
		elif Input.is_action_pressed("izquierda"):
			movimiento += dir.izquierda * aceleracion * delta
		else:
			movimiento.x = 0
		colision()
		limite()
#		combustible()
	else:
		movimiento = Vector2(-300,0)
	if autoload.tiempo < 1:
		autoload.final2 = true
	if global_position.x < -64:
		autoload.final1 = true
		queue_free()
	aplicarMovimiento()

func aplicarMovimiento():
	movimiento.x = clamp(movimiento.x,-velMax,velMax)
	movimiento.y = clamp(movimiento.y,-velMax,velMax)
	move_and_slide(movimiento)

func colision():
	if is_on_wall() and $tirarMoneda.is_stopped():
		$tirarMoneda.start()

func limite():
	if global_position.x > 960:
		global_position.x = 960

#func combustible():
#	autoload.combustible -= get_physics_process_delta_time() * 2
#	autoload.combustible = clamp(autoload.combustible,0,100)

func _on_tirarMoneda_timeout():
	autoload.get_node("coin").play()
	var nMoneda = moneda.instance()
	nMoneda.global_position = global_position
	get_parent().add_child(nMoneda)