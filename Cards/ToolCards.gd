extends Node
class_name ToolCards

var movementCardBack:String = "res://assets/Cards/card back red.png"

var water:Card = Card.new("Water","Tool",{},"res://assets/Cards/Tools/WATER",movementCardBack)
var trailMix:Card = Card.new("TrailMix","Tool",{"DRAW":2},"res://assets/Cards/Tools/TRAIL_MIX",movementCardBack)
var trekkingPoles:Card = Card.new("TrekkingPoles","Tool",{"MOVE":2},"res://assets/Cards/Tools/TREKKING_POLES",movementCardBack)
var bearMace:Card = Card.new("BearMace","Tool",{},"res://assets/Cards/Tools/BEAR_MACE",movementCardBack)
var gun:Card = Card.new("Gun","Tool",{},"res://assets/Cards/Tools/GUN",movementCardBack)
var bell:Card = Card.new("Bell","Tool",{},"res://assets/Cards/Tools/BELL",movementCardBack)
var dog:Card = Card.new("Dog","Tool",{},"res://assets/Cards/Tools/DOG",movementCardBack)
