extends CharacterBody2D
class_name Player

var hand:Hand
var playerPosition:int = 0
var points:int = 0

func _init(hand:Hand):
	var collisionShape:CollisionShape2D = CollisionShape2D.new()
	var rectangleShape:RectangleShape2D = RectangleShape2D.new()
	rectangleShape.size = Vector2(8,8)
	collisionShape.shape = rectangleShape
	collisionShape.position = Vector2(-4,-4)
	self.add_child(collisionShape)
	var sprite:Sprite2D = Sprite2D.new()
	sprite.texture = load("res://assets/HikerTemp.png")
	sprite.position = Vector2(-4,-4)
	sprite.scale = Vector2(0.016,0.016)
	self.add_child(sprite)
	hand = hand
	
func play_Turn():
	pass

