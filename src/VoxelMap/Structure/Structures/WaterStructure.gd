extends Structure
class_name WaterStructure


onready var water_dict = {
    "height": randi() % 2,
    "widthx": randi() % 4,
    "widthz": randi() % 4,
    "top": 0,
    "left": 0,
    "forward": 0,
    "block": voxelmap.WATER
}


func _ready():
    build(water_dict)