extends HBoxContainer

var deck:Deck = Decks.new().moveAndToolsDeck
var hand:Deck
var discard:Deck = Decks.new().discard
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var retunedHandAndDeck:Dictionary = Hand.new().drawHand(0, deck)
	deck = retunedHandAndDeck["DECK"]
	hand = retunedHandAndDeck["HAND"]
	buildHandUi(hand)
		

func buildHandUi(hand:Deck):
	for card in hand.deck: 
		
		
		var button :TextureButton = TextureButton.new() 
		button.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		button.size_flags_vertical = Control.SIZE_EXPAND_FILL
		button.ignore_texture_size = true
		button.texture_normal = deck.get_card(deck.deck.find(card)).FrontImage
		button.pressed.connect(cardPressed.bind(card))
		
		self.add_child(button)	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func cardPressed(card:Card):
	$"../.."._on_card_pressed(card.Effects["MOVE"]) 
	#Remove Card From Hand
	#ADD NEXT CARD TO HAND
	print_debug("Card Pressed: "+ card._to_string())
