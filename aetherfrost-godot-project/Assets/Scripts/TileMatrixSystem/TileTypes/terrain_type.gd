## Class containing definition info on tile types
## Each object of this type represents a different terrain tile type

class_name TerrainType
extends Resource

# exports
# terrain type ID
@export var _id :int
var id :int:
	get:
		return _id
		
# nice string name of this terrain type
@export var _name :String
var name :String:
	get:
		return _name

# Additional update logic for this type of terrain
@export var _terrain_update_rules :Array[TileUpdateRule]
#ENDOF exports


# public methods
# apply all the TileUpdateRule(s) to the given MapTileNode object
func update_terrain (tile :MapTileNode):
	push_warning("TerrainType.update_terrain() UNIMPLEMENTED")
#ENDOF public methods
