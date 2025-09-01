## Base Class representing a MapTileNode update policy
## Meant to be called each PHYSICS UPDATE passing the desired MapTileNode and delta_time

class_name BaseTileUpdateRule
extends Resource

# abstract methods
func update_tile (delta_time :float, tile :MapTileNode):
	push_warning("[!!] Invoked abstract method TileUpdateRuleBase")
#ENDOF abstract methods
