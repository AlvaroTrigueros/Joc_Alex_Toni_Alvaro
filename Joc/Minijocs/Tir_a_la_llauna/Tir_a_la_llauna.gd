extends Node2D


# Declare member variables here. Examples:
var puntuacio_tir_a_la_llauna = 0
var tirs = 0
var precisio = 0
var p = 0
var vides_tir_a_la_llauna = 5
var posicio_cors = Vector2(175, 50)
var mort = false


var reduccio_temps = 0
var minim_temps = 0
var temps_entre_llaunes = 2

var timing_llaunes = null


var Llauna_pepsico = preload('res://Minijocs/Tir_a_la_llauna/Escenes_llaunes/Llauna_pepsico.tscn')
var Llauna_fakecola = preload('res://Minijocs/Tir_a_la_llauna/Escenes_llaunes/Llauna_fakecola.tscn')
var Llauna_fantacherry = preload('res://Minijocs/Tir_a_la_llauna/Escenes_llaunes/Llauna_fantacherry.tscn')
var Llauna_llimonada = preload('res://Minijocs/Tir_a_la_llauna/Escenes_llaunes/Llauna_limonada.tscn')
var bala_dic = preload('res://Minijocs/Tir_a_la_llauna/textures_tir_a_la_llauna/Bala.tscn')

var choices = [Llauna_pepsico, Llauna_fakecola, Llauna_fantacherry , Llauna_llimonada]
var nova_llauna = null


var genera_nova_llauna = 0

onready var animacio = $YSort/Pistola/AnimacioPistola
var dic_high_score_tir_a_la_llauna = 'res://Minijocs/Tir_a_la_llauna/high_scores_tir_a_la_llauna.txt'
var text_puntuacions = 'Millors Puntuacions:\n'

var llista_puntuacions = load_file(dic_high_score_tir_a_la_llauna)


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu_mort.visible = false
	$Menu_mort/TornarAJugar.text = 'TORNA A JUGAR'
	$Menu_mort/TornarAMenu.text = 'TORNA A INICI'
	timing_llaunes = genera_temps_entre_llaunes()
	
	if len(llista_puntuacions)<5:
		for i in range(5):
			llista_puntuacions.append(0)
			
	llista_puntuacions.invert()
	for i in range(0,5):
		text_puntuacions += str(llista_puntuacions[i]) + '\n'
	
	$HighScoresText.text = text_puntuacions
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if vides_tir_a_la_llauna <= 0 and not mort:
		llista_puntuacions.append(puntuacio_tir_a_la_llauna)
		save(llista_puntuacions, dic_high_score_tir_a_la_llauna)
		mort = true
		for bala in get_tree().get_nodes_in_group('bales'):
			bala.queue_free()
	$Cors.value = vides_tir_a_la_llauna
	
	if mort:
		$Menu_mort.visible = true
	
		$Menu_mort/Pantalla_mort.bbcode_text = '[center]'+'HAS MORT AMB UNA PUNTUACIO DE ' + str(puntuacio_tir_a_la_llauna)+'[/center]'
		if $Menu_mort/TornarAJugar.is_pressed():
		
			get_tree().reload_current_scene()
	
			
	
	if Input.is_action_just_pressed("click_esquerra") and not mort:
		
		animacio.frame = 0
		
		#frames 1, 2 y 3 de (0 de 18) de la animacion  eliminados para que vaya más rápido
		animacio.play('dispara')
		tirs += 1
		
		var Bala = bala_dic.instance()
		Bala.scale = Vector2(0.3, 0.3)
		Bala.global_position = animacio.global_position + Vector2(210, 30)
		Bala.gravetat = 500
		
		add_child(Bala)
		
	precisio = calcula_precisio()
	$Precisio.text = str(precisio) + '%'
	$Marcador.text = str(puntuacio_tir_a_la_llauna)
	
	
	
	
	genera_nova_llauna += 1*delta
	
	if genera_nova_llauna > timing_llaunes[0] and not mort:
		#print(timing_llaunes[0])
		timing_llaunes.erase(timing_llaunes[0])
		
		genera_nova_llauna = 0
		
		var choices = nova_llista_llaunes()
		nova_llauna = choices[randi() % 4]
		
		nova_llauna.connect('puntua', self, '_on_KinematicBody2D_puntua')
		nova_llauna.connect('resta_vida', self, '_on_KinematicBody2D_resta_vida')
		
		$YSort.add_child(nova_llauna)
	
	
	
func nova_llista_llaunes():
	return [Llauna_pepsico.instance(), Llauna_fakecola.instance(), Llauna_fantacherry.instance(), Llauna_llimonada.instance()]


func _on_KinematicBody2D_puntua():
	puntuacio_tir_a_la_llauna += 1
	
	
func _on_KinematicBody2D_resta_vida():
	vides_tir_a_la_llauna -= 1
	
	
func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)


func calcula_precisio():
	print(puntuacio_tir_a_la_llauna, tirs)
	if tirs == 0:
		return 0
	p = round_to_dec(float(puntuacio_tir_a_la_llauna)/tirs * 100, 2)
	return p if p<100 else 100


func genera_temps_entre_llaunes():
	var lista = []
	for i in range(0,1000):
		randomize()
		temps_entre_llaunes = rand_range(minim_temps, 3-reduccio_temps)
		
		if temps_entre_llaunes < 0.3:
			minim_temps = 1.5-reduccio_temps/2
		else:
			minim_temps = 0
		
		reduccio_temps += 0.01
		
		lista.append(temps_entre_llaunes)
	#print(lista)
	return lista




func load_file(file_path):
	#https://godotengine.org/qa/57130/how-to-import-and-read-text
	var lista = []
	var file = File.new()
	file.open(file_path, File.READ)
	var index = 1
	
	while not file.eof_reached(): # iterate through all lines until the end of file is reached
		var line = file.get_line()
		lista.append(str2var(line))

		index += 1
	file.close()

	return lista
	


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
