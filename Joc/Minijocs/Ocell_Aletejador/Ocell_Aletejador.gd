extends Node2D


# Declare member variables here. Examples:
# var a = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	$Ocell.velocitat_ocell = Vector2(0 ,0)
	$Ocell.salt = -350
	$Ocell.gravetat = 1000
	$Canyeria1.velocitat_canyeria = 200
	$Canyeria2.velocitat_canyeria = 200
	$Canyeria3.velocitat_canyeria = 200
#	$Ocell.AnimatedSprite.play('aleteja', true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Ocell.gravetat == 0:
		$Canyeria1.velocitat_canyeria = 0
		$Canyeria2.velocitat_canyeria = 0
		$Canyeria3.velocitat_canyeria = 0
		
	
		if Input.is_action_just_pressed("Salta_ocell_aletejador"):
			get_tree().reload_current_scene()
