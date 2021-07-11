extends Node

var world = preload("res://src/World/World.tscn")
var entered_seed


enum gfx_modes {
	PERFORMANCE,
	FANCY
}

var gamedata = {
	"gfx_mode": "",
}


func enter_game():
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(world)
