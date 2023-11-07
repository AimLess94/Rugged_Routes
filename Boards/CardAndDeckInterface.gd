extends HBoxContainer

var deck:Deck = Decks.new().moveAndToolsDeck
var discard:Deck = Decks.new().discard
var eventsDeck:Deck = Decks.new().events
var eventsDiscard:Deck = Decks.new().eventsDiscard

var hand:Deck

var selectedCard:Card 
var selectedCardNode:Node

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var retunedHandAndDeck:Dictionary = Hand.new().drawHand(0, deck)
	deck = retunedHandAndDeck["DECK"]
	hand = retunedHandAndDeck["HAND"]
	buildHandUi(hand)
	eventsDeck.shuffle()
	$"../Action Button".disabled = true
	$"../Sacrifice Button".disabled = true

func buildHandUi(hand:Deck):
	for card in hand.deck: 
		
		
		var button :CardButton = CardButton.new() 
		
		#make button fit the deck container
		button.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		button.size_flags_vertical = Control.SIZE_EXPAND_FILL
		button.ignore_texture_size = true
		#set normal and pressed textures 
		button.texture_normal = card.FrontImageNormal
		button.texture_pressed = card.FrontImagePressed
		button.texture_disabled = card.BackImage
		button.toggle_mode = true
		#add signal binding to cardPressed Method
		button.pressed.connect(cardPressed.bind(card,button))
		button.card = card
		self.add_child(button)	
		
func resetHandUi():
	var children: Array =self.get_children()
	for child in children:
		child.queue_free()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func cardPressed(card:Card,cardNode:Node):
	$"../Action Button".disabled = false
	if $"../Action Button".text == "End Turn" or $"../Action Button".text == "Play Counter": #Works for disabling sacrifice without event cards being played may need to reevaluate then
		$"../Sacrifice Button".disabled = true
	else:
		$"../Sacrifice Button".disabled = false
	if selectedCardNode != null:
		selectedCardNode.button_pressed = false
	selectedCardNode = cardNode
	selectedCard = card
	#deselect previously selected card
	


func _on_action_button_pressed():
	if $"../Action Button".text == "Play Card" and selectedCard != null:
		executePlayCard()
	elif$"../Action Button".text == "Play Counter":
		executeCounterCardPlayed()
	elif $"../Action Button".text == "End Turn":
		executeEndTurn()

func executePlayCard():
	$"../Action Button".disabled = true
	$"../Sacrifice Button".disabled = true
	if selectedCard.Effects.has("MOVE"):
		#Move Player
		await $"../.."._on_card_pressed(selectedCard.Effects["MOVE"]) 
	if selectedCard.Effects.has("DRAW"):
		for n in selectedCard.Effects["DRAW"]:
			drawCard(hand,deck)
	handelCardBeingUsed()
	$"../Action Button".disabled = false

func executeCounterCardPlayed():
	$"../Action Button".disabled = true
	$"../Sacrifice Button".disabled = true
	discardCardFromHand()
	disableCardsInHand()
	$"../EventCardVisual".texture = null
	print_debug("COUNTER TO BE PLAYED")
	$"../Action Button".text = "End Turn" 
	$"../Action Button".disabled = false

func executeEndTurn():
	$"../Action Button".disabled = true
	$"../EventCardVisual".texture = null
	while hand.deck.size()< Hand.new().minHandSize:
		drawCard(hand,deck)
	redrawHand(hand)
	$"../Action Button".text = "Play Card"
	selectedCardNode = null
	selectedCard = null
	$"../Action Button".disabled = true
	$"../Sacrifice Button".disabled = true
	
func _on_sacrifice_button_pressed():
	$"../Sacrifice Button".disabled = true
	handelCardBeingUsed()
	$"../Action Button".disabled = false
	
func handelCardBeingUsed():
	discardCardFromHand()
	drawEventCard()

func discardCardFromHand():
	#Add Card To Discard
	discard.deck = discard.add_card(selectedCard)
	#Remove Card From Hand
	hand.remove_card(hand.deck.find(selectedCard))
	redrawHand(hand)

func redrawHand(hand:Deck):
	#Remove Card From UI
	resetHandUi()
	buildHandUi(hand)
	
func drawCard(hand:Deck,deck:Deck):
	handleEmptyDrawDeck()
	#ADD NEXT CARD TO HAND
	hand.deck = hand.add_card(deck.get_card(0))
	deck.deck = deck.remove_card(0)

func drawEventCard():
	handleEmptyEventDeck()
	var drawnEventCard:Card = eventsDeck.get_card(0)
	eventsDeck.deck = eventsDeck.remove_card(0)
	if drawnEventCard.CardType == "Event":
		handleEventCardDraw(drawnEventCard)
	if drawnEventCard.CardType == "Collectable":
		pass #impliment when collectable cards are implimented

func handleEventCardDraw(drawnEventCard:Card):
	$"../EventCardVisual".texture = drawnEventCard.FrontImageNormal
	print_debug(drawnEventCard.Counters)
	if isCounterCardInHand(drawnEventCard.Counters):
		disableCardsNotAbleToCounterEventCard(drawnEventCard)
		$"../Action Button".disabled = false
		$"../Action Button".text = "Play Counter"
	else:
		handleEventCardEffects(drawnEventCard)
		disableCardsInHand()
		$"../Action Button".disabled = false
		$"../Action Button".text = "End Turn"
	eventsDiscard.add_card(drawnEventCard)
	$"../Action Button".disabled = true

func isCounterCardInHand(counters:Array):
	for card in hand.deck:
		if counters.has(card.CardName):
			return true
	return false

func disableCardsInHand():
	var cardButtons: Array = self.get_children(true) 
	for cardButton in cardButtons:
		cardButton.disabled = true
		
func disableCardsNotAbleToCounterEventCard(drawnEventCard:Card):
	var cardButtons: Array = self.get_children(true) 
	for cardButton in cardButtons:
		var card:Card = cardButton.card
		if !drawnEventCard.Counters.has(card.CardName):
			cardButton.disabled = true

func handleEventCardEffects(drawnEventCard:Card):
	if drawnEventCard.Effects.has("MOVE"):
		#Move Player
		await $"../..".move_player(drawnEventCard.Effects["MOVE"]) 
	if drawnEventCard.Effects.has("DISCARD"):
		var cardsToDiscard:int = drawnEventCard.Effects["DISCARD"]
		if cardsToDiscard>hand.deck.size():
			cardsToDiscard = hand.deck.size()
		for n in drawnEventCard.Effects["DISCARD"]:
			var cardToDiscard:Card = hand.deck[randi() % hand.deck.size()]
			
			discard.deck = discard.add_card(cardToDiscard)
			#Remove Card From Hand
			hand.remove_card(hand.deck.find(cardToDiscard))
		redrawHand(hand)
	if drawnEventCard.Effects.has("LOSETURN"):
		#to be implimented when multiple players implimented
		pass

func handleEmptyDrawDeck():
	if deck.deck.size() == 0:
		deck.deck = discard.deck.duplicate(true)
		deck.shuffle()
		discard.deck.clear()

func handleEmptyEventDeck():
	if eventsDeck.deck.size() == 0:
		eventsDeck.deck = eventsDiscard.deck.duplicate(true)
		eventsDeck.shuffle()
		eventsDiscard.deck.clear()
