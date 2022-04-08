extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cont = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cont <= 10:
		position.x += 5
		cont+=1
	if cont>10 and cont <= 21:
		position.x -= 5
		cont+=1
	if cont > 21:
		cont = 0
