extends Node2D

var direction = Vector2.ZERO
var moviment = false
var comptador = 30
func _ready():
	direction = Vector2(400,300)
		
func _process(delta):
	if comptador == 0:
		get_tree().change_scene("res://Minijocs/Joc Bola Rebotadora/YouWin.tscn")
func _physics_process(delta):
	if Input.is_action_just_released("ESPAI"):
		moviment = true
	if moviment == true:
		var collision = $Bola.move_and_collide(direction*delta)
		if collision:
			var reflect = collision.remainder.bounce(collision.normal)
			direction = direction.bounce(collision.normal)
			$Bola.move_and_collide(reflect)
			if(collision.collider.name == "Bloc"):
				comptador -= 1
				collision.collider.hit()
			
	if $CanvasLayer/TextureProgress.value == 0:
		get_tree().change_scene("res://Minijocs//Joc Bola Rebotadora/GameOver.tscn")


func _on_VisibilityNotifier2D_screen_exited():
	$Bola.global_position = Vector2(500,540)
	$CanvasLayer/TextureProgress.value -= 33
	moviment = false
