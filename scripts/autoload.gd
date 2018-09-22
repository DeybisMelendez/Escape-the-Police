extends Node

var moneda = 10000
var combustible = 100
var tiempo = 180
var final1 = false
var final2 =  false
var velocidad = 150
var maxRecord = 0

func _ready():
	pass
#	maxRecord = cargarPartida()
#	if maxRecord == null:
#		maxRecord = 0

func guardarPartida(content):
	pass
#	var file = File.new()
#	file.open("user://save_game.dat", file.WRITE)
#	file.store_var(content)
#	file.close()


func cargarPartida():
	pass
#	var file = File.new()
#	if not file.file_exists("user://save_game.dat"):
#		return
#	file.open("user://save_game.dat", file.READ)
#	var content = file.get_var()
#	file.close()
#	return content


func _on_tiempo_timeout():
	if combustible > 0 and !final1 and !final2:
		if tiempo > 0:
			tiempo -= 1
			