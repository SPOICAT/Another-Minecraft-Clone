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


func _on_SubmenuToggle_toggled(button_pressed):
	for e in get_tree().get_nodes_in_group("Main"):
		e.visible = !button_pressed
	for f in get_tree().get_nodes_in_group("Settings"):
		f.visible = button_pressed


func _on_GfxCheckbox_toggled(button_pressed):
	GameLoader.gamedata["gfx_mode"] = int(button_pressed)
