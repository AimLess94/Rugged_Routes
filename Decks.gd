extends Node
class_name Decks

var movementCards:MovementCards = MovementCards.new()
var toolCards:ToolCards = ToolCards.new()
#Small Test Deck
var moveAndToolsDeck:Deck = Deck.new([movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,toolCards.water,toolCards.trekkingPoles,toolCards.trailMix])
#Large Test Deck
#var moveAndToolsDeck:Deck = Deck.new([movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,movementCards.one,movementCards.one,movementCards.two,movementCards.three,movementCards.one,movementCards.two,movementCards.three,movementCards.one,movementCards.two,movementCards.three,toolCards.water,toolCards.water,toolCards.water,toolCards.water,toolCards.water,toolCards.trailMix,toolCards.trailMix,toolCards.trailMix,toolCards.trailMix,toolCards.trailMix,toolCards.trailMix,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles])
var discard:Deck = Deck.new([])


