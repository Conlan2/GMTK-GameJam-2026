extends Node2D


var _spawners: Dictionary = {}

@export_group("Object Packed")
@export var civilian_plane: PackedScene
@export var enemy_plane: PackedScene
@export var enemy_hypersonic: PackedScene
@export var glitch: PackedScene

func _ready() -> void:
	for child in get_children():
		if child is RadarSpawner:
			_spawners[child.name.to_lower()] = child

	PlaneSpawner.spawn.connect(_spawn)

func _spawn(type: RadarObjectTypes.type, location: String, name: String) -> void:
	var spawner: RadarSpawner = _spawners[location.to_lower()] as RadarSpawner
	if !is_instance_valid(spawner):
		push_error("Spawner was not valid")
		return
	
	var rad_obj: RadarObject = null
	match type:
		RadarObjectTypes.type.CIVILIAN:
			rad_obj = civilian_plane.instantiate()
			rad_obj.start_height += (randf()-0.5) * 2 * 2000
			
		RadarObjectTypes.type.ENEMY_AIR:
			rad_obj = enemy_plane.instantiate()
			rad_obj.start_height += (randf()-0.5) * 2 * 2000	
			
		RadarObjectTypes.type.ENEMY_HYPERSONIC:
			rad_obj = enemy_hypersonic.instantiate()
			rad_obj.start_height += (randf()-0.5) * 2 * 2000 + 12000
			
		RadarObjectTypes.type.GLITCH:
			rad_obj = glitch.instantiate()
			rad_obj.start_height += (randf()-0.5) * 2 * -2000
			
			
	rad_obj.object_name = name
	spawner.Spawn_Radar_Object.emit(rad_obj)
	return
				
			
			

	
	
