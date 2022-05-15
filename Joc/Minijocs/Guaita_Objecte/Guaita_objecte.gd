extends Node2D
var n_cotxes_carril = int(1)
var rand_x
var rand_y

func _ready():
	randomize()
	var a = rand_range(0,2)
	var b = rand_range(3,5)
	if int(a) == 0 or 3:
		for _i in range(n_cotxes_carril):
			var obj1 = preload("res://Minijocs/Guaita_Objecte/obj_1.tscn").instance()
			rand_x = rand_range(0,1125)
			rand_y = rand_range(100,125)
			obj1.global_position = Vector2(rand_x,rand_y)  
			add_child(obj1)
	if int(a) == 1 or 4:
		for _i in range(n_cotxes_carril):
			var obj1 = preload("res://Minijocs/Guaita_Objecte/obj_1.tscn").instance()
			rand_x = rand_range(0,300)
			rand_y = rand_range(300,325)
			obj1.global_position = Vector2(rand_x,rand_y)  
			add_child(obj1)
	if int(a) == 0 or 5:
		for _i in range(n_cotxes_carril):
			var obj1 = preload("res://Minijocs/Guaita_Objecte/obj_1.tscn").instance()
			rand_x = rand_range(0,1125)
			rand_y = rand_range(475,500)
			obj1.global_position = Vector2(rand_x,rand_y)  
			add_child(obj1)
			
		

	
	
