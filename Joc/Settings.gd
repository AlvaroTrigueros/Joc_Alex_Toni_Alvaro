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


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Menu_principal.tscn")
	


func _on_HS_Volum_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Master'),value)


func _on_CheckButton_pressed():
	OS.window_borderless= !OS.window_borderless


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://credits.tscn")
	


func _on_PAntalla_completa_pressed():
	OS.window_fullscreen= !OS.window_fullscreen
