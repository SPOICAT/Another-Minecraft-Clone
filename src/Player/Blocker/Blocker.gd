extends Spatial


onready var mesh = get_node("Mesh")
onready var raycast = get_node("RayCast")
export var player_path : NodePath
onready var player = get_node(player_path)


func _ready():
	raycast.add_exception(player)
	mesh.set_as_toplevel(true)


func _physics_process(_delta):
	
	if raycast.is_colliding():
		var voxelmap = player.voxelmap
		var point = voxelmap.world_to_map(raycast.get_collision_point())
		mesh.global_transform.origin = voxelmap.map_to_world(point.x, point.y, point.z)
