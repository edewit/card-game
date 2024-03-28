@tool
extends Node2D

const CardBase = preload("res://card_base.tscn")

@export var spread: Curve
@export var height: Curve
@export var angle: Curve

func _process(delta):
	if Engine.is_editor_hint():
		# Code to execute in editor.
		var cards = 5
		for i in cards:
			var card = CardBase.instantiate()
			var ratio = get_ratio(i, cards)
			card.position.x = spread.sample(ratio) * 200
			card.position.y -= height.sample(ratio) * 100
			card.rotation = angle.sample(ratio) / 2
			$hand.add_child(card)

func get_ratio(index, cardCount):
	if cardCount == 1:
		return 0.5
	
	return float(index) / float(cardCount - 1)
