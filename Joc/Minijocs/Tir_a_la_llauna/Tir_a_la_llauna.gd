extends Node2D


# Declare member variables here. Examples:
var puntuacio_tir_a_la_llauna = 0
var tirs = 0
var precisio = 0
var vides_tir_a_la_llauna = 3

var reduccio_temps = 0
var minim_temps = 0
var temps_entre_llaunes = 2

var timing_llaunes = null


var Llauna_pepsico = preload('res://Minijocs/Tir_a_la_llauna/Escenes_llaunes/Llauna_pepsico.tscn')
var Llauna_fakecola = preload('res://Minijocs/Tir_a_la_llauna/Escenes_llaunes/Llauna_fakecola.tscn')
var Llauna_fantacherry = preload('res://Minijocs/Tir_a_la_llauna/Escenes_llaunes/Llauna_fantacherry.tscn')
var Llauna_llimonada = preload('res://Minijocs/Tir_a_la_llauna/Escenes_llaunes/Llauna_limonada.tscn')


var choices = [Llauna_pepsico, Llauna_fakecola, Llauna_fantacherry , Llauna_llimonada]
var nova_llauna = null


var genera_nova_llauna = 0


onready var animacio = $YSort/Pistola/AnimacioPistola


# Called when the node enters the scene tree for the first time.
func _ready():
	timing_llaunes = genera_temps_entre_llaunes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if vides_tir_a_la_llauna <= 0:
		get_tree().reload_current_scene()
		
	if Input.is_action_just_pressed("click_esquerra"):
		
		animacio.frame = 0
		
		#frames 1, 2 y 3 de (0 de 18) de la animacion  eliminados para que vaya más rápido
		animacio.play('dispara')
		tirs += 1
	
	$Marcador.text = str(puntuacio_tir_a_la_llauna)
	
	precisio = calcula_precisio()
	$Precisio.text = str(precisio) + '%'
	
	
	genera_nova_llauna += 1*delta
	
	if genera_nova_llauna > timing_llaunes[0]:
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
	if tirs == 0:
		return 0
	return round_to_dec(float(puntuacio_tir_a_la_llauna)/tirs * 100, 2)


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
