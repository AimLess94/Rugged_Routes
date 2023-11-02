extends Node2D
class_name Card

var imageTexture:ImageTexture = ImageTexture.new()

var CardName:String
var CardType:String
var Effects:Dictionary
var Counters:Dictionary
var FrontImage:ImageTexture
var BackImage:ImageTexture

func _init(cardName:String, cardType:String, effects:Dictionary,frontImgPath:String, backImgPath:String, counters:Dictionary = {}):
	CardName = cardName
	CardType = cardType
	Effects = effects
	Counters = counters
	FrontImage = imageTexture.create_from_image(load(frontImgPath).get_image())
	BackImage = imageTexture.create_from_image(load(backImgPath).get_image())

func _to_string():
	return "{'CardName': "+CardName+" , 'CardType': "+CardType+" , 'Effects': "+ str(Effects)+ " , 'Counters': "+str(Counters)+" , 'FrontImg': "+FrontImage.to_string()+" , 'BackImg': "+BackImage.to_string()+"}"
