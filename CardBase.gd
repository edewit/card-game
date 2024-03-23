extends MarginContainer

var cards := preload("res://card-data.json").data

var startpos = Vector2()
var targetpos = Vector2()
var startrot = 0
var targetrot = 0
var t = 0
var DRAWTIME = 1
var ORGANISETIME = 0.5
@onready var Orig_scale = size.x

#const State = preload("res://state-enum.gd")

var state = Constants.State.InHand

# Called when the node enters the scene tree for the first time.
func _ready():
	var label = $MarginContainer/VBoxContainer/HBoxContainer/Label
	var cost = $MarginContainer/VBoxContainer/HBoxContainer/CostContainer/CostLabel

	label.text = cards[0].description
	cost.text = str(cards[0].cost)
	
	var cardSize = size
	$Background.scale *= cardSize / $Background.texture.get_size()
	$Border.scale *= cardSize / $Border.texture.get_size()

func _physics_process(delta):
	match state:
		Constants.State.InHand:
			pass
		Constants.State.InPlay:
			pass
		Constants.State.InMouse:
			pass
		Constants.State.FocusInHand:
			pass
		Constants.State.MoveDrawnCardToHand: # animate from the deck to my hand
			if t <= 1: # Always be a 1
				position = startpos.lerp(targetpos, t)
				rotation = startrot * (1-t) + targetrot*t
				#scale.x = Orig_scale * abs(2*t - 1)
				#if $CardBack.visible:
					#if t >= 0.5:
						#$CardBack.visible = false
				t += delta/float(DRAWTIME)
			else:
				position = targetpos
				rotation = targetrot
				state = Constants.State.InHand
				t = 0
		Constants.State.ReOrganiseHand:
			if t <= 1: # Always be a 1
				position = startpos.lerp(targetpos, t)
				rotation = startrot * (1-t) + targetrot*t
				t += delta/float(ORGANISETIME)
			else:
				position = targetpos
				#rotation = targetrot
				state = Constants.State.InHand
				t = 0

func _on_mouse_entered():
	#scale *= 2
	pass

func _on_mouse_exited():
	#scale *= .5
	pass
