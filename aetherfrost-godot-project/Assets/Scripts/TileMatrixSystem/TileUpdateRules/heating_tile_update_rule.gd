## MapTileNode update policy that increases that tile's heat
## Meant to be called each PHYSICS UPDATE passing the desired MapTileNode

class_name HeatingTileUpdateRule
extends BaseTileUpdateRule

# exports
# joules of heat transferred to this tile's heat entity EACH SECOND
# can be a negative value, this will remove heat from the thermal entity
@export var _joules_per_second :float = 1000.0
#ENDOF exports

# overrides
func update_tile (delta_time :float, tile :MapTileNode):
	if not tile or not tile.thermal_entity:
		return
	else:
		tile.thermal_entity.add_energy(_joules_per_second * delta_time)
#ENDOF overrides
