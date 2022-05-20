extends Node2D
var speed = 500
var direction = Vector2(0.5,1)
var moviment = false
var comptador = 30

func _ready():
	pass
		

func _physics_process(delta):
	if Input.is_action_just_released("ESPAI"):
		moviment = true
	if moviment == true:
		direction = direction.normalized()
		var velocity = speed * direction * delta
		var collision = $Bola.move_and_collide(velocity)
		if collision:
			if(collision.collider.name == "Plataforma"):
				var dif
				dif = $Bola.global_position - collision.collider.global_position
				var direccio_final
				var angle
				angle = dif.x * 90/70
				angle = clamp(angle, -70, 70)
				print(90 + angle)
				angle = deg2rad(90 + angle)

				direccio_final = Vector2(cos(angle), sin(angle))

				direction = -direccio_final
			else:
				direction = direction.bounce(collision.normal)
				if(collision.collider.is_in_group("blocs")):
					collision.collider.hit()
			
			
	if $CanvasLayer/TextureProgress.value == 0:
		get_tree().change_scene("res://Minijocs//Joc Bola Rebotadora/GameOver.tscn")


func _on_VisibilityNotifier2D_screen_exited():
	$Bola.global_position = Vector2(500,555)
	$CanvasLayer/TextureProgress.value -= 33
	moviment = false
