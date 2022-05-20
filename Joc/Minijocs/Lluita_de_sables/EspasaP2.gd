extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not (Input.is_action_pressed("FLETXA_DRETA") and Input.is_action_pressed("FLETXA_ESQUERRA")):
		
		if Input.is_action_pressed("FLETXA_DRETA"):
			set_scale(Vector2(1,1))
			
		if Input.is_action_pressed("FLETXA_ESQUERRA"):
			set_scale(Vector2(-1,1))
	else: pass
