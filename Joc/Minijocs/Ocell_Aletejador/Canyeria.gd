extends Node2D

var velocitat_canyeria = 200
signal puntua

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= velocitat_canyeria*delta
	


func _on_area_puntuacio_body_entered(body):
	if body.name == 'Ocell':
		emit_signal('puntua')
