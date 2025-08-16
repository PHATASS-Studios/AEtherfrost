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

# Same as kelvin but in Cº
var celsius :float :
	get:
		return _kelvin - 273.15
		
# Float value between 1.0 and 0.0 that multiplies this entity's heat exchange
var conductivity_factor :float :
	get:
		return _conductivity_factor
	set (value):
		_conductivity_factor = value
@export var _conductivity_factor :float = 0.1
#ENDOF public properties


# public methods
func thermal_update_final_pass ():
	_update_temperature()


func add_energy (joules :float):
	_energy_change_buffer += joules
#ENDOF public methods


# Node lifecycle
func _ready ():
	#_set_internal_energy_from_kelvin(_kelvin)
	_connect_updater()
#ENDOF Node lifecycle


# private variables
var _energy_change_buffer :float = 0.0
#ENDOF private variables


# private functions
func _set_internal_energy_from_kelvin (kelvin : float):
	_internal_energy = kelvin * _heat_capacity;

func _connect_updater ():
	var update_manager :ThermalUpdateManager = find_parent("ThermalUpdateManager") as ThermalUpdateManager
	if not update_manager:
		push_error ("[!!] ThermalEntity didn't find valid parent ThermalUpdateManager. Update event not registered")
		return
	else:
		update_manager.thermalUpdate.connect(_thermal_update)

func _thermal_update ():
	_update_temperature()
	#print_debug("ThermalEntity._thermal_update()")
	#print_debug(_kelvin)


func _update_temperature ():
	_flush_energy_buffer ()
	_kelvin = _internal_energy / _heat_capacity

func _flush_energy_buffer ():
	_internal_energy += _energy_change_buffer
	_energy_change_buffer = 0.0
#ENDOF private functions
