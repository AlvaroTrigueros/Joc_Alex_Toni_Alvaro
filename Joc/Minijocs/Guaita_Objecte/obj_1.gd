extends KinematicBody2D


var posicio_carril
var velocitat_cotxe = Vector2.ZERO


var carril_baix = 495
var carril_mig = 300
var carril_alt = 108

var canvis = 0

signal mort

func _ready():
	randomize()
	canvis = randi() % 3
	#print(canvis)


func _physics_process(delta):
	
	if position.y > carril_baix:
		position.y = carril_baix-1

	if position.y < carril_alt:
		position.y = carril_alt+1


	if (position.y > carril_baix-1) and velocitat_cotxe.y > 0.1:
		if canvis >= 1:
			canvis -= 1
			velocitat_cotxe.y *= -1
		else:
			velocitat_cotxe.y = 0
			
	if (position.y < carril_mig+1 and position.y > carril_mig-1):
		if canvis >= 1:
			canvis -= 1
		else:
			velocitat_cotxe.y = 0
	if (position.y < carril_alt+1) and velocitat_cotxe.y < 0.1 and canvis >= 1:
		if canvis >= 1:
			canvis -= 1
			velocitat_cotxe.y *= -1
		else:
			velocitat_cotxe.y = 0
			

	if position.x > 1200:
		queue_free()
		
	move_and_slide(velocitat_cotxe)
	
	

func _on_Area_cotxe_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == 'Cotxe':
		emit_signal('mort')

