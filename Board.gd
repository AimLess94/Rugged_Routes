extends Node2D

var playerPosition : int = 1
var boardPositionsCount:int = 0
@onready var path = $Path2D
@onready var pathFollow = $Path2D/PathFollow2D
# Called when the node enters the scene tree for the first time.
func _ready():
	boardPositionsCount =$Path2D.curve.point_count


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
		print_debug("YOU WIN")
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
		print_debug("START:"+str(startPosition)+"END:"+str(endPosition)+"Current:"+str(position))
		pathFollow.position = path.curve.get_point_position(position)
		#$Path2D/PathFollow2D.position = $Path2D.curve.get_point_position(position)
		await get_tree().create_timer(.5).timeout

func _on_card_pressed(movementNumber:int):
	
	await move_player(movementNumber)
