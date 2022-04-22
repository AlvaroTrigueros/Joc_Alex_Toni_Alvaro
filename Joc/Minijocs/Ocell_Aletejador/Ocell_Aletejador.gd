extends Node2D


# Declare member variables here. Examples:
# var a = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	$Ocell.velocitat_ocell = Vector2(0 ,0)
	$Ocell.salt = -350
	$Ocell.gravetat = 750
	$Ocell.AnimatedSprite.play('aleteja', true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Ocell.gravetat == 0:
		$Canyeria.velocitat_canyeria = 0
		
	
		if Input.is_action_just_pressed('ESPAI'):
			get_tree().reload_current_scene()
