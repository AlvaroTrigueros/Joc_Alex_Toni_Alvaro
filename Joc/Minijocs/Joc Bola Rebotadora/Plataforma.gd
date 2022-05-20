extends Node2D

var velocitat_base = Vector2(800,0)
var velocitat = Vector2.ZERO

func _physics_process(delta):
	velocitat.x = 0
	velocitat.y = 0
	if Input.is_action_pressed("FLETXA_DRETA"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("FLETXA_ESQUERRA"):
		velocitat += Vector2.LEFT * velocitat_base
	velocitat.y = 0
	velocitat = $Plataforma.move_and_slide((velocitat))
	velocitat.y = 0
