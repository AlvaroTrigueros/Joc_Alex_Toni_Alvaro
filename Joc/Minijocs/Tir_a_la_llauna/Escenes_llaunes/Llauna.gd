extends Node2D


# Declare member variables here. Examples:
var velocitat_llauna = Vector2.ZERO
var Po = Vector2(0, 650)
var escala = 1
var gravetat = 350
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if rand_range(1, 2) < 1.3:
		escala = rand_range(0.5, 1)
		
	velocitat_llauna.x = rand_range(-100, 100)
	velocitat_llauna.y = rand_range(, 100)
	scale = escala


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
