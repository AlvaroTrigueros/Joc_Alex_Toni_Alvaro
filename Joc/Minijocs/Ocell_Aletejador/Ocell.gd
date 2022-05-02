extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat_ocell = Vector2(0 ,0)
var salt = -350
var gravetat = 1000
var limit_velocitat_ocell = 525

signal ocell_aletejador_game_over
var viu = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocitat_ocell.y < limit_velocitat_ocell:
		velocitat_ocell.y += gravetat * delta
		
	if Input.is_action_just_pressed("ESPAI"):
		if velocitat_ocell.y > 0:
			velocitat_ocell.y = salt
			
		elif velocitat_ocell.y > -limit_velocitat_ocell:
			if velocitat_ocell.y + salt <= -limit_velocitat_ocell:
				velocitat_ocell.y = -limit_velocitat_ocell
			else:
				velocitat_ocell.y += salt
	if not viu:
		ocell_aletejador_game_over()
		
	move_and_slide(velocitat_ocell)

func ocell_aletejador_game_over():
	gravetat = 0
	velocitat_ocell.y = 0
	salt = 0
	emit_signal('ocell_aletejador_game_over')
	$AnimatedSprite.stop()

func _on_Canyeria_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Ocell':
		viu = false


func _on_Terra_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Ocell':
		viu = false

