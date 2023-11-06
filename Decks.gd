extends Node
class_name Decks

var movementCards:MovementCards = MovementCards.new()
var toolCards:ToolCards = ToolCards.new()
var eventCards:EventCards = EventCards.new()
#Small Test Deck
var moveAndToolsDeck:Deck = Deck.new([movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,toolCards.water,toolCards.trekkingPoles,toolCards.trailMix,toolCards.bearMace,toolCards.gun,toolCards.bell,toolCards.dog])
#Large Test Deck
#var moveAndToolsDeck:Deck = Deck.new([movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,movementCards.one,movementCards.one,movementCards.two,movementCards.three,movementCards.one,movementCards.two,movementCards.three,movementCards.one,movementCards.two,movementCards.three,toolCards.water,toolCards.water,toolCards.water,toolCards.water,toolCards.water,toolCards.trailMix,toolCards.trailMix,toolCards.trailMix,toolCards.trailMix,toolCards.trailMix,toolCards.trailMix,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles,toolCards.trekkingPoles])

var events:Deck = Deck.new([eventCards.bearAttack,eventCards.mischeviousSquirrel,eventCards.riverCrossing])

var discard:Deck = Deck.new([])
var eventsDiscard:Deck = Deck.new([])


