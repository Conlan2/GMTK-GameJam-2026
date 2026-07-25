extends Control



@onready var label_title: Label = $LabelTitle
@onready var label_subtext: Label = $LabelSubtext

@onready var fade_in: TextureRect = $FadeIn



func _ready() -> void:
	visible = false
	EndingManager.ending_info.connect(_set_ending)
	
func _set_ending(title_text, title_subtext) -> void:
	visible = true
	label_title.text = title_text
	label_subtext.text = title_subtext 
	label_title.active= true
	label_subtext.active = true
	fade_in.active = true
	
