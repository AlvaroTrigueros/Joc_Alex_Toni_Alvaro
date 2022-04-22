extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat_ocell = Vector2(0 ,0)
var salt = -350
var gravetat = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocitat_ocell.y += gravetat * delta
	if Input.is_action_just_pressed("Salta_ocell_aletejador"):
		if velocitat_ocell.y > 0:
			velocitat_ocell.y = salt
		else:
			if velocitat_ocell.y > -500:
				velocitat_ocell.y += salt
			else: 
				pass
	move_and_slide(velocitat_ocell)

func ocell_aletejador_game_over():
	gravetat = 0
	velocitat_ocell.y = 0
	salt = 0
	$AnimatedSprite.stop()

func _on_Canyeria_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Ocell':
		ocell_aletejador_game_over()


func _on_Terra_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Ocell':
		ocell_aletejador_game_over()
