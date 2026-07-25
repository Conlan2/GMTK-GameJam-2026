extends RadarSpawner

@onready var timer: Timer = $Timer

	

func _on_timer_timeout() -> void:
	PlaneSpawner.spawn.emit(RadarObjectTypes.type.ENEMY_HYPERSONIC,
	name,
	"ENEMY HYPERSONIC")
	timer.start(5)
