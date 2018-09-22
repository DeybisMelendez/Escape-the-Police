extends AnimationPlayer

export (PackedScene) var juego

var jugar = false
#func _ready():
#	play("inicio")

func _input(event):
	if Input.is_action_just_pressed("comenzar") and jugar:
		get_parent().get_node("fadeInFadeOut").play("fadeIn")

func _on_anim_animation_finished(inicio):
	play("clic")
	jugar = true

func _on_fadeInFadeOut_animation_finished(fadeIn):
	if jugar:
		get_tree().change_scene_to(juego)
