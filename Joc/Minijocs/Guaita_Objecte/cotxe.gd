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
	if position.y < 70:
		position.y = 70
	if position.y > 530:
		position.y = 530
		
	if position.x < 80:
		position.x = 80
	if position.x > 920:
		position.x = 920

