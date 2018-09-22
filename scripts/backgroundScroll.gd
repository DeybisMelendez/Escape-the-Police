extends ParallaxBackground

export var velocidadBackground = 350
var scrollOffset = Vector2(0,0)
func _physics_process(delta):
	if !autoload.final1 and !autoload.final2:
		scrollOffset -= Vector2(velocidadBackground,0) * delta
		set_scroll_offset( scrollOffset )