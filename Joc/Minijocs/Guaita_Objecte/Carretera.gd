extends AnimatedSprite


#var velocitat = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x += 8
	#velocitat = 8
	if position.x > 1700:
		position.x = -1600
#	if Input.is_action_pressed("FLETXA_DRETA"):
#		position.x -= 7
#	if Input.is_action_pressed("FLETXA_ESQUERRA"):
#		position.x += 7
