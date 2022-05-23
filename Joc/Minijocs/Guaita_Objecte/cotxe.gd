extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var velocitat = Vector2(0,0)
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("FLETXA_AMUNT"):
		position.y -= 6*60*delta
	if Input.is_action_pressed("FLETXA_AVALL"):
		position.y += 6*60*delta
	if Input.is_action_pressed("FLETXA_DRETA") and position.x < 1000:
		position.x += 4*60*delta
	if Input.is_action_pressed("FLETXA_ESQUERRA") and position.x > 0:
		position.x -= 6*60*delta
	if position.y < 90:
		position.y = 90
	if position.y > 510:
		position.y = 510
		
	if position.x < 50:
		position.x = 50
	if position.x > 1000:
		position.x = 1000

