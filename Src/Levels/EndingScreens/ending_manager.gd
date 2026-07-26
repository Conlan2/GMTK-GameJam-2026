extends Node


var endings: Dictionary = {
	"Early_Nuke": {
		"Title": "You launched a nuclear attack without provocation",
		"SubTitle": "",
	},
	"Failed_Defense": {
		"Title": "Your defense station was destroyed.",
		"SubTitle": "",
	},
	"Glitch_Nuke": {
		"Title": "You launched a nuclear counterstrike due a computer glich.",
		"SubTitle": "Every error with nuclear weapons can lead to the end of the world. You are the one who finally made the wrong call.",
	},
	"Final_Attack_No_Nuke": {
		"Title": "You did not launch a nuclear counterstrike",
		"SubTitle": "Now only half, instead of all, of the world is dead.",
	},
	"Final_Attack_Nuke": {
		"Title": "In the name of your nation you launched a nuclear strike.",
		"SubTitle": "Now 8 billion are dead instead of only 5 billion. Your nation should be proud.",
	},
}

signal play_ending(ending_title: String)
signal ending_info(title: String, subtitle: String)

var ending_played: bool = false

func _ready() -> void:
	
	play_ending.connect(_play_ending)
	
func _play_ending(ending_title: String) -> void:
	if ending_played:
		return
	ending_played = true
	var ending = endings[ending_title]
	ending_info.emit(ending["Title"], ending["SubTitle"])
	
	
	
	
