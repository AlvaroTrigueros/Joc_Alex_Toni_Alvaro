extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat_bala = Vector2(100, -200)
var gravetat = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocitat_bala.y += gravetat * delta
	position += velocitat_bala * delta
	
	if position.y > 700:
		queue_free()


func amaga():
	queue_free()
