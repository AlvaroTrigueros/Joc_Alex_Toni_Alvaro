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


func _on_B_Guaita_Objecte_pressed():
	get_tree().change_scene('res://Minijocs/Guaita_Objecte/Guaita_objecte.tscn')


func _on_B_Ocell_Aletejador_pressed():
	get_tree().change_scene("res://Minijocs/Ocell_Aletejador/Ocell_Aletejador.tscn")


func _on_B_Lluita_Sables_pressed():
	get_tree().change_scene('res://Minijocs/Lluita_de_sables/Lluita de sables.tscn')


func _on_B_Tic_Tac_Toe_pressed():
	get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/bot_o_1v1.tscn')


func _on_B_Tir_A_Llauna_pressed():
	get_tree().change_scene('res://Minijocs/Tir_a_la_llauna/Tir_a_la_llauna.tscn')


func _on_B_Brakeout_pressed():
	get_tree().change_scene('res://Minijocs/Joc Bola Rebotadora/BolaRebotadora.tscn')




func _on_TextureButton3_pressed():
	get_tree().change_scene('res://Minijocs/Tir_a_la_llauna/explicacio_tir.tscn')


func _on_TextureButton6_pressed():
	get_tree().change_scene('res://Minijocs/Joc Bola Rebotadora/explicacio_bola.tscn')


func _on_TextureButton4_pressed():
	get_tree().change_scene("res://Minijocs/Lluita_de_sables/explicacio_sables.tscn")


func _on_TextureButton10_pressed():
	get_tree().change_scene("res://Minijocs/Ocell_Aletejador/explicacio_ocell.tscn")


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Minijocs/Guaita_Objecte/explicacio_cotxe.tscn")


func _on_TextureButton5_pressed():
	get_tree().change_scene("res://Minijocs/Tic_Tac_Toe/explicacio_ttt.tscn")
