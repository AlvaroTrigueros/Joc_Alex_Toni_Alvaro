extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_B_Settings_pressed():
	get_tree().change_scene("res://Settings.tscn")


func _on_TextureButton_pressed():
		get_tree().change_scene("res://inici.tscn")


func _on_B_Ocell_Aletejador_pressed():
	get_tree().change_scene("res://Minijocs/Ocell_Aletejador/Ocell_Aletejador.tscn")


func _on_B_Lluita_Sables_pressed():
	get_tree().change_scene('res://Minijocs/Lluita_de_sables/Lluita de sables.tscn')


func _on_B_Tic_Tac_Toe_pressed():
	get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/taulell.tscn')


func _on_B_Tir_A_Llauna_pressed():
	get_tree().change_scene('res://Minijocs/Tir_a_la_llauna/Tir_a_la_llauna.tscn')


func _on_B_Brakeout_pressed():
	get_tree().change_scene('res://Minijocs/Joc Bola Rebotadora/BolaRebotadora.tscn')

