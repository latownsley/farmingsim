## 	Class: NodeState
##	Description: Attached to each state node. Each method is overwritten by each state.
##  Citation: Adapted from Rapid Vector's machine state
## 	https://github.com/rapidvectors/tutorial-components-and-scripts/tree/main/tutorials/croptails/scripts/scripts/state_machine

class_name NodeState
extends Node

@warning_ignore("unused_signal")
signal transition 


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
