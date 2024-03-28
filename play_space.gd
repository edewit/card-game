extends Node2D

const CardBase = preload("res://card_base.tscn")

const CardSize = Vector2(125,175)
var CardSelected = []
var DeckSize = 5
var CardOffset = Vector2()
@onready var CentreCardOval = Vector2(get_viewport().size) * Vector2(0.3, 1.25)
@onready var Hor_rad = get_viewport().size.x*0.45
@onready var Ver_rad = get_viewport().size.y*0.4

@export var spread: Curve

var angle = 0
var Card_Numb = 0
var NumberCardsHand = 0
var CardSpread = 0.4
var OvalAngleVector = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#func _input(_event):
	#if Input.is_action_just_pressed("click"):
		#var card = CardBase.instantiate()
		#card.position = get_global_mouse_position()
		#$Cards.add_child(card)
		


func drawcard():
	angle = PI/2 + CardSpread*(float(NumberCardsHand)/2 - NumberCardsHand)
	var new_card = CardBase.instantiate()
	CardSelected = randi() % DeckSize
	
	OvalAngleVector = Vector2(Hor_rad * cos(angle), - Ver_rad * sin(angle))
	new_card.startpos = $Deck/DeckDraw.position - CardSize/2
	new_card.targetpos = CentreCardOval + OvalAngleVector - CardSize
	#new_card.startrot = 0
	new_card.targetrot = PI/4 - angle
	new_card.scale *= CardSize/new_card.size
	new_card.state = Constants.State.MoveDrawnCardToHand
	Card_Numb = 0
	#for Card in $Cards.get_children(): # reorganise hand
		#angle = PI/2 + CardSpread*(float(NumberCardsHand)/2 - Card_Numb)
		#OvalAngleVector = Vector2(Hor_rad * cos(angle), - Ver_rad * sin(angle))
		#
		#Card.targetpos = CentreCardOval + OvalAngleVector - CardSize
		#Card.startrot = Card.rotation
		#Card.targetrot = (90 - rad_to_deg(angle))/4
		#
		#Card_Numb += 1
		#if Card.state == Constants.State.InHand:
			#Card.state = Constants.State.ReOrganiseHand
			#Card.startpos = Card.position
		#elif Card.state == Constants.State.MoveDrawnCardToHand:
			#Card.startpos = Card.targetpos - ((Card.targetpos - Card.position)/(1-Card.t))
	$Cards.add_child(new_card)
	#PlayerHand.CardList.erase(PlayerHand.CardList[CardSelected])
	angle += 0.25
	DeckSize -= 1
	NumberCardsHand += 1
#	Card_Numb += 1
	return DeckSize
