## https://docs.google.com/document/d/1D9D-ezRCtvuZdkEmf3TFpGHyO9wSe8ZugFc8fflKAo4/edit?usp=sharing
class_name ThermalEntity
extends Node2D

# emitted signals
#ENDOF emitted signals


# public properties
# Thermal Capacity of this entity in Joules/Degree (ºC/ºK)
var heatCapacity :float :
	set(value):
		_heat_capacity = value
	get:
		return _heat_capacity
@export var _heat_capacity :float = 1000.0

# Total joules of energy contained by this ThermalEntity.
var internal_energy :float :
	set(value):
		_internal_energy = value
	get:
		return _internal_energy
@export var _internal_energy :float = 0.0

# Temperature of this entity after last ThermalUpdateFinalPass(), in kelvin degrees ºK. Serialized/stored value will be the initial temperature of a newly instantiated ThermalEntity
var kelvin :float :
	get:
		return _kelvin
@export var _kelvin :float = 273.15


var celsius :float :
	get:
		return _kelvin - 273.15
#ENDOF public properties


# public methods
func thermal_update_final_pass ():
	_update_temperature()


func add_energy (joules :float):
	_internal_energy += joules
#ENDOF public methods


# Node lifecycle
func _ready ():
	#_set_internal_energy_from_kelvin(_kelvin)
	_connect_updater()
#ENDOF Node lifecycle


# private variables
#ENDOF private variables


# private functions
func _set_internal_energy_from_kelvin (kelvin : float):
	_internal_energy = kelvin * _heat_capacity;

func _connect_updater ():
	var update_manager :ThermalUpdateManager = find_parent("ThermalUpdateManager") as ThermalUpdateManager
	if not update_manager:
		print_debug("ThermalEntity didn't find valid parent ThermalUpdateManager. Update event not registered")
		return
	else:
		update_manager.thermalUpdate.connect(_thermal_update)

func _thermal_update ():
	_update_temperature()
	print_debug("ThermalEntity._thermal_update()")
	print_debug(_kelvin)


func _update_temperature ():
	_kelvin = _internal_energy / _heat_capacity
#ENDOF private functions
