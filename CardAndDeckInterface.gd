extends HBoxContainer



# Called when the node enters the scene tree for the first time.
func _ready():
	var deck :Deck = Decks.new().moveAndToolsDeck
	deck.shuffle()
	for card in deck.deck:
		print_debug(card._to_string())
		
		var button :TextureButton = TextureButton.new() 
		button.texture_normal = deck.get_card(deck.deck.find(card)).FrontImage
		button.pressed.connect(cardPressed.bind(card))
		
		self.add_child(button)	
		#ADD CARD To Player Hand


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func cardPressed(card:Card):
	$".."._on_card_pressed(card.Effects["MOVE"])
	#Remove Card From Hand
	#ADD NEXT CARD TO HAND
	print_debug("Card Pressed: "+ card._to_string())
