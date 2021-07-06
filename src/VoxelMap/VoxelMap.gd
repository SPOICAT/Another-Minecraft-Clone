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
	noise.seed = randi()
	if generate_on_ready:
		generate()
	
	
func generate():
	for x in size.x:
		for y in size.y:
			for z in size.z:
				
				if y < noise.get_noise_2d(x, z) * 5+10:
					set_cell_item(x, y, z, GRASS)


func remove_last_cell():
	var last = get_used_cells().max()
	if last:
		for y in size.y:
			set_cell_item(last.x, y, last.z, -1)
