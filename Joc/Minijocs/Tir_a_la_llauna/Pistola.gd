extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var escala = Vector2(0.5, 0.5)
var Po = Vector2(400,420+escala.x*550)
var posicion = null


# Called when the node enters the scene tree for the first time.
func _ready():
	scale = escala
	position = Po

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	posicion = get_global_mouse_position().x
	if posicion > 945:
		posicion = 945
	
	position.x = posicion
	
	
