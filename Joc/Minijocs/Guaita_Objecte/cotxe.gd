extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
 # Replace with function body.
	pass
	
func _physics_process(delta):
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("FLETXA_AMUNT"):
		position.y -= 7
	if Input.is_action_pressed("FLETXA_AVALL"):
		position.y += 7
	if Input.is_action_pressed("FLETXA_DRETA") and position.x < 1000:
		position.x += 4
	if Input.is_action_pressed("FLETXA_ESQUERRA") and position.x > 0:
		position.x -= 7
	if position.y < 90:
		get_tree().quit()
	if position.y > 510:
		get_tree().quit()

#func _on_Cotxe_body_entered(body):
#	get_tree().quit()
	