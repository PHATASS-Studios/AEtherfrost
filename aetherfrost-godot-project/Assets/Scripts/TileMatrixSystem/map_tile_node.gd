## Root node for a map tile
## Contains references to other tile component objects
## This is meant to contain NO LOGIC - any relevant logic should be implemented in another class and linked from this entity

class_name MapTileNode
extends Node2D

# export variables
@export var thermal_entity : ThermalEntity
#ENDOF export variables
