extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat_espasa = 10

# Called when the node enters the scene tree for the first time.
#func _ready():
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('S'):
		for i in range (3):
			rotation_degrees += velocitat_espasa
			
		for i in range (3):
			rotation_degrees -= velocitat_espasa
