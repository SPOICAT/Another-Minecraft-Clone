extends GridMap


export var generate_on_ready : bool = true

export var player_path : NodePath
onready var player = get_node(player_path)

var noise = OpenSimplexNoise.new()
var size : Vector3 = Vector3(64, 32, 64)


enum {
	GRASS
}


func _physics_process(_delta):
	pass


func _ready():
	player.connect("selected_block", self, "edit_block")
	noise.seed = randi()
	if generate_on_ready:
		generate(size.x, size.y, size.z)
	

func edit_block(position):
	var map_position = world_to_map(position)
	set_cell_item(map_position.x, map_position.y, map_position.z, -1)

	
func generate(a, b, c):
	for x in a:
		for y in b:
			for z in c:
				if y < noise.get_noise_2d(x, z) * 5+10:
					set_cell_item(x, y, z, GRASS)
