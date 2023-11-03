extends Node
class_name Deck

var deck:Array

func _init(cards:Array):
	deck = cards

func get_card(index:int):
	return deck[index]
	
func set_card(index:int, card:Card):
	#deck[index] = card
	deck.insert(index,card)
	
func remove_card(index:int):
	deck.remove_at(index)
	return deck
	
func shuffle():
	randomize()
	deck.shuffle()

func _to_string():
	var returnValue:String = ""
	for card in deck:
		returnValue += card._to_string()
	return returnValue
