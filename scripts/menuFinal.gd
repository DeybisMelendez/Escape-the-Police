extends Node2D

func _ready():
	if autoload.final1:
		$Control/VBoxContainer/youWin.set_text("You Lose!")
	if autoload.moneda > autoload.maxRecord and autoload.final2:
		autoload.maxRecord = autoload.moneda
		autoload.guardarPartida(autoload.maxRecord)
		$Control/VBoxContainer/newRecord.set_text("New Record: " + str(autoload.moneda))
	else:
		$Control/VBoxContainer/newRecord.set_text("Your Record: " + str(autoload.moneda))
	$Control/maxRecord.set_text("Max Record: "+str(autoload.maxRecord))

func _on_Button_pressed():
	var menu = load("res://escenas/intro.tscn")
	$fadeInFadeOut.play("fadeIn")
	autoload.get_node("explosion").play()
	yield($fadeInFadeOut,"animation_finished")
	get_tree().change_scene_to(menu)

func _on_Button2_pressed():
	autoload.get_node("explosion").play()
	get_tree().quit()