extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat_ocell = Vector2(0 ,0)
var salt = -350
var gravetat = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocitat_ocell.y += gravetat * delta
	if Input.is_action_just_pressed('ESPAI'):
		if velocitat_ocell.y > 0:
			velocitat_ocell.y = salt
		else:
			if velocitat_ocell > -500:
				velocitat_ocell.y += salt
			else: 
				pass
	move_and_slide(velocitat_ocell)
