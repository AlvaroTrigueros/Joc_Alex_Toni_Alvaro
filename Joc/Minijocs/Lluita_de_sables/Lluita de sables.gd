extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$KinematicBody2D/Node2D/BarraVida1.rect_global_position = Vector2(-50,-1)
	$KinematicBody2D2/Node2D/BarraVida2.rect_global_position = Vector2(1074,-1)

