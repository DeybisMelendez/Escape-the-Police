extends HBoxContainer

var moneda = 0
var combustible = 0
var tiempo = 0

func _process(delta):
	if autoload.moneda != moneda:
		$moneda.set_text("Coins: " +str(autoload.moneda))
		moneda = autoload.moneda
	if autoload.combustible != combustible:
		$combustible.set_text("Fuel: " + str(round(autoload.combustible)))
		combustible = autoload.combustible
	if autoload.tiempo != tiempo:
		$tiempo.set_text("Time: " + str(autoload.tiempo))
		tiempo = autoload.tiempo