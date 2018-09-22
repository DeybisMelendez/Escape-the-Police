extends Node2D

var combustible = load("res://escenas/combustible.tscn") #El editor no me lo carga como PackedScene
export (PackedScene) var carro
export (PackedScene) var jugador

var random = 0
var random2 = 0
var terminarJuego = false

func _ready():
	autoload.get_node("tiempo").stop()
	autoload.moneda = 10000
	autoload.combustible = 100
	autoload.tiempo = 300
	autoload.final1 = false
	autoload.final2 = false

#func _input(event):
#	if Input.is_action_pressed("pausa"):
#		if !terminarJuego:
#			if get_tree().paused == false:
#				autoload.get_node("pausa").play()
#				get_tree().paused  = true
#			else:
#				autoload.get_node("pausa").play()
#				get_tree().paused = false

func _physics_process(delta):
	if autoload.final1 and !terminarJuego:
		$Camera2D._set_current(true)
		$carretera/policias/anim.stop()
		terminarJuego = true
		$anim.play("final1")
		yield($anim,"animation_finished")
		$finJuego.start()
	if autoload.final2 and !terminarJuego:
		$youEscaped.show()
		autoload.get_node("explosion").play()
		terminarJuego = true
		get_tree().paused = true
		$finJuego.start()

func _on_anim_animation_finished(inicio):
	$spawner.start()
	$spawner2.start()
	var nJugador = jugador.instance()
	nJugador.global_position = $carretera/jugSprite.global_position
	$carretera.add_child(nJugador)
	$carretera/jugSprite.global_position = Vector2(-512,320)
	autoload.get_node("tiempo").start()
	$aumentoDificultad.start()

func _on_spawner_timeout():
	if !terminarJuego:
		random = randi()%3
		for i in 3: # Carril izquierdo
			if random != i:
				var nCarro = carro.instance()
				nCarro.global_position = get_node("carretera/spawn/"+str(i)).global_position
				nCarro.carrilIzq = true
				$carretera.add_child(nCarro)
			elif randi()%32 == 0:
				var nCombustible = combustible.instance()
				nCombustible.global_position = get_node("carretera/spawn/"+str(i)).global_position
				$carretera/jugador.global_position
				$carretera.add_child(nCombustible)

func _on_spawner2_timeout():
	if !terminarJuego:
		random2 = randi()%3
		for a in 3: #Carril Derecho
			if random2 != a:
				var nCarro = carro.instance()
				nCarro.global_position = get_node("carretera/spawn/"+str(a+3)).global_position
				$carretera.add_child(nCarro)
			elif randi()%32 == 0:
				var nCombustible = combustible.instance()
				nCombustible.global_position = get_node("carretera/spawn/"+str(a+3)).global_position
				$carretera/jugador.global_position
				$carretera.add_child(nCombustible)

func _on_finJuego_timeout():
	var menuFinal = preload("res://escenas/menuFinal.tscn")
	$fadeInFadeOut.play("fadeIn")
	yield($fadeInFadeOut,"animation_finished")
	get_tree().paused = false
	get_tree().change_scene_to(menuFinal)

func _on_aumentoDificultad_timeout():
	$spawner.set_wait_time($spawner.get_wait_time() - 0.1)
	$spawner2.set_wait_time($spawner2.get_wait_time() - 0.2)
	autoload.velocidad += autoload.velocidad * 0.1