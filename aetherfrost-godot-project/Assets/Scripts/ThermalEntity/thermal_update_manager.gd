## https://docs.google.com/document/d/1CRzvUAWCpc3WEKfOaSEH4joZfyyihArMvmFJAcdKQlY/edit?usp=sharing

class_name ThermalUpdateManager
extends Node

# emitted signals
signal thermalUpdate ()
#ENDOF emitted signals

# node lifecycle
func _physics_process(_delta_time: float) -> void:
	thermalUpdate.emit()
#ENDOF node lifecycle
