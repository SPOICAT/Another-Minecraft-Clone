extends Node

var world = preload("res://src/World/World.tscn")
var entered_seed


func enter_game():
	get_tree().change_scene_to(world)
