extends Node2D


# Declare member variables here. Examples:
var comencar = 0
var t = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	
	randomize()
	comencar = rand_range(0,1)
	print(comencar)
	if comencar < 0.5:
		print('Comencen les Creus!')
		$RichTextLabel.set_text('Comencen les X!')
	else:
		print('Comencen les Rodones!')
		$RichTextLabel.set_text('Comencen les O!')
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $"Button(0,0)/Creu00".visible == true and $"Button(1,0)/Creu10".visible == true and $"Button(2,0)/Creu20".visible == true or $"Button(0,0)/Creu00".visible == true and $"Button(0,1)/Creu01".visible == true and $"Button(0,2)/Creu02".visible == true :
		#$RichTextLabel.set_text('HAN GUANYAT LES X!')
		yield(get_tree().create_timer(t), "timeout")
		get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/guanyencreus.tscn')
	if $"Button(1,0)/Creu10".visible == true and $"Button(1,1)/Creu11".visible == true and $"Button(1,2)/Creu12".visible == true or $"Button(0,2)/Creu02".visible == true and $"Button(1,2)/Creu12".visible == true and $"Button(2,2)/Creu22".visible == true :
		#$RichTextLabel.set_text('HAN GUANYAT LES X!')
		yield(get_tree().create_timer(t), "timeout")
		get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/guanyencreus.tscn')
	if $"Button(0,1)/Creu01".visible == true and $"Button(1,1)/Creu11".visible == true and $"Button(2,1)/Creu21".visible == true or $"Button(2,0)/Creu20".visible == true and $"Button(2,1)/Creu21".visible == true and $"Button(2,2)/Creu22".visible == true :
		#$RichTextLabel.set_text('HAN GUANYAT LES X!')
		yield(get_tree().create_timer(t), "timeout")
		get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/guanyencreus.tscn')
	if $"Button(0,0)/Creu00".visible == true and $"Button(1,1)/Creu11".visible == true and $"Button(2,2)/Creu22".visible == true or $"Button(0,2)/Creu02".visible == true and $"Button(1,1)/Creu11".visible == true and $"Button(2,0)/Creu20".visible == true :
		#$RichTextLabel.set_text('HAN GUANYAT LES X!')
		yield(get_tree().create_timer(t), "timeout")
		get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/guanyencreus.tscn')
		
		
	if $"Button(0,0)/Cercle00".visible == true and $"Button(1,0)/Cercle10".visible == true and $"Button(2,0)/Cercle20".visible == true or $"Button(0,0)/Cercle00".visible == true and $"Button(0,1)/Cercle01".visible == true and $"Button(0,2)/Cercle02".visible == true :
		#$RichTextLabel.set_text('HAN GUANYAT LES O!')
		yield(get_tree().create_timer(t), "timeout")
		get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/guantenrodones.tscn')
	if $"Button(1,0)/Cercle10".visible == true and $"Button(1,1)/Cercle11".visible == true and $"Button(1,2)/Cercle12".visible == true or $"Button(0,2)/Cercle02".visible == true and $"Button(1,2)/Cercle12".visible == true and $"Button(2,2)/Cercle22".visible == true :
		#$RichTextLabel.set_text('HAN GUANYAT LES O!')
		yield(get_tree().create_timer(t), "timeout")
		get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/guantenrodones.tscn')
	if $"Button(0,1)/Cercle01".visible == true and $"Button(1,1)/Cercle11".visible == true and $"Button(2,1)/Cercle21".visible == true or $"Button(2,0)/Cercle20".visible == true and $"Button(2,1)/Cercle21".visible == true and $"Button(2,2)/Cercle22".visible == true :
		#$RichTextLabel.set_text('HAN GUANYAT LES O!')
		yield(get_tree().create_timer(t), "timeout")
		get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/guantenrodones.tscn')
	if $"Button(0,0)/Cercle00".visible == true and $"Button(1,1)/Cercle11".visible == true and $"Button(2,2)/Cercle22".visible == true or $"Button(0,2)/Cercle02".visible == true and $"Button(1,1)/Cercle11".visible == true and $"Button(2,0)/Cercle20".visible == true :
		#$RichTextLabel.set_text('HAN GUANYAT LES O!')
		yield(get_tree().create_timer(t), "timeout")
		get_tree().change_scene('res://Minijocs/Tic_Tac_Toe/guantenrodones.tscn')

		
	if $"Button(0,0)".pressed == true and $"Button(1,0)".pressed == true and $"Button(2,0)".pressed == true and $"Button(0,1)".pressed == true and $"Button(1,1)".pressed == true and $"Button(2,1)".pressed == true and $"Button(0,2)".pressed == true and $"Button(1,2)".pressed == true and $"Button(2,2)".pressed == true:
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().reload_current_scene()
		


func _on_Button00_pressed():
	$"Button(0,0)".pressed = true
	$RichTextLabel.set_text('')
	if comencar < 0.5:
		$"Button(0,0)/Creu00".visible = true
		comencar += 1 
		$"Button(0,0)".disabled = true
	else:
		$"Button(0,0)/Cercle00".visible = true
		comencar -= 1
		$"Button(0,0)".disabled = true

func _on_Button10_pressed():
	$RichTextLabel.set_text('')
	$"Button(1,0)".pressed = true
	if comencar < 0.5:
		$"Button(1,0)/Creu10".visible = true
		comencar += 1
		$"Button(1,0)".disabled = true
	else:
		$"Button(1,0)/Cercle10".visible = true
		comencar -= 1
		$"Button(1,0)".disabled = true

func _on_Button20_pressed():
	$"Button(2,0)".pressed = true
	$RichTextLabel.set_text('')
	if comencar < 0.5:
		$"Button(2,0)/Creu20".visible = true
		comencar += 1
		$"Button(2,0)".disabled = true
	else:
		$"Button(2,0)/Cercle20".visible = true
		comencar -= 1
		$"Button(2,0)".disabled = true

func _on_Button01_pressed():
	$"Button(0,1)".pressed = true
	$RichTextLabel.set_text('')
	if comencar < 0.5:
		$"Button(0,1)/Creu01".visible = true
		comencar += 1
		$"Button(0,1)".disabled = true
	else:
		$"Button(0,1)/Cercle01".visible = true
		comencar -= 1
		$"Button(0,1)".disabled = true

func _on_Button11_pressed():
	$"Button(1,1)".pressed = true
	$RichTextLabel.set_text('')
	if comencar < 0.5:
		$"Button(1,1)/Creu11".visible = true
		comencar += 1
		$"Button(1,1)".disabled = true
	else:
		$"Button(1,1)/Cercle11".visible = true
		comencar -= 1
		$"Button(1,1)".disabled = true

func _on_Button21_pressed():
	$"Button(2,1)".pressed = true
	$RichTextLabel.set_text('')
	if comencar < 0.5:
		$"Button(2,1)/Creu21".visible = true
		comencar += 1
		$"Button(2,1)".disabled = true
	else:
		$"Button(2,1)/Cercle21".visible = true
		comencar -= 1
		$"Button(2,1)".disabled = true

func _on_Button02_pressed():
	$"Button(0,2)".pressed = true
	$RichTextLabel.set_text('')
	if comencar < 0.5:
		$"Button(0,2)/Creu02".visible = true
		comencar += 1
		$"Button(0,2)".disabled = true
	else:
		$"Button(0,2)/Cercle02".visible = true
		comencar -= 1
		$"Button(0,2)".disabled = true

func _on_Button12_pressed():
	$"Button(1,2)".pressed = true
	$RichTextLabel.set_text('')
	if comencar < 0.5:
		$"Button(1,2)/Creu12".visible = true
		comencar += 1
		$"Button(1,2)".disabled = true
	else:
		$"Button(1,2)/Cercle12".visible = true
		comencar -= 1
		$"Button(1,2)".disabled = true

func _on_Button22_pressed():
	$"Button(2,2)".pressed = true
	$RichTextLabel.set_text('')
	if comencar < 0.5:
		$"Button(2,2)/Creu22".visible = true
		comencar += 1
		$"Button(2,2)".disabled = true
	else:
		$"Button(2,2)/Cercle22".visible = true
		comencar -= 1
		$"Button(2,2)".disabled = true


	
func _on_Timer_timeout():
	get_tree().quit()
