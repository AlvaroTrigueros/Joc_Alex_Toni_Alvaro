extends Area2D
var x = rand_range(-3,0)
var y = rand_range(-2,2)

func _ready():
	position.x = rand_range(0,400)
		
func _physics_process(delta):
	position.x -= x
	position.y += y
	
	if position.y >475:
		position.y = 475
		x = rand_range(-3,0)
		y = rand_range(-2,2)
	if position.y < 100:
		position.y = 100
		x = rand_range(-3,0)
		y = rand_range(-2,2)
	if position.x > 1500:
		position.x = -300
		x = rand_range(-3,0)
		y = rand_range(-2,2)

