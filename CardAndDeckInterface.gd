extends HBoxContainer

var deck:Deck = Decks.new().moveAndToolsDeck
var hand:Deck
var discard:Deck = Decks.new().discard
var selectedCard:Card 
var selectedCardNode:Node
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var retunedHandAndDeck:Dictionary = Hand.new().drawHand(0, deck)
	deck = retunedHandAndDeck["DECK"]
	hand = retunedHandAndDeck["HAND"]
	buildHandUi(hand)
	$"../Action Button".disabled = true
	$"../Sacrifice Button".disabled = true

func buildHandUi(hand:Deck):
	for card in hand.deck: 
		
		
		var button :TextureButton = TextureButton.new() 
		#make button fit the deck container
		button.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		button.size_flags_vertical = Control.SIZE_EXPAND_FILL
		button.ignore_texture_size = true
		#set normal and pressed textures 
		button.texture_normal = card.FrontImageNormal
		button.texture_pressed = card.FrontImagePressed
		button.toggle_mode = true
		#add signal binding to cardPressed Method
		button.pressed.connect(cardPressed.bind(card,button))
		
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
	$"../Sacrifice Button".disabled = false
	if selectedCardNode != null:
		selectedCardNode.button_pressed = false
	selectedCardNode = cardNode
	selectedCard = card
	#deselect previously selected card
	


func _on_action_button_pressed():
	if $"../Action Button".text == "Play Card" and selectedCard != null:
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
		
		
	elif $"../Action Button".text == "End Turn":
		$"../Action Button".disabled = true
		
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
	
func handelCardBeingUsed():
	#Add Card To Discard
	discard.deck = discard.add_card(selectedCard)
	#Remove Card From Hand
	hand.remove_card(hand.deck.find(selectedCard))
	redrawHand(hand)
	$"../Action Button".text = "End Turn"
	#Draw Action Card

func redrawHand(hand:Deck):
	#Remove Card From UI
	resetHandUi()
	buildHandUi(hand)
	
func drawCard(hand:Deck,deck:Deck):
	handleEmptyDrawDeck()
	#ADD NEXT CARD TO HAND
	hand.deck = hand.add_card(deck.get_card(0))
	deck.deck = deck.remove_card(0)
	
func handleEmptyDrawDeck():
	if deck.deck.size() == 0:
		deck.deck = discard.deck.duplicate(true)
		deck.shuffle()
		discard.deck.clear()
