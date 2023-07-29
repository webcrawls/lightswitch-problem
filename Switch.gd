extends MarginContainer
class_name Switch

@export var on_color: Color = Color.WHITE
@export var off_color: Color = Color.BLACK
@export var state: bool = false
@onready var color: ColorRect = $"ColorRect"
@export var index: int = 0

func _process(_delta):
	$Label.text = str(index)
	color.color = on_color if state else off_color
