extends Area2D
var numero_carrils = 2
var x = rand_range(-numero_carrils,numero_carrils)
var y = rand_range(-numero_carrils,numero_carrils)
var abc = 0
var carril_baix = 495
var carril_mig = 300
var carril_alt = 108
var choice = 0

func random():
	randomize()
	var x = rand_range(-numero_carrils,numero_carrils)
	var y = rand_range(-numero_carrils,numero_carrils)
	print(y)
func _ready():
	position.x = rand_range(0,400)
		
func _physics_process(delta):
	position.x -= x
	position.y += y


	if position.y < carril_baix+1 and abs(y) > 0.1 or position.y > carril_baix-1 and abs(y) > 0.1:
		choice = rand_range(0,5)
		print(choice)
		if int(choice) == 1:
			y = 0
			position.y += y
		else: 
			randomize()
			y = rand_range(-3,0)
			x = rand_range(-3,3)
			print(x,y)
			position.y += y
			position.x += x
#		if abc > 5:
#			if rand_range(1,2) == 1:
#				position.y -= 2
#			abc = 0

	if position.y < carril_mig+1 and abs(y) > 0.1 or position.y > carril_mig-1 and abs(y) > 0.1:
		choice = rand_range(0,5)
		print(choice)
		if int(choice) == 1:
			y = 0
		else: 
			randomize()
			y = rand_range(-1.5,1.5)
			x = rand_range(-3,3)
			print(x,y)
			position.y += y
			position.x += x
#		if abc > 5:
#			if choice < 5:
#				position.y -= 2
#			else: 
#				position.y += 2
#			abc = 0
			

	if position.y < carril_alt+1 and abs(y) > 0.1 or position.y > carril_alt-1 and abs(y) > 0.1:
		choice = rand_range(0,5)
		print(choice)
		if int(choice) == 1:
			y = 0
		else: 
			randomize()
			y = rand_range(0,3)
			x = rand_range(-3,3)
			print(x,y)
			position.y += y
			position.x += x
#		if abc > 5:
#			position.y += 2
#			abc = 0
			
	if position.y > 482:
		position.y = 482
		
		position.y += y
		position.x += x +rand_range(-2,3)
	if position.y < 100:
		position.y = 100
		random()
		position.y += y
		position.x += x +rand_range(-2,3)
		
	if position.x > 1500:
		position.x = -250
		position.x += x +rand_range(1,3)
	if position.x < -250:
		var a = rand_range(1,2)
		position.x = 1500
		position.x -= x +rand_range(1,3)
		

func _on_Obj_1_area_entered(area):
	if area.name == 'Cotxe':
		get_tree().quit()
	if area.name == 'Obj_1':
		position.y += 0
		position.x += 0
