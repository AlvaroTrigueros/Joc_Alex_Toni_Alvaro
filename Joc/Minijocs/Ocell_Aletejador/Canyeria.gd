extends Node2D


# Declare member variables here. Examples:
# var a = 2
var velocitat_canyeria = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= velocitat_canyeria*delta
	
	if position.x <= -50:
		position.x+=450*3
	
	
