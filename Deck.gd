#This script defines the Deck for the game and how the hands are dealt. 
extends Node

#full_deck is the reference deck of 52 cards. It should not be changed, other than to add the Jokers if you need to play with them.
var full_deck = ["C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "CJ", "CQ", "CK", "CA", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "DJ", "DQ", "DK", "DA", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "HJ", "HQ", "HK", "HA", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "S10", "SJ", "SQ", "SK", "SA"]
#var jokers = ["JB", "JR"]

#current_deck is the deck that we are playing with. it starts empty and we will duplicate the full_deck into it when we deal the cards
var current_deck = []

#Me is the Node2D that reprents the player's hand. #AI is the computer player's hand. 
@onready var me = $"../Me"
@onready var ai = $"../AI"

#we are going to translate card abbreviations in full_deck to asset file names. card_asset_path is the path to where we are storing the assets
var card_assets_path = "res://assets/cards/"

#take a new card from the current_deck
func _new_card():
	#select a card at random frm the current_deck array
	var card = current_deck[randi() % current_deck.size()]
	#once we have a card, it should not be in the deck anymore
	current_deck.erase(card)
	return card

#set the appropriate assets on the appropriate node for the cards in the array for that player
func assign_cards(player, cards):
	#we need to loop over all the cards passed, setting the index each time
	for i in range(cards.size()):
		#get the full path to the specific asset for the card
		var card_texture_path = card_assets_path + cards[i] + ".png"
		#load that asset from the file system to the game, so it can be used as a texture on the node
		var card_texture = load(card_texture_path)
		#get the node for the card at the same index as the card we are working with.
		#The array is 0 based, but our card nodes start with 1
		#teh index is an integer - we have to convert it to a string to concatenate with the "Card" string to get the node name
		var card_node = player.get_node("Card" + str(i + 1))
		#now we can set the Texture property on the node to the full path to the asset
		card_node.texture = card_texture

#fill out the players' hands with new ards from the current_deck
func deal_cards(): 
	#start with a new copy of the full deck
	current_deck = full_deck.duplicate()
	
	#For now, we just want me and ai to have 5 new cards each.
	#TODO: make hand size configurable
	var me_cards = [_new_card(), _new_card(), _new_card(), _new_card(), _new_card()]
	var ai_cards = [_new_card(), _new_card(), _new_card(), _new_card(), _new_card()]
	
	#assign the cards to the appropriate nodes for me and the ai
	assign_cards(me, me_cards)
	assign_cards(ai, ai_cards)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#The first time we come into the game, the cards should be dealt.
	#TODO: might be cool to have the cards start with backs showing, then Deal turns over
	deal_cards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_deal_button_pressed() -> void:
	#whenever the DealButton is pressed, we should deal the cards
	deal_cards()
