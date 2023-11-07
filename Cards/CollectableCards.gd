extends Node
class_name CollectableCards

var eventCardBack:String = "res://assets/Cards/card back black.png"

var birdPicture:Card = Card.new("BirdPicture","Collectable",{"POINTS":3},"res://assets/Cards/Collectables/BIRD_PICTURE",eventCardBack)
var mushroom:Card = Card.new("Mushroom","Collectable",{"POINTS":1},"res://assets/Cards/Collectables/MUSHROOM",eventCardBack)
var berries:Card = Card.new("Berries","Collectable",{"POINTS":1},"res://assets/Cards/Collectables/BERRIES",eventCardBack)
var deerAntlers:Card = Card.new("DeerAntlers","Collectable",{"POINTS":6},"res://assets/Cards/Collectables/DEER_ANTLERS",eventCardBack)
