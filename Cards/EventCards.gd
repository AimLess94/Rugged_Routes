extends Node
class_name EventCards

var eventCardBack:String = "res://assets/Cards/card back black.png"

var bearAttack:Card = Card.new("BearAttack","Event",{"MOVE":-3,"DISCARD": 1},"res://assets/Cards/Event/BEAR_ATTACK",eventCardBack,["BearMace","Gun"])
var mischeviousSquirrel:Card = Card.new("MischeviousSquirrel","Event",{"DISCARD":2},"res://assets/Cards/Event/MISCHEVIOUS_SQUIRREL",eventCardBack,["Dog","Bell"])
var riverCrossing:Card = Card.new("RiverCrossing","Event",{"LOSETURN":1},"res://assets/Cards/Event/RIVER_CROSSING",eventCardBack)
