extends Spatial


onready var mesh = get_node("Mesh")
onready var raycast = get_node("RayCast")
export var player_path : NodePath
onready var player = get_node(player_path)

onready var player_action = player.ADD_BLOCK

var point = null

func _ready():
	raycast.add_exception(player)
	mesh.set_as_toplevel(true)
	player.connect("selected_block", self, "set_action")
	

func set_action(action):
	player_action = action


func _physics_process(_delta):
	
	var voxelmap = player.voxelmap
	
	if raycast.is_colliding():
		point = voxelmap.world_to_map(raycast.get_collision_point())
		if player_action == player.REMOVE_BLOCK:
			if voxelmap.get_cell_item(point.x, point.y, point.z) == -1:
				point = null
				player_action == player.ADD_BLOCK
	
	if point != null:
		mesh.global_transform.origin = voxelmap.map_to_world(point.x, point.y, point.z)
