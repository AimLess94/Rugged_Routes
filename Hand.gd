extends Node
class_name Hand

var hand:Deck=Deck.new([])
var minHandSize:int = 7

func drawHand(handSize:int,deck:Deck):
	if handSize == 0:
		handSize = minHandSize
	
	deck.shuffle()
	for n in handSize:
		print_debug(n)
		var currentCard:Card = deck.get_card(0)
		hand.set_card(n, currentCard)
		deck.remove_card(0)
		print_debug("HAND: " + hand._to_string())
		print_debug("DECK: "+deck._to_string())
	var returnDict:Dictionary
	returnDict["HAND"] = hand
	returnDict["DECK"] = deck
	return returnDict
