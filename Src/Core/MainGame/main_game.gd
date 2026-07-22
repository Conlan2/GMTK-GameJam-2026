extends Node





@export var player: PackedScene
@export var start_scene: PackedScene

var _current_level: BaseLevel = null

# World Root Nodes
@onready var level_root: Node = $World/LevelRoot
@onready var entity_root: Node = $World/EntityRoot
@onready var effect_root: Node = $World/EffectRoot

# UI Root Nodes
@onready var hud_root: Control = $HudLayer/HudRoot
@onready var pause_root: Control = $PauseLayer/PauseRoot
@onready var transition_root: Control = $TransitionLayer/TransitionRoot
@onready var debug_root: Control = $DebugLayer/DebugRoot


func _ready() -> void:
	init_player()


func init_player() -> void:
	if !is_instance_valid(player) or !player.can_instantiate():
		push_error("Player instance is not valid, player initiation failed.")
		return
		
	var player_scene: Player = player.instantiate() as Player
	if !is_instance_valid(player_scene):
		push_error("Player instance was created, but is not valid.")
		return
		
	entity_root.add_child(player_scene)
	
func load_level(level_scene: String) -> void:
	_defered_load_level.call_deferred(level_scene)

func _defered_load_level(packed_scene_uid: String) -> void:
	if is_instance_valid(_current_level):
		_current_level.queue_free()
		_current_level = null
		
	await get_tree().process_frame
	
	
	var new_level_packed : PackedScene =\
		ResourceLoader.load(packed_scene_uid, "PackedScene") as PackedScene
		
	if !is_instance_valid(new_level_packed) or !new_level_packed.can_instantiate():
		push_error("New level was not a valid UID. Level Load Failed.")
		return
		
	_current_level = new_level_packed.instantiate() as BaseLevel
	if !is_instance_valid(_current_level):
		push_error("New level was instantated, but was not valid, Level Load Failed")
		return
		
	level_root.add_child(_current_level)
	await get_tree().process_frame
	_place_player_at_spawn()
	_setup_level_camera()
	
func _place_player_at_spawn() -> void:
	if !is_instance_valid(player):
		push_error("Player not valid, failed to place at spawn")
		return
		
	if !is_instance_valid(_current_level):
		push_error("Current Level not valid, failed to place at spawn")
		return
		
	player.global_position = _current_level.get_default_player_spawn()
	
func _setup_level_camera() -> void:
	if !is_instance_valid(player) or !is_instance_valid(_current_level):
		push_error("Level or Player not valid to create Camera")
		return
		
		
	var camera: Node = _current_level.get_player_camera()
	if !is_instance_valid(camera):
		push_error("Created Camera not valid for level.")
		return
		
	camera.target = player
	
func _process(delta: float) -> void:
	pass
