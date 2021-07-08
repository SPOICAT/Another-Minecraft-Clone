extends Structure
class_name WaterStructure


onready var water_base = strc.new()

var simulation_timer = Timer.new()


func _ready():
	set_strc_values(water_base, 1, 3, 3, 0, 0, 0, voxelmap.WATER)
	build(water_base)
	
	simulation_timer.wait_time = 2
	add_child(simulation_timer)
	simulation_timer.connect("timeout", self, "simulate_water")
	simulation_timer.start()


func simulate_water():
	
	for b in used_blocks:
		
		var x = b[0]
		var y = b[1]
		var z = b[2]
		
		var cell_under = voxelmap.get_cell_item(x, y - 1, z)
		
		var dir_around = [
			Vector3.LEFT, 
			Vector3.RIGHT, 
			Vector3.FORWARD, 
			Vector3.BACK,
			]
		for d in dir_around:
			var cell_around = voxelmap.get_cell_item(x + d.x, y + d.y, z + d.z)
			if cell_around == -1:
				voxelmap.set_cell_item(x + d.x, y + d.y, z + d.z, voxelmap.WATER)
		
		if cell_under == -1:
			voxelmap.set_cell_item(x, y, z, -1)
			voxelmap.set_cell_item(x, y - 1, z, voxelmap.WATER)
			b[1] -= 1
