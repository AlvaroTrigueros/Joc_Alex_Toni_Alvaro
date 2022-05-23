extends Sprite


# Declare member variables here. Examples:
var velocitat_fons = -100

# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += velocitat_fons*delta
	if position.x <= -525:
		position.x += 525+1545
