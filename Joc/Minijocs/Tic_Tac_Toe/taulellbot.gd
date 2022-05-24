extends Node2D
var comencar = 0
var t = 0.5
var butons = [1,2,3,4,5,6,7,8,9]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	randomize()
	comencar = rand_range(0,1)
	print(comencar)
	if comencar < 0.5:
		$RichTextLabel.set_text('Comences tu!')
	else:
		$RichTextLabel.set_text('Comença el bot!')
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
		
		
	if comencar > 0.5:
		if $"Button(0,0)/Cercle00".visible == true and $"Button(0,1)/Cercle01".visible == true and $"Button(0,2)".pressed == false:
			$"Button(0,2)".emit_signal("pressed")
		
		elif $"Button(0,1)/Cercle01".visible == true and $"Button(0,2)/Cercle02".visible == true and $"Button(0,0)".pressed == false:
			$"Button(0,0)".emit_signal("pressed")
		
		elif $"Button(0,0)/Cercle00".visible == true and $"Button(0,2)/Cercle02".visible == true and $"Button(0,1)".pressed == false:
			$"Button(0,1)".emit_signal("pressed")
		
		elif $"Button(1,0)/Cercle10".visible == true and $"Button(1,1)/Cercle11".visible == true and $"Button(1,2)".pressed == false:
			$"Button(1,2)".emit_signal("pressed")
		
		elif $"Button(1,1)/Cercle11".visible == true and $"Button(1,2)/Cercle12".visible == true and $"Button(1,0)".pressed == false:
			$"Button(1,0)".emit_signal("pressed")
		
		elif $"Button(1,0)/Cercle10".visible == true and $"Button(1,2)/Cercle12".visible == true and $"Button(1,1)".pressed == false:
			$"Button(1,1)".emit_signal("pressed")
		
		elif $"Button(2,0)/Cercle20".visible == true and $"Button(2,1)/Cercle21".visible == true and $"Button(2,2)".pressed == false:
			$"Button(2,2)".emit_signal("pressed")
		
		elif $"Button(2,1)/Cercle21".visible == true and $"Button(2,2)/Cercle22".visible == true and $"Button(2,0)".pressed == false:
			$"Button(2,0)".emit_signal("pressed")
		
		elif $"Button(2,0)/Cercle20".visible == true and $"Button(2,2)/Cercle22".visible == true and $"Button(2,1)".pressed == false:
			$"Button(2,1)".emit_signal("pressed")
		
		elif $"Button(0,0)/Cercle00".visible == true and $"Button(1,0)/Cercle10".visible == true and $"Button(2,0)".pressed == false:
			$"Button(2,0)".emit_signal("pressed")
		
		elif $"Button(0,0)/Cercle00".visible == true and $"Button(2,0)/Cercle20".visible == true and $"Button(1,0)".pressed == false:
			$"Button(1,0)".emit_signal("pressed")
		
		elif $"Button(1,0)/Cercle10".visible == true and $"Button(2,0)/Cercle20".visible == true and $"Button(0,0)".pressed == false:
			$"Button(0,0)".emit_signal("pressed")
		
		elif $"Button(0,1)/Cercle01".visible == true and $"Button(1,1)/Cercle11".visible == true and $"Button(2,1)".pressed == false:
			$"Button(2,1)".emit_signal("pressed")
		
		elif $"Button(0,1)/Cercle01".visible == true and $"Button(2,1)/Cercle21".visible == true and $"Button(1,1)".pressed == false:
			$"Button(1,1)".emit_signal("pressed")
		
		elif $"Button(1,1)/Cercle11".visible == true and $"Button(2,1)/Cercle21".visible == true and $"Button(0,1)".pressed == false:
			$"Button(0,1)".emit_signal("pressed")
		
		elif $"Button(0,2)/Cercle02".visible == true and $"Button(1,2)/Cercle12".visible == true and $"Button(2,2)".pressed == false:
			$"Button(2,2)".emit_signal("pressed")
		
		elif $"Button(0,2)/Cercle02".visible == true and $"Button(2,2)/Cercle22".visible == true and $"Button(1,2)".pressed == false:
			$"Button(1,2)".emit_signal("pressed")
		
		elif $"Button(1,2)/Cercle12".visible == true and $"Button(2,2)/Cercle22".visible == true and $"Button(0,2)".pressed == false:
			$"Button(0,2)".emit_signal("pressed")
		
		elif $"Button(0,0)/Cercle00".visible == true and $"Button(1,1)/Cercle11".visible == true and $"Button(2,2)".pressed == false:
			$"Button(2,2)".emit_signal("pressed")
		
		elif $"Button(0,0)/Cercle00".visible == true and $"Button(2,2)/Cercle22".visible == true and $"Button(1,1)".pressed == false:
			$"Button(1,1)".emit_signal("pressed")
		
		elif $"Button(1,1)/Cercle11".visible == true and $"Button(2,2)/Cercle22".visible == true and $"Button(0,0)".pressed == false:
			$"Button(0,0)".emit_signal("pressed")
		
		elif $"Button(0,2)/Cercle02".visible == true and $"Button(1,1)/Cercle11".visible == true and $"Button(2,0)".pressed == false:
			$"Button(2,0)".emit_signal("pressed")
		
		elif $"Button(0,2)/Cercle02".visible == true and $"Button(2,0)/Cercle20".visible == true and $"Button(1,1)".pressed == false:
			$"Button(1,1)".emit_signal("pressed")
		
		elif $"Button(1,1)/Cercle11".visible == true and $"Button(2,0)/Cercle20".visible == true and $"Button(0,2)".pressed == false:
			$"Button(0,2)".emit_signal("pressed")
		
		elif $"Button(0,0)/Creu00".visible == true and $"Button(0,1)/Creu01".visible == true and $"Button(0,2)".pressed == false:
			$"Button(0,2)".emit_signal("pressed")
		
		elif $"Button(0,1)/Creu01".visible == true and $"Button(0,2)/Creu02".visible == true and $"Button(0,0)".pressed == false:
			$"Button(0,0)".emit_signal("pressed")
		
		elif $"Button(0,0)/Creu00".visible == true and $"Button(0,2)/Creu02".visible == true and $"Button(0,1)".pressed == false:
			$"Button(0,1)".emit_signal("pressed")
		
		elif $"Button(1,0)/Creu10".visible == true and $"Button(1,1)/Creu11".visible == true and $"Button(1,2)".pressed == false:
			$"Button(1,2)".emit_signal("pressed")
		
		elif $"Button(1,1)/Creu11".visible == true and $"Button(1,2)/Creu12".visible == true and $"Button(1,0)".pressed == false:
			$"Button(1,0)".emit_signal("pressed")
		
		elif $"Button(1,0)/Creu10".visible == true and $"Button(1,2)/Creu12".visible == true and $"Button(1,1)".pressed == false:
			$"Button(1,1)".emit_signal("pressed")
		
		elif $"Button(2,0)/Creu20".visible == true and $"Button(2,1)/Creu21".visible == true and $"Button(2,2)".pressed == false:
			$"Button(2,2)".emit_signal("pressed")
		
		elif $"Button(2,1)/Creu21".visible == true and $"Button(2,2)/Creu22".visible == true and $"Button(2,0)".pressed == false:
			$"Button(2,0)".emit_signal("pressed")
		
		elif $"Button(2,0)/Creu20".visible == true and $"Button(2,2)/Creu22".visible == true and $"Button(2,1)".pressed == false:
			$"Button(2,1)".emit_signal("pressed")
		
		elif $"Button(0,0)/Creu00".visible == true and $"Button(1,0)/Creu10".visible == true and $"Button(2,0)".pressed == false:
			$"Button(2,0)".emit_signal("pressed")
		
		elif $"Button(0,0)/Creu00".visible == true and $"Button(2,0)/Creu20".visible == true and $"Button(1,0)".pressed == false:
			$"Button(1,0)".emit_signal("pressed")
		
		elif $"Button(1,0)/Creu10".visible == true and $"Button(2,0)/Creu20".visible == true and $"Button(0,0)".pressed == false:
			$"Button(0,0)".emit_signal("pressed")
		
		elif $"Button(0,1)/Creu01".visible == true and $"Button(1,1)/Creu11".visible == true and $"Button(2,1)".pressed == false:
			$"Button(2,1)".emit_signal("pressed")
		
		elif $"Button(0,1)/Creu01".visible == true and $"Button(2,1)/Creu21".visible == true and $"Button(1,1)".pressed == false:
			$"Button(1,1)".emit_signal("pressed")
		
		elif $"Button(1,1)/Creu11".visible == true and $"Button(2,1)/Creu21".visible == true and $"Button(0,1)".pressed == false:
			$"Button(0,1)".emit_signal("pressed")
		
		elif $"Button(0,2)/Creu02".visible == true and $"Button(1,2)/Creu12".visible == true and $"Button(2,2)".pressed == false:
			$"Button(2,2)".emit_signal("pressed")
		
		elif $"Button(0,2)/Creu02".visible == true and $"Button(2,2)/Creu22".visible == true and $"Button(1,2)".pressed == false:
			$"Button(1,2)".emit_signal("pressed")
		
		elif $"Button(1,2)/Creu12".visible == true and $"Button(2,2)/Creu22".visible == true and $"Button(0,2)".pressed == false:
			$"Button(0,2)".emit_signal("pressed")
		
		elif $"Button(0,0)/Creu00".visible == true and $"Button(1,1)/Creu11".visible == true and $"Button(2,2)".pressed == false:
			$"Button(2,2)".emit_signal("pressed")
		
		elif $"Button(0,0)/Creu00".visible == true and $"Button(2,2)/Creu22".visible == true and $"Button(1,1)".pressed == false:
			$"Button(1,1)".emit_signal("pressed")
		
		elif $"Button(1,1)/Creu11".visible == true and $"Button(2,2)/Creu22".visible == true and $"Button(0,0)".pressed == false:
			$"Button(0,0)".emit_signal("pressed")
		
		elif $"Button(0,2)/Creu02".visible == true and $"Button(1,1)/Creu11".visible == true and $"Button(2,0)".pressed == false:
			$"Button(2,0)".emit_signal("pressed")
		
		elif $"Button(0,2)/Creu02".visible == true and $"Button(2,0)/Creu20".visible == true and $"Button(1,1)".pressed == false:
			$"Button(1,1)".emit_signal("pressed")
		
		elif $"Button(1,1)/Creu11".visible == true and $"Button(2,0)/Creu20".visible == true and $"Button(0,2)".pressed == false:
			$"Button(0,2)".emit_signal("pressed")
		
			
		else:
			if $"Button(1,1)/Cercle11".visible == false and $"Button(1,1)/Creu11".visible == false:
				$"Button(1,1)".emit_signal("pressed")
				
			elif $"Button(1,1)/Cercle11".visible == true or $"Button(1,1)/Creu11".visible == true:
				if ($"Button(0,0)/Cercle00".visible == true or $"Button(0,0)/Creu00".visible == true) and ($"Button(2,0)/Cercle20".visible == true or $"Button(2,0)/Creu20".visible == true) and ($"Button(0,2)/Cercle02".visible == true or $"Button(0,2)/Creu02".visible == true) and ($"Button(2,2)/Cercle22".visible == true or $"Button(2,2)/Creu22".visible == true):
					var a = randi()% 9 + 1
					for x in butons:
						if a == x:
							if a == 1:
								$"Button(0,0)".emit_signal("pressed")
							if a == 2:
								$"Button(1,0)".emit_signal("pressed")
							if a == 3:
								$"Button(2,0)".emit_signal("pressed")
							if a == 4:
								$"Button(0,1)".emit_signal("pressed")
							if a == 5:
								$"Button(1,1)".emit_signal("pressed")
							if a == 6:
								$"Button(2,1)".emit_signal("pressed")
							if a == 7:
								$"Button(0,2)".emit_signal("pressed")
							if a == 8:
								$"Button(1,2)".emit_signal("pressed")
							if a == 9:
								$"Button(2,2)".emit_signal("pressed")
						else:
							pass
				else:
					var c : int
					var b = rand_range(0,4)
					if b <= 1:
						c = 1
					if b > 1 and b <= 2:
						c = 3
					if b > 2 and b <= 3:
						c = 7
					if b > 3 and b <= 4:
						c = 9
					for x in butons:
						if c == x:
							if c == 1:
								$"Button(0,0)".emit_signal("pressed")
							if c == 3:
								$"Button(2,0)".emit_signal("pressed")
							if c == 7:
								$"Button(0,2)".emit_signal("pressed")
							if c == 9:
								$"Button(2,2)".emit_signal("pressed")

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
	butons.erase(1)
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
	butons.erase(2)

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
	butons.erase(3)
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
	butons.erase(4)
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
	butons.erase(5)
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
	butons.erase(6)
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
	butons.erase(7)
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
	butons.erase(8)
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
	butons.erase(9)

	
func _on_Timer_timeout():
	get_tree().quit()
