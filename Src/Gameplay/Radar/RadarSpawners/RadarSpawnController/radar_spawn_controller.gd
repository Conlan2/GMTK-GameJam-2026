extends Node2D


var _spawners: Dictionary = {}

@export_group("Object Packed")
@export var civilian_plane: PackedScene

func _ready() -> void:
	for child in get_children():
		if child is RadarSpawner:
			_spawners[child.name.to_lower()] = child

	PlaneSpawner.spawn.connect(_spawn)

func _spawn(type: RadarObjectTypes.type, location: String, name: String) -> void:
	match type:
		RadarObjectTypes.type.CIVILIAN:
			var spawner: RadarSpawner = _spawners[location.to_lower()] as RadarSpawner
			if !is_instance_valid(spawner):
				push_error("Spawner was not valid")
				return
				
			var civilian_plane: RadarObject = civilian_plane.instantiate()
			civilian_plane.start_height += (randf()-0.5) * 2 * 2000
			civilian_plane.object_name = name
			
			spawner.Spawn_Radar_Object.emit(civilian_plane)
				
			
			

	
	
