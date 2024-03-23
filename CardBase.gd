extends MarginContainer

var cards := preload("res://card-data.json").data

# Called when the node enters the scene tree for the first time.
func _ready():
	for card in cards:
		print(card.title)
		$MarginContainer/VBoxContainer/Label.text = card.description
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
