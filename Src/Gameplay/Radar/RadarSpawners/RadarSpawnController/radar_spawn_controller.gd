extends Node2D


@export var DEBUG_PLANE: PackedScene
var _spawners: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is RadarSpawner:
			_spawners[child.name.to_lower()] = child
			
	
	var DEBUG_SPAWNER: RadarSpawner = _spawners["NorthBarrageLeft".to_lower()]
	var plane: RadarObject = DEBUG_PLANE.instantiate()
	plane.movement_speed = 25
	DEBUG_SPAWNER.Spawn_Radar_Object.emit(plane)
	
	
