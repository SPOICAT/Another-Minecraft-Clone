extends Control


func _on_Quit_button_down():
	get_tree().quit()


func _on_Play_button_down():
	var entered_seed = $SeedEnter.text
	if entered_seed.length() == 0:
		randomize()
		entered_seed = randi()
	GameLoader.entered_seed = int(entered_seed)
	GameLoader.enter_game()
