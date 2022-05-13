extends Node2D
var speed = 500
var direction = Vector2(0.5,1)
var moviment = false
var comptador = 30
var a
func _ready():
	pass
		
func _process(delta):
	if comptador == 0:
		get_tree().change_scene("res://Minijocs/Joc Bola Rebotadora/YouWin.tscn")
func _physics_process(delta):
	a = false
	if Input.is_action_just_released("ESPAI"):
		moviment = true
	if moviment == true:
		direction = direction.normalized()
		var velocity = speed * direction * delta
		var collision = $Bola.move_and_collide(velocity)
		if collision:
			#direction = direction.bounce(collision.normal)
			if(collision.collider.name == "Plataforma"):
				direction = direction.bounce(collision.normal)
				a = true
			else:
				direction = direction.bounce(collision.normal)
				if(collision.collider.name == "Bloc"):
					comptador -= 1
					collision.collider.hit()
			
			
	if $CanvasLayer/TextureProgress.value == 0:
		get_tree().change_scene("res://Minijocs//Joc Bola Rebotadora/GameOver.tscn")


func _on_VisibilityNotifier2D_screen_exited():
	$Bola.global_position = Vector2(500,540)
	$CanvasLayer/TextureProgress.value -= 33
	moviment = false
