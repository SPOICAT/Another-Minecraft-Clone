extends GridMap


export var generate_on_ready : bool = true

export var player_path : NodePath
onready var player = get_node(player_path)

onready var structure_container = get_child(0)

var noise = OpenSimplexNoise.new()
var size : Vector3 = Vector3(64, 32, 64)


# blocks
enum {
	GRASS,
	STONE,
	WOOD,
	LEAF,
	WATER
}


func _ready():
	player.voxelmap = self
	player.connect("selected_block", self, "edit_block")

	randomize()
	noise.seed = randi()
	noise.octaves = 1
	noise.period = 16
	if generate_on_ready:
		generate(0, size.x, 0, size.y, 0, size.z)


func edit_block(action):
	var map_position = world_to_map(player.blocker.mesh.global_transform.origin)
	if action == player.ADD_BLOCK:
		if get_cell_item(map_position.x, map_position.y, map_position.z) == -1:
			set_cell_item(map_position.x, map_position.y, map_position.z, GRASS)
	elif action == player.REMOVE_BLOCK:
		set_cell_item(map_position.x, map_position.y, map_position.z, -1)

	
func generate(xa, xb, ya, yb, za, zb):
	for x in range (xa, xb):
		for y in range(ya, yb):
			for z in range(za, zb):
				var ground = noise.get_noise_2d(x, z) * 5 + 10
				generate_cells(x, y, z, ground)
				generate_structures(x, y, z, ground)


var stone_neighbors_count : int = 0
func generate_cells(x, y, z, ground):
	if y < ground:
		set_cell_item(x, y, z, GRASS)

	# this does caves
	if y < noise.get_noise_2d(x, z) * 8:
		
		for a in range (-1, 1):
			for b in range (-1, 1):
				for c in range (-1, 1):
					var neighbor_cell = get_cell_item(x + a, y+  b, z + c)
					var current_cell = get_cell_item(x, y, z)
					
					if current_cell == GRASS:
						if stone_neighbors_count < 5:
							set_cell_item(x, y, z, STONE)
						else:
							if y != 0:
								set_cell_item(x, y, z, -1)
					elif current_cell == STONE:
						stone_neighbors_count += int(neighbor_cell == STONE)
	else:
		stone_neighbors_count = 0


func generate_structures(x, y, z, ground):

	# all structures to generate snapped to ground
	# should be inside this block of if statement
	if y == round(ground):

		# Tree
		var tree_n = randi() % 250
		if tree_n == 0:
			create_structure(x, y, z, TreeStructure)


func create_structure(x, y, z, class_):
	var new_structure = class_.new()
	new_structure.global_transform.origin = map_to_world(x, y, z)
	structure_container.add_child(new_structure)
