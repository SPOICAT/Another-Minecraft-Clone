extends GridMap


var noise = OpenSimplexNoise.new()
var size : Vector3 = Vector3(50, 25, 50)


enum {
	GRASS
}


func _ready():
	noise.seed = randi()
	generate()
	
	
func generate():
	for x in size.x:
		for y in size.y:
			for z in size.z:
				
				if y < noise.get_noise_2d(x, z) * 5+10:
					set_cell_item(x, y, z, GRASS)
