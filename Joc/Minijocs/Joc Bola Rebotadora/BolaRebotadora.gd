extends Node2D

onready var bl = preload("res://Minijocs/Joc Bola Rebotadora/Blocs.tscn")
func posar_blocs():
	var numero_blocs = 0
	for j in range(65):
		var bloc = bl.instance()
		bloc.position = Vector2(rand_range(100,900), rand_range(150,400))
		bloc.scale = Vector2(rand_range(0.2,0.7),rand_range(0.2,0.7))
		bloc.modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
		numero_blocs += 1
		add_child(bloc)
				
func _ready():
	randomize()
	$Bola.position = Vector2(500, 540)
	$Plataforma.position = Vector2(500,570)
	$Plataforma.scale = Vector2(0.7,0.7)
	posar_blocs()


