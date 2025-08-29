## Base Class representing a MapTileNode update policy
## Meant to be called each PHYSICS UPDATE passing the desired MapTileNode

class_name BaseTileUpdateRule
extends Resource

# abstract methods
func update_tile (tile :MapTileNode):
	push_warning("[!!] Invoked abstract method TileUpdateRuleBase")
#ENDOF abstract methods
