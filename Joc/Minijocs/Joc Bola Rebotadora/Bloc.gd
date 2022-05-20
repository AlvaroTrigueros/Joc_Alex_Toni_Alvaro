extends StaticBody2D

var vida = 0
var color :int
var colors = [Color(0,1,0), Color(0,0,1), Color(1,0,0)]

signal mort

func _ready():
	modulate = colors[color]
	vida = color + 1

func hit():
	vida -= 1
	if vida <= 0:
		emit_signal("mort")
		queue_free()
	modulate = colors[vida - 1]
