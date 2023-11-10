extends Node2D

var deck:Deck = Decks.new().moveAndToolsDeck
var discard:Deck = Decks.new().discard
var eventsDeck:Deck = Decks.new().events
var eventsDiscard:Deck = Decks.new().eventsDiscard

var playerPosition : int = 1
var boardPositionsCount:int = 0
@onready var path = $Path2D
@onready var pathFollow = $Path2D/PathFollow2D

@onready var player:Node = Player.new(Hand.new(Deck.new([])))
@onready var playerInstantiation
@onready var currentPlayer:Player
@onready var handUi:HandUi = HandUi.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	boardPositionsCount =$Path2D.curve.point_count
	player.set_name("Player_1")
	self.add_child(player)
	
	currentPlayer = player 
	currentPlayer.global_position = path.curve.get_point_position(0) + path.global_position
	var retunedHandAndDeck:Dictionary = Hand.new(Deck.new([])).drawHand(0, deck)
	deck = retunedHandAndDeck["DECK"]
	currentPlayer.hand = Hand.new(retunedHandAndDeck["HAND"])
	handUi.buildHandUi(currentPlayer.hand.hand)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	

func move_player(movementNumber:int):
	var playerPreviousPosition:int = playerPosition
	playerPosition=playerPosition+movementNumber
	if playerPosition<0:
		playerPosition = 0
	if playerPosition < boardPositionsCount:
		
		await movePlayerVisualEachPoint(playerPreviousPosition,playerPosition)
		#$Path2D/PathFollow2D.position = $Path2D.curve.get_point_position(playerPosition)
		
	else:
		#you win
		playerPosition = boardPositionsCount
		await movePlayerVisualEachPoint(playerPreviousPosition,playerPosition)
		#$Path2D/PathFollow2D.position = $Path2D.curve.get_point_position(playerPosition)
		
		get_tree().change_scene_to_file("res://GameComplete.tscn")
		pass
	
func movePlayerVisualEachPoint(startPosition:int,endPosition:int):
	var movementDirection = 1
	if startPosition>endPosition:
		movementDirection = -1
		startPosition = startPosition -2
		endPosition = endPosition -2
	if endPosition < 0:
		endPosition = 0
	for position in range(startPosition,endPosition,movementDirection):
		currentPlayer.position = path.curve.get_point_position(position) + path.global_position
		pathFollow.position = path.curve.get_point_position(position)
		#$Path2D/PathFollow2D.position = $Path2D.curve.get_point_position(position)
		await get_tree().create_timer(.5).timeout

func _on_card_pressed(movementNumber:int):
	
	await move_player(movementNumber)
