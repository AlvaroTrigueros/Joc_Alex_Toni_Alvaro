extends Node2D


# Declare member variables here. Examples:
var altura_canyeria = 0
var troba_nova_altura = true
var puntuacio_ocell_aletejador = 0
var limit_genera_canyeria = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	$Ocell.velocitat_ocell = Vector2(0 ,0)
	$Ocell.salt = -350
	$Ocell.gravetat = 1000
	$Canyeria1.velocitat_canyeria = 200
	$Canyeria2.velocitat_canyeria = 200
	$Canyeria3.velocitat_canyeria = 200
	
	altura_canyeria = $Canyeria3.position.y
	
	$Marcador.text = str(puntuacio_ocell_aletejador)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$Marcador.rect_size = $Marcador.get_font("font").get_string_size($Marcador.text)
	
	$Canyeria1.velocitat_canyeria += 2.5 * delta
	$Canyeria2.velocitat_canyeria += 2.5 * delta
	$Canyeria3.velocitat_canyeria += 2.5 * delta
	
		
	if $Ocell.gravetat == 0:
		$Canyeria1.velocitat_canyeria = 0
		$Canyeria2.velocitat_canyeria = 0
		$Canyeria3.velocitat_canyeria = 0
		
		if Input.is_action_just_pressed("ESPAI"):
			get_tree().reload_current_scene()
			
	
	while troba_nova_altura:
		altura_canyeria = rand_range((altura_canyeria)+limit_genera_canyeria, (altura_canyeria)-limit_genera_canyeria)
		if altura_canyeria > 99 and altura_canyeria < 516:
			print(altura_canyeria)
			limit_genera_canyeria += 10
			troba_nova_altura = false
			
	if $Canyeria1.position.x <= -50:
		$Canyeria1.position.x += 450*3
		troba_nova_altura = true
		$Canyeria1.position.y = altura_canyeria
		
	if $Canyeria2.position.x <= -50:
		$Canyeria2.position.x += 450*3
		troba_nova_altura = true
		$Canyeria2.position.y = altura_canyeria
		
	if $Canyeria3.position.x <= -50:
		$Canyeria3.position.x += 450*3
		troba_nova_altura = true
		$Canyeria3.position.y = altura_canyeria
		
	
func _on_Canyeria1_puntua():
	puntuacio_ocell_aletejador += 1
	print(puntuacio_ocell_aletejador)
	$Marcador.text = str(puntuacio_ocell_aletejador)
	
func _on_Canyeria2_puntua():
	puntuacio_ocell_aletejador += 1
	print(puntuacio_ocell_aletejador)
	$Marcador.text = str(puntuacio_ocell_aletejador)

func _on_Canyeria3_puntua():
	puntuacio_ocell_aletejador += 1
	print(puntuacio_ocell_aletejador)
	$Marcador.text = str(puntuacio_ocell_aletejador)


