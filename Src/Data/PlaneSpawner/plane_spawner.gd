extends Node

signal spawn(type: RadarObjectTypes.type, location: String, name: String)


func _process(delta: float) -> void:
	for entry in SpawnData.spawn_array:
		if entry["spawn_time"] < TimeManager.game_timer:
			spawn.emit(entry["type"], entry["spawn_point"], entry["name"])
			SpawnData.spawn_array.remove_at(SpawnData.spawn_array.find(entry))
			
	
