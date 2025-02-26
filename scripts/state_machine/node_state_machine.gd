## Class: NodeStateMachine
##
##  Citation: Adapted from Rapid Vector's machine state
## https://github.com/rapidvectors/tutorial-components-and-scripts/tree/main/tutorials/croptails/scripts/scripts/state_machine

class_name NodeStateMachine
extends Node

## holds the very first node
@export var initial_node_state : NodeState

var node_states : Dictionary = {}	## holds all of the other state node
var current_node_state : NodeState	## which node are we currently running
var current_node_state_name : String
var parent_node_name: String

## _ready()
## When the game begins, it goes through the children of the state machine node
## and connects transition_to method which enables the node to transition from
## one node to another
## It also enters initial state node
func _ready() -> void:
	parent_node_name = get_parent().name
	
	for child in get_children():
		if child is NodeState:
			node_states[child.name.to_lower()] = child
			child.transition.connect(transition_to)
	
	if initial_node_state:
		initial_node_state._on_enter()
		current_node_state = initial_node_state
		current_node_state_name = current_node_state.name.to_lower()


func _process(delta : float) -> void:
	if current_node_state:
		current_node_state._on_process(delta)


func _physics_process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_physics_process(delta)
		current_node_state._on_next_transitions()
		print(parent_node_name, " Current State: ", current_node_state_name)

##  transition_to()
##
##	Allows the node to transition from one state to the next
func transition_to(node_state_name : String) -> void:
	if node_state_name == current_node_state.name.to_lower():
		return
	
	var new_node_state = node_states.get(node_state_name.to_lower())
	
	if !new_node_state:
		return
	
	if current_node_state:
		current_node_state._on_exit()
	
	new_node_state._on_enter()
	
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name.to_lower()
	#print("Current State: ", current_node_state_name)
