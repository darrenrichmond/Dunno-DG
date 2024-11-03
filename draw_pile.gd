extends Sprite2D

@onready var main_game = get_parent()

func _ready() -> void:
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		var mouse_pos = event.position
		if $DrawPile.get_rect().has_point($DrawPile.to_local(mouse_pos)):
			on_discard_pile_clicked()

func on_discard_pile_clicked():
	if main_game.discard_pile.size() > 0:
		var top_card = main_game.discard_pile.pop_back()
		main_game.add_card_to_hand(top_card)  # Implement this function as needed
		main_game.update_discard_pile()
		main_game.update_hand_display()  # Refresh the hand display
