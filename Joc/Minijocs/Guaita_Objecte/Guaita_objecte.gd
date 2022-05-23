extends Node2D
var n_cotxes_carril = int(1)
var rand_x
var rand_y
var obj1 = preload("res://Minijocs/Guaita_Objecte/obj_1.tscn")

var temps = 0

var escala_cotxes = Vector2(0.7, 0.7)
func _ready():
	
	
	$Cotxe.scale = escala_cotxes
	randomize()
	
func _physics_process(delta):
	var a = rand_range(0,2)
	if int(a) == 0:
		temps += 1 * delta
		for _i in range(n_cotxes_carril):
			var NewCar = obj1.instance()
#			rand_x = rand_range(0,1125)
			rand_y = rand_range(100,125)
			NewCar.global_position = Vector2(0,rand_y)
			NewCar.escala = escala_cotxes 
			add_child(NewCar)
#	if int(a) == 1 or 4:
#		for _i in range(n_cotxes_carril):
#			var obj1 = preload("res://Minijocs/Guaita_Objecte/obj_1.tscn").instance()
#			rand_x = rand_range(0,300)
#			rand_y = rand_range(300,325)
#			obj1.global_position = Vector2(rand_x,rand_y)  
#			add_child(obj1)
#	if int(a) == 0 or 5:
#		for _i in range(n_cotxes_carril):
#			var obj1 = preload("res://Minijocs/Guaita_Objecte/obj_1.tscn").instance()
#			rand_x = rand_range(0,1125)
#			rand_y = rand_range(475,500)
#			obj1.global_position = Vector2(rand_x,rand_y)  
#			add_child(obj1)
#
#

func genera_cotxes():
	#retorna una tupla (o llista(array)) amb l'objecte, la posició, i l'interval
	return [Vector2(0,rand_range(100,125))]
