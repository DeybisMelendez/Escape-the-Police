extends Sprite

var vel = 300

func _ready():
	autoload.moneda -= 10

func _physics_process(delta):
	global_position.x = global_position.x - vel * delta
	if global_position.x < -64:
		queue_free()