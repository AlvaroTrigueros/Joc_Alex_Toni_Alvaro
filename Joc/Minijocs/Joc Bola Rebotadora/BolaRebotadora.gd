extends Node2D

onready var bl = preload("res://Minijocs/Joc Bola Rebotadora/Blocs.tscn")
var graella = [Vector2.ZERO]
var numero_blocs = 0

func posar_blocs():

	for j in range(30):
		var bloc = bl.instance()
		bloc.position = Vector2.ZERO
		while bloc.position in graella:
			bloc.position = Vector2((randi()%9 + 1)*100, (randi()%5 + 1) * 50 + 100)
		graella.append(bloc.position)
		bloc.scale = Vector2(rand_range(1,1.6),rand_range(1,1.6))
		var a = randi()%3
		bloc.color = a
		numero_blocs += 1
		bloc.connect("mort", self, 'resta_bloc')
		$Joc.add_child(bloc)
		
				
func _ready():
	$Control.visible = false
	randomize()
	$Joc/Bola.position = Vector2(500, 555)
	$Joc/Plataforma.position = Vector2(500,570)
	$Joc/Plataforma.scale = Vector2(0.7,0.7)
	posar_blocs()

func resta_bloc():
	numero_blocs -= 1
	if numero_blocs <= 0:
		get_tree().change_scene("res://Minijocs/Joc Bola Rebotadora/YouWin.tscn")

