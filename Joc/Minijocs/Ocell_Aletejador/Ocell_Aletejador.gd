extends Node2D


# Declare member variables here. Examples:
var altura_canyeria = 0
var troba_nova_altura = true
var puntuacio_ocell_aletejador = 0
var limit_genera_canyeria = 200

var text_puntuacions = 'Millors Puntuacions:\n'
var llista_puntuacions_per_text = []

var guarda_punuacio = true

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#print(llista_puntuacions)
	$Menu_mort.visible = false
	$Menu_mort/TornarAJugar.text = 'TORNA A JUGAR'
	$Menu_mort/TornarAMenu.text = 'TORNA A INICI'
	
	$Ocell.velocitat_ocell = Vector2(0 ,0)
	$Ocell.salt = -350
	$Ocell.gravetat = 1000
	
	$Canyeria1.velocitat_canyeria = 200
	$Canyeria2.velocitat_canyeria = 200
	$Canyeria3.velocitat_canyeria = 200
	
	#$Pantalla_mort.visible = false
	
	altura_canyeria = $Canyeria3.position.y
	
	$Marcador.text = str(puntuacio_ocell_aletejador)
	
	$Fons1.velocitat_fons = -100
	$Fons2.velocitat_fons = -100
	
	llista_puntuacions_per_text = $Ocell.llista_puntuacions.duplicate()
	llista_puntuacions_per_text.invert()
	#print(llista_puntuacions_per_text)
	for i in range(0,5):
		text_puntuacions += str(llista_puntuacions_per_text[i]) + '\n'
		
	$HighScoresText.text = text_puntuacions
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$Marcador.rect_size = $Marcador.get_font("font").get_string_size($Marcador.text)
	if $Canyeria1.velocitat_canyeria > 0.1:
		$Canyeria1.velocitat_canyeria += 2.5 * delta
		$Canyeria2.velocitat_canyeria += 2.5 * delta
		$Canyeria3.velocitat_canyeria += 2.5 * delta
	

	while troba_nova_altura:
		altura_canyeria = rand_range((altura_canyeria)+limit_genera_canyeria, (altura_canyeria)-limit_genera_canyeria)
		if altura_canyeria > 99 and altura_canyeria < 516:
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
	
	$Marcador.text = str(puntuacio_ocell_aletejador)
	
func _on_Canyeria2_puntua():
	puntuacio_ocell_aletejador += 1
	
	$Marcador.text = str(puntuacio_ocell_aletejador)

func _on_Canyeria3_puntua():
	puntuacio_ocell_aletejador += 1
	
	$Marcador.text = str(puntuacio_ocell_aletejador)



func _on_Ocell_ocell_aletejador_game_over():
	#llista_puntuacions.append()
	#save(llista_puntuacions, dic_file)
	
	$Canyeria1.velocitat_canyeria = 0
	$Canyeria2.velocitat_canyeria = 0
	$Canyeria3.velocitat_canyeria = 0
	
	$Fons1.velocitat_fons = 0
	$Fons2.velocitat_fons = 0
	
	#$Pantalla_mort.visible = true
	
	if guarda_punuacio:
		$Ocell.llista_puntuacions += [int(puntuacio_ocell_aletejador)]#.append(int(puntuacio_ocell_aletejador))
	#print($Ocell.llista_puntuacions)
		save($Ocell.llista_puntuacions, $Ocell.dic_file)
		
		guarda_punuacio = false
		
	#if Input.is_action_just_pressed("ESPAI"):
	if $Ocell.position.y > 575:
		$Menu_mort.visible = true

		$Menu_mort/Pantalla_mort.bbcode_text = '[center]'+'HAS MORT AMB UNA PUNTUACIO DE ' + str(puntuacio_ocell_aletejador)+'[/center]'
		if $Menu_mort/TornarAJugar.is_pressed():
			$Ocell.viu = true
			get_tree().reload_current_scene()

		if $Menu_mort/TornarAMenu.is_pressed():
			print('pues encara no va')

func save(llista_puntuacions, file_path):
	var contingut = ''
	llista_puntuacions.sort()
	for i in range(0, len(llista_puntuacions)):
		if llista_puntuacions[i] == 0:
			continue
		if i != len(llista_puntuacions)-1:
			contingut += str(llista_puntuacions[i]) + '\n'
		else:
			contingut += str(llista_puntuacions[i])
	#print(contingut)
	
	var file = File.new()
	
	file.open(file_path, File.WRITE)
	file.store_string(contingut)
	
	file.close()
	return
#	var2str() str2var()



