extends Node2D
var speed = 500
var direction = Vector2(0.5,1)
var moviment = false
var comptador = 30

func _ready():
	pass
		
func _process(delta):
	if comptador == 0:
		get_tree().change_scene("res://Minijocs/Joc Bola Rebotadora/YouWin.tscn")
func _physics_process(delta):
	
	if Input.is_action_just_released("ESPAI"):
		moviment = true
	if moviment == true:
		direction = direction.normalized()
		var velocity = speed * direction * delta
		var collision = $Bola.move_and_collide(velocity)
		if collision:
			#direction = direction.bounce(collision.normal)
			if(collision.collider.name == "Plataforma"):
				var dif
				dif = $Bola.global_position - collision.collider.global_position
				var direccio_final
				var angle
				angle = abs(dif.x) * 1.20160214
				if angle < 20:
					angle = 20
				if angle > 70:
					angle = 70
				angle = 90 - angle

				direccio_final = Vector2(cos(angle), sin(angle))
				if dif.x < 0:
					direccio_final.x = -abs(direccio_final.x)
				elif dif.x > 0:
					direccio_final.x = abs(direccio_final.x)
				print(angle, direccio_final)
				direction = direction.bounce(collision.normal)
				
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
