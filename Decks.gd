extends Node
class_name Decks

var movementCards:MovementCards = MovementCards.new()
var moveAndToolsDeck:Deck = Deck.new([movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,movementCards.one,movementCards.two,movementCards.three,movementCards.four,movementCards.five,movementCards.six,movementCards.one,movementCards.one,movementCards.two,movementCards.three,movementCards.one,movementCards.two,movementCards.three,movementCards.one,movementCards.two,movementCards.three])
var discard:Deck = Deck.new([])


