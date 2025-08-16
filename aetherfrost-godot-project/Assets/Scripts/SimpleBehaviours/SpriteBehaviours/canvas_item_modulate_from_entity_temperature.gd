## Simple behaviour that alters a sprite's modulate and/or self_modulate colors according to a gradient depending on the current temperature of an entity

class_name CanvasItemModulateFromEntityTemperature
extends Node

# private variables
@export var canvas_item :CanvasItem
@export var thermal_entity :ThermalEntity

@export var sample_gradient :Gradient
@export var min_celsius :float = 0.0
@export var max_celsius :float = 100.0

@export var apply_to_modulate :bool = true
@export var apply_to_self_modulate :bool = false
#ENDOF private variables

# Node lifecycle
func _process (deltaTime :float):
	if not canvas_item:
		push_warning ("[!!] CanvasItemModulateFromEntityTemperature.canvas_item NOT INITIALIZED")
		return
	if not thermal_entity:
		push_warning ("[!!] CanvasItemModulateFromEntityTemperature.thermal_entity NOT INITIALIZED")
		return
		
	var color = _color_from_temperature(thermal_entity.celsius)
	if (apply_to_modulate):
		canvas_item.modulate = color
	if (apply_to_self_modulate):
		canvas_item.self_modulate = color
#ENDOF node lifecycle

# private functions
# takes a Cº temperature and returns the corresponding color within the sample gradient
func _color_from_temperature (celsius :float) -> Color:
	return sample_gradient.sample(_normalize_temperature(celsius))
	
# takes a Cº temperatureand returns a value between 0.0 and 1.0 representing that temperature's position within the given minimum/maximum temperature range
func _normalize_temperature (celsius :float) -> float:
	if celsius <= min_celsius:
		return 0.0
	elif celsius >= max_celsius:
		return 1.0
		
	#var range = maximumCelsius - min_celsius
	#var value = celsius - min_celsius
	#return (value)/(range)
	return (celsius - min_celsius)/(max_celsius - min_celsius)
#ENDOF private functions
