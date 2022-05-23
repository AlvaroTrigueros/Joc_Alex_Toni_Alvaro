extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat = 7
# Called when the node enters the scene tree for the first time.
#func _ready():
# # Replace with function body.
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("FLETXA_AMUNT"):
		position.y -= velocitat
	if Input.is_action_pressed("FLETXA_AVALL"):
		position.y += velocitat
	if Input.is_action_pressed("FLETXA_DRETA") and position.x < 1000:
		position.x += velocitat/2
	if Input.is_action_pressed("FLETXA_ESQUERRA") and position.x > 0:
		position.x -= velocitat

	
