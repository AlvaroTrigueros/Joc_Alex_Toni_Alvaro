extends Node2D

onready var bl = preload("res://Minijocs/Joc Bola Rebotadora/Blocs.tscn")
var graella = [Vector2.ZERO]


func posar_blocs():
	var numero_blocs = 0
	for j in range(30):
		var bloc = bl.instance()
		bloc.position = Vector2.ZERO
		while bloc.position in graella:
			bloc.position = Vector2((randi()%9 + 1)*100, (randi()%5 + 1) * 50 + 100)
		graella.append(bloc.position)
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



