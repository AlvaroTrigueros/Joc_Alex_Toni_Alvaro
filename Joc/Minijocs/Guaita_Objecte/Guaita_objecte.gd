extends Node2D


var carril_baix = 495
var carril_mig = 300
var carril_alt = 108

var temps_entre_cotxes = 3
	
var temps = 0

var cotxes = []

var last_height = 0
var last_time = 0

var carril

var escala = Vector2(0.55, 0.55)

var cotxe1 =  preload("res://Minijocs/Guaita_Objecte/obj3.tscn")
var cotxe2 = preload("res://Minijocs/Guaita_Objecte/obj1.tscn")

var puntuacio_guaita_l_objecte = 0
func _ready():
	$Cotxe.scale = escala
	cotxes = genera_cotxes()
	#print(cotxes)
	
	
func _process(delta):
	temps += 1 * delta
	puntuacio_guaita_l_objecte += 1*delta
	
	if temps > cotxes[0][2]:
		temps = 0
		var NouCotxe = cotxes[0][0].instance()
		NouCotxe.global_position = Vector2(-100, cotxes[0][1])
		
		var v
		if cotxes[1][2] == 0:
			v = Vector2(200, 0)
		else:
			v = Vector2(200, rand_range(-100, 100))
		
		NouCotxe.connect('mort', self, '_on_Area_cotxe_area_shape_entered')
		NouCotxe.velocitat_cotxe = Vector2(200, rand_range(-100, 100))
		NouCotxe.scale = escala
		add_child(NouCotxe)
		cotxes.erase(cotxes[0])

func genera_cotxes():
	var llista_cotxes = []
	for c in range (0, 1000):
		var o_cotxe = [[cotxe1, cotxe2][randi() % 2], genera_altura(), genera_temps_entre_cotxes()]
		llista_cotxes.append(o_cotxe)
	
	return llista_cotxes
		
	
func genera_altura():
	
	carril = last_height
	while carril == last_height:
		randomize()
		carril = randi() % 3
	last_height = carril
	return [495, 300, 108][carril]
	
func genera_temps_entre_cotxes():
	randomize()
	var t = randi() % 5
	if t == 4 and last_time != 0:
		last_time = 0
		return 0
	last_time = 1
	return rand_range(1.2, temps_entre_cotxes)
	
	
func _on_Area_cotxe_area_shape_entered():
	print(puntuacio_guaita_l_objecte)
	puntuacio_guaita_l_objecte = int(puntuacio_guaita_l_objecte)
	print(puntuacio_guaita_l_objecte)
	get_tree().reload_current_scene()
