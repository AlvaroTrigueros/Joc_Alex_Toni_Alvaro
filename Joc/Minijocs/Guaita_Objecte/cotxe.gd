extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var velocitat = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("FLETXA_AMUNT") and position.y >= 100:
		position.y -= 7
	if Input.is_action_pressed("FLETXA_AVALL") and position.y <= 500:
		position.y += 7
	
