extends Node2D

var i : int = 0
var boardPositionsCount:int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	boardPositionsCount =$Path2D.curve.point_count


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass


func _on_move_button_pressed():
	var deck:Deck = Decks.new().moveAndToolsDeck
	deck.shuffle()
	print_debug(deck._to_string())
	move_player()
	

func move_player():
	
	if i < boardPositionsCount:
		$Path2D/PathFollow2D.position = $Path2D.curve.get_point_position(i)
		
	else:
		#you win
		print_debug(boardPositionsCount)
		i = boardPositionsCount-1
		print_debug(i)
		print_debug($Path2D.curve.get_point_position(i))
		$Path2D/PathFollow2D.position = $Path2D.curve.get_point_position(i)
		print_debug("YOU WIN")
		pass
	


func _on_card_pressed(movementNumber:int):
	i=i+movementNumber
	print_debug(i)
	move_player()
