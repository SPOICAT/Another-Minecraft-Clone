extends Spatial

export var sun_path : NodePath
onready var sun = get_node(sun_path)
	

func _ready():
	init_gfx()
	
	
func init_gfx():
	sun.shadow_enabled = int(GameLoader.gamedata["gfx_mode"])
