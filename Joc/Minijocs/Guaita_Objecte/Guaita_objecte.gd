extends Node2D


var carril_baix = 495
var carril_mig = 300
var carril_alt = 108

var temps_entre_cotxes = 3
	
var temps = 0

var cotxes = []

var last = 0

var carril

var cotxe1 =  preload("res://Minijocs/Guaita_Objecte/obj3.tscn")
var cotxe2 = preload("res://Minijocs/Guaita_Objecte/obj1.tscn")

func _ready():
	$Cotxe.scale = Vector2(0.7, 0.7)
	cotxes = genera_cotxes()
	print(cotxes)
func _process(delta):
	temps += 1 * delta
	if temps_entre_cotxes > 0.6:
		temps_entre_cotxes -= 0.02*delta
	
	if temps > cotxes[0][2]:
		temps = 0
		var NouCotxe = cotxes[0][0].instance()
		NouCotxe.global_position = Vector2(-100, cotxes[0][1])
		NouCotxe.velocitat_cotxe = Vector2(200, rand_range(-100, 100))
		NouCotxe.scale = Vector2(0.7, 0.7)
		add_child(NouCotxe)
		

func genera_cotxes():
	var llista_cotxes = []
	for c in range (0, 1000):
		var o_cotxe = [[cotxe1, cotxe2][randi() % 2], genera_altura(), genera_temps_entre_cotxes()]
		llista_cotxes.append(o_cotxe)
	
	return llista_cotxes
		
	
func genera_altura():
	
	carril = last
	while carril == last:
		randomize()
		carril = randi() % 3
	last = carril
	return [495, 300, 108][carril]
	
func genera_temps_entre_cotxes():
	randomize()
	var t = randi() % 5
	if t == 4:
		return 0
	return rand_range(0.7, temps_entre_cotxes)
	
	
