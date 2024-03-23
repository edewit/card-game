extends Node2D

const CardBase = preload("res://card_base.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if Input.is_action_just_pressed("click"):
		var card = CardBase.instantiate()
		card.position = get_global_mouse_position()
		$Cards.add_child(card)
