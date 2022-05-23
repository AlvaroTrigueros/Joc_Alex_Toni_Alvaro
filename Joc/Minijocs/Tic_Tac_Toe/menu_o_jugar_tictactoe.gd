extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	if comenca < 0.5:
#		$Guanyatext.text = ('HAN GUANYAT LES X!')
#	else:
#		$Guanyatext.text = ('HAN GUANYAT LES O!')
	pass
func _on_menu_pressed():
	get_tree().change_scene("res://Menu_principal.tscn")


func _on_replay_pressed():
	get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/taulell.tscn')


func _on_menu1_pressed():
	get_tree().change_scene("res://Menu_principal.tscn")



func _on_replay1_pressed():
	get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/taulell.tscn')
