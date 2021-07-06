extends GridMap


export var generate_on_ready : bool = true

export var player_path : NodePath
onready var player = get_node(player_path)

var noise = OpenSimplexNoise.new()
var size : Vector3 = Vector3(64, 32, 64)


enum {
	GRASS,
	STONE,
	WOOD,
	LEAF
}


func _ready():
	player.connect("selected_block", self, "edit_block")

	randomize()
	noise.seed = randi()
	if generate_on_ready:
		generate(0, size.x, 0, size.y, 0, size.z)


func edit_block(position, action):
	var map_position = world_to_map(position)
	if action == player.ADD_BLOCK:
		set_cell_item(map_position.x, map_position.y, map_position.z, GRASS)
	elif action == player.REMOVE_BLOCK:
		set_cell_item(map_position.x, map_position.y, map_position.z, -1)

	
func generate(xa, xb, ya, yb, za, zb):
	for x in range (xa, xb):
		for y in range(ya, yb):
			for z in range(za, zb):
				generate_cells(x, y, z)


func generate_cells(x, y, z):
	if y < noise.get_noise_2d(x, z) * 5 + 10:
		set_cell_item(x, y, z, GRASS)
	if y < noise.get_noise_2d(x, z) * 5:
		set_cell_item(x, y, z, STONE)
