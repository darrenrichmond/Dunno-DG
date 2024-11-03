extends Node

#Game Settings
#we are going to translate card abbreviations in full_deck to asset file names. card_asset_path is the path to where we are storing the assets
var card_assets_path = "res://assets/cards/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func render_card(card_node, card):
	#TODO: store game setting sin Main and get from there

	#get the full path to the specific asset for the card
	var card_texture_path = card_assets_path + card + ".png"
	#load that asset from the file system to the game, so it can be used as a texture on the node
	var card_texture = load(card_texture_path)
	#now we can set the Texture property on the node to the full path to the asset
	if card_node is Node2D:
		card_node.texture = card_texture
	elif card_node is Button:
		card_node.icon = card_texture
	else:
		print("Oops!")
