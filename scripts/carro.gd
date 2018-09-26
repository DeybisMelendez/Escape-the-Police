extends RigidBody2D

var velocidad = autoload.velocidad
var randomSprite = 0
var carrilIzq = false
func _ready():
	randomize()
	randomSprite = randi()%6+3
	velocidad += randi()%40
	print(velocidad)
	var sprite = load("res://sprites/carro"+str(randomSprite)+".png")
	var colision = load("res://sprites/collisionShape/carro"+str(randomSprite)+".tres")
	$Sprite.set_texture(sprite)
	$CollisionShape2D.set_shape(colision)
	if carrilIzq:
		$Sprite.flip_h = true
		velocidad = velocidad * 2

func _physics_process(delta):
	#velocidad = autoload.velocidad
	if autoload.final1:
		if carrilIzq:
			set_linear_velocity(Vector2(-velocidad * 3,0))
		else:
			set_linear_velocity(Vector2(velocidad * 4,0))
	else:
		set_linear_velocity(Vector2(-velocidad,0))
	if global_position.x < -64:
		queue_free()
	elif global_position.x > 1152:
		queue_free()