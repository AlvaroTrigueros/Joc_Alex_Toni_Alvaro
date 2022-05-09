extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 1200
var salt = Vector2.UP * 400
var pegant = false
var morint = false
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(900,510)
	$EspasaP2/CollisionEspasa.set_deferred('disabled', true)
func _physics_process(delta):
		velocitat.x = 0
		if Input.is_action_pressed("FLETXA_DRETA"):
			velocitat += Vector2.RIGHT * velocitat_base
		if Input.is_action_pressed("FLETXA_ESQUERRA"):
			velocitat += Vector2.LEFT * velocitat_base
		if Input.is_action_just_pressed("FLETXA_AMUNT") and is_on_floor():
			velocitat += salt
		if Input.is_action_pressed("FLETXA_AVALL"):
			$EspasaP2/CollisionEspasa.set_deferred('disabled', false)
		else:
			pass
		velocitat += gravetat * delta

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
			if Input.is_action_pressed("FLETXA_AVALL") and Input.is_action_pressed("Protegeixte_LluitadeSables"):
				$EspasaP2/CollisionEspasa.set_deferred("disabled", true)
			elif Input.is_action_pressed("FLETXA_AVALL"):
				animacio.play("ataca")
				pegant = true
			if $CanvasLayer/BarraVida2.value == 20:
				animacio.play("mor")
				morint = true
				

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == 'ataca':
		pegant = false
		$EspasaP2/CollisionEspasa.set_deferred('disabled', true)
		
	if $AnimatedSprite.animation == "mor":
		$AnimatedSprite.stop()
		get_tree().change_scene("res://Minijocs/Lluita_de_sables/P1Guanya.tscn")
func _on_EspasaP1_body_entered(body):
	if Input.is_action_pressed("Protegeixte_LluitadeSables"):
		pass
	elif body.is_in_group("Personatge"):
		$CanvasLayer/BarraVida2.value -= 20
