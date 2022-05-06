extends KinematicBody2D
var numero_carrils = 2
var x = rand_range(-numero_carrils,numero_carrils)
var y = rand_range(-numero_carrils,numero_carrils)

var carril_baix = 495
var carril_mig = 300
var carril_alt = 108
var choice = 0
func random():
	randomize()
	var x = rand_range(-numero_carrils,numero_carrils)
	var y = rand_range(-numero_carrils,numero_carrils)

func _ready():
	position.x = rand_range(0,400)
		
func _physics_process(delta):
	position.x -= x
	position.y += y
	
	if position.y < carril_baix+1 and position.y > carril_baix-1 and abs(y) > 0.1:
		choice = rand_range(0,10)
		if choice != 1:
			y = 0
	
	if position.y < carril_mig+1 and position.y > carril_mig-1 and abs(y) > 0.1:
		choice = rand_range(0,10)
		if choice != 1:
			y = 0
	
	if position.y < carril_alt+1 and position.y > carril_alt-1 and abs(y) > 0.1:
		choice = rand_range(0,10)
		if choice != 1:
			y = 0
			
	if position.y >475:
		position.y = 475
		random()
	if position.y < 100:
		position.y = 100
		random()
	if position.x > 1500:
		position.x = -300
	if position.x < -250:
		position.x = 1500
		
