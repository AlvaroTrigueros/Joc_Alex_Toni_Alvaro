extends Area2D
var a = rand_range(-3,0)
func _ready():
	position.x = rand_range(0,400)
func _physics_process(delta):
	position.x -= a

