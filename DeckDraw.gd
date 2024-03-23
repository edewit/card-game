extends TextureButton

var Decksize = INF

# Called when the node enters the scene tree for the first time.
func _ready():
	scale *= $'../../'.CardSize/size


func _gui_input(event):
	if Input.is_action_just_released("click"):
		if Decksize > 0:
			Decksize = $'../../'.drawcard()
			if Decksize == 0:
				disabled = true
