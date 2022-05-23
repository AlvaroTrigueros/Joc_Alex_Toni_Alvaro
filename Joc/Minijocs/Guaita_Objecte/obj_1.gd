extends KinematicBody2D


var posicio_carril
var velocitat_cotxe = Vector2.ZERO


var carril_baix = 495
var carril_mig = 300
var carril_alt = 108


func _ready():
	randomize()
	


func _physics_process(delta):
	
	if position.y > carril_baix:
		position.y = carril_baix
	
		
	if position.y < carril_alt:
		position.y = carril_alt


	if (position.y < carril_baix+1 or position.y > carril_baix-1) and velocitat_cotxe.y > 0.1:
		velocitat_cotxe.y *= -1
			
	if (position.y < carril_mig+1 or position.y > carril_mig-1):
		velocitat_cotxe.y = 0

	if (position.y < carril_alt+1 or position.y > carril_alt-1) and velocitat_cotxe.y < 0.1:
		velocitat_cotxe.y *= -1
		
	
	if position.x > 1200:
		queue_free()
		
	move_and_slide(velocitat_cotxe)
	
	
func _on_Obj_1_area_entered(area):
	if area.name == 'Cotxe':
		mor()
	

func mor():
	get_tree().reload_current_scene()
