## MapTileNode update policy that change's a tile terrain type
## Meant to be called each PHYSICS UPDATE passing the desired MapTileNode

class_name ChangeTileTerrainByTemperatureTileUpdateRule
extends BaseTileUpdateRule

# enums
enum TemperatureComparison {SMALLER_THAN = -1, BIGGER_THAN = 1}
#ENDOF enums

# exports
# required temperature (Cº) for check. Depending on
@export var _required_celsius :float = 1000.0

# Comparison policy. depending on this the tile's temperature has to be smaller or bigger than required_celsius to meet target
@export var _policy : TemperatureComparison


# when temperature check is met, the tile's terrain will be changed to this terrain type
@export var _target_terrain_type :TerrainType
#ENDOF exports

# overrides
func update_tile (delta_time :float, tile :MapTileNode):
	if not tile or not tile.thermal_entity:
		return
	
	if _temperature_check(tile.thermal_entity.celsius):
		_do_terrain_change(tile)
#ENDOF overrides

# private methods
# returns true if given celsius temperature meets temperature check, false otherwise
func _temperature_check (celsius :float) -> bool:
	if _policy < 0:
		if celsius < _required_celsius:
			return true
	elif _policy > 0:
		if celsius > _required_celsius:
			return true
	
	return false

# initiates tile terrain type change
func _do_terrain_change (tile :MapTileNode):
	tile.set_terrain(_target_terrain_type)
#ENDOF private
