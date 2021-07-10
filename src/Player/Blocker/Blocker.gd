extends Spatial


onready var mesh = get_node("Mesh")
onready var raycast = get_node("RayCast")
export var player_path : NodePath
onready var player = get_node(player_path)

var point = null

func _ready():
	raycast.add_exception(player)
	mesh.set_as_toplevel(true)


func _physics_process(_delta):
	
	var voxelmap = player.voxelmap
	
	if raycast.is_colliding():
		point = voxelmap.world_to_map(raycast.get_collision_point())
	
	if point:
		mesh.global_transform.origin = voxelmap.map_to_world(point.x, point.y, point.z)
