extends MarginContainer

var cards := preload("res://card-data.json").data

# Called when the node enters the scene tree for the first time.
func _ready():
	for card in cards:
		print(card.keywords[0])
		$MarginContainer/VBoxContainer/Label.text = card.description
	
	var cardSize = size
	$Background.scale *= cardSize / $Background.texture.get_size()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_margin_container_mouse_entered():
	print("show text") # Replace with function body.
