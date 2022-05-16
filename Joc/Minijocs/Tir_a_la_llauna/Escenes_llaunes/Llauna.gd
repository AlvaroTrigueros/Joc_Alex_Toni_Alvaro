extends Node2D


# Declare member variables here. Examples:
var velocitat_llauna = null
#var Po = Vector2(0, 650)
var escala = 1.0
var gravetat = 350
var Va = 0
var hit = false
var destroy = 0
var canvia_sentit = 1

signal puntua
signal resta_vida
# var b = "text"

onready var sprite_forats = [$Forat1, $Forat2, $Forat3]
var forats = 0

#onready var forat = Sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	for forat in sprite_forats:
		forat.visible = false
		
	position = Vector2(rand_range(0+200, 1024-200), 650)
	
	if rand_range(1, 2) < 1.3:
		escala = rand_range(0.5, 1)
	
	Va = rand_range(-30, 30)
	
	
	#FALTA HACER QUE SI SPAWNEAN A UN LADO NO VAYAN MUY RAPIDAS EN EL MISMO SENTIDO
	velocitat_llauna = genera_velocitat_llauna()
	
	
	scale = Vector2(escala, escala)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocitat_llauna.y += gravetat*delta
	
	
	if hit:
		destroy += 1*delta
		
	if destroy > 0.05:
		scale *= 0.97
		#FALTA HACER QUE CUANDO SE LE DÉ VAYA AL FONDO, POR DETRÁS DE LAS OTRAS LATAS, PERO NO DEL FONDO
		
	
	if scale.x < 0.01:
		queue_free()
	
	if (position.y > 700 or position.x < 0-50 or position.x > 1024+50) and not hit:
		emit_signal('resta_vida')
		queue_free()
		
	rotation_degrees += Va*delta
	
	position.x += velocitat_llauna.x*delta
	position.y += velocitat_llauna.y*delta


func _on_Area_llauna_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		hit = true
		
		sprite_forats[forats].visible = true
		sprite_forats[forats].global_position = get_global_mouse_position() #+ Vector2(0, -5) * escala 
		forats+=1
		
		canvia_sentit = (randi()%2)
		#print(canvia_sentit)
		if canvia_sentit == 0:
			canvia_sentit = -1
			
		Va *= canvia_sentit * rand_range(3, 10)
		velocitat_llauna.x *= canvia_sentit
		
		emit_signal('puntua')


func genera_velocitat_llauna():
	var velocitat_llauna = Vector2.ZERO
	
	velocitat_llauna.y = rand_range(-650, -450)
	
	var troba_nova_velocitat = true
	
	while troba_nova_velocitat:
		randomize()
		velocitat_llauna.x = rand_range(-300, 300)
			
		if (position.x < 0+250 and velocitat_llauna.x < -150) or (position.x > 1024-250 and velocitat_llauna.x > 150):
			pass
			
		else:
			break
	
	return velocitat_llauna
