extends Node2D

@onready var help_text_node = $Me/HelpText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	help_text_node.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
