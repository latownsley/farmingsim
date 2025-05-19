extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var navigation_agent_2d: NavigationAgent2D
@export var min_speed: float = 5.0
@export var max_speed: float = 10.0

var speed: float

func _ready() -> void:
	call_deferred("character_setup")		# calls after the current frame has finished processing

func character_setup() -> void:
	await get_tree().physics_frame
	await get_tree().physics_frame # wait two frames
	set_movement_target()
	#var map_rid := navigation_agent_2d.get_navigation_map()
	#NavigationServer2D.map_force_update(map_rid)
	
func set_movement_target() -> void:
	var target_position: Vector2 = NavigationServer2D.map_get_random_point(navigation_agent_2d.get_navigation_map(), navigation_agent_2d.navigation_layers, false)
	navigation_agent_2d.target_position = target_position
	speed = randf_range(min_speed, max_speed)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var target_position: Vector2 = navigation_agent_2d.get_next_path_position()
	var target_direction: Vector2 = character.global_position.direction_to(target_position)
	animated_sprite_2d.flip_h = target_direction.x < 0
	character.velocity = target_direction * speed
	character.move_and_slide()
	# move_and_slide uses delta


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	animated_sprite_2d.play("walk")


func _on_exit() -> void:
	animated_sprite_2d.stop()
