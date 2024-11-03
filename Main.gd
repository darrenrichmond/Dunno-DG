extends Node2D

@onready var help_text_node = $Me/HelpText

#Game Settings
#we are going to translate card abbreviations in full_deck to asset file names. card_asset_path is the path to where we are storing the assets
var card_assets_path = "res://assets/cards/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	help_text_node.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
