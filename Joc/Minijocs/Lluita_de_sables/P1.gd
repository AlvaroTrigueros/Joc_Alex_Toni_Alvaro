extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 1200
var salt = Vector2.UP * 400
var pegant = false
var morint = false

func _ready():
	position = Vector2(50,510)
	$EspasaP1/CollisionEspasa.set_deferred("disabled", true)
func _physics_process(delta):
		
		velocitat.x = 0
		if Input.is_action_pressed("D"):
			velocitat += Vector2.RIGHT * velocitat_base
		if Input.is_action_pressed("A"):
			velocitat += Vector2.LEFT * velocitat_base
		if Input.is_action_just_pressed("W") and is_on_floor():
			velocitat += salt
		velocitat += gravetat * delta
		if Input.is_action_pressed("S"):
			$EspasaP1/CollisionEspasa.set_deferred("disabled", false)
		else:
			pass
		velocitat = move_and_slide(velocitat, Vector2.UP)

		anima(velocitat)
		
func anima(velocitat: Vector2):
	var animacio = $AnimatedSprite
	if not morint:
		if not pegant:
			if velocitat.x > 0:
				animacio.flip_h  = false
				animacio.play("corre")
			elif velocitat.x < 0:
				animacio.flip_h = true
				animacio.play("corre")
		
			if velocitat.y < -1:
				animacio.play("salta")
			elif abs(velocitat.x) < 0.1:
				animacio.play("quiet")
			if Input.is_action_pressed("S") and Input.is_action_pressed("R"):
				$EspasaP1/CollisionEspasa.set_deferred("disabled", true)
			elif Input.is_action_pressed("S"):
				animacio.play("ataca")
				pegant = true
			if $Node2D/BarraVida1.value == 20:
				animacio.play("mor")
				morint = true
				
			


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == 'ataca':
		pegant = false
		$EspasaP1/CollisionEspasa.set_deferred("disabled", true)
	if $AnimatedSprite.animation == "mor":
		$AnimatedSprite.stop()
		get_tree().change_scene("res://Minijocs/Lluita_de_sables/P2Guanya.tscn")
func _on_EspasaP2_body_entered(body):
	if Input.is_action_pressed("R"):
		pass
	elif body.is_in_group("Personatge"):
		$Node2D/BarraVida1.value -= 20
