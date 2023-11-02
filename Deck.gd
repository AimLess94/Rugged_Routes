extends Node
class_name Deck

var deck:Array

func _init(cards:Array):
	deck = cards

func get_card(index:int):
	return deck[index]
	
func shuffle():
	randomize()
	deck.shuffle()

func _to_string():
	var returnValue:String = ""
	for card in deck:
		print_debug(card._to_string())
		returnValue += card._to_string()
	return returnValue
