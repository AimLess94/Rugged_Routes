extends Node2D
class_name Card

var imageTexture:ImageTexture = ImageTexture.new()

var CardName:String
var CardType:String
var Effects:Dictionary
var Counters:Dictionary
var FrontImageNormal:ImageTexture
var FrontImagePressed:ImageTexture
var BackImage:ImageTexture

func _init(cardName:String, cardType:String, effects:Dictionary,frontImgsFolderPath:String, backImgPath:String, counters:Dictionary = {}):
	CardName = cardName
	CardType = cardType
	Effects = effects
	Counters = counters
	FrontImageNormal = imageTexture.create_from_image(load(frontImgsFolderPath+"/Normal.png").get_image())
	FrontImagePressed = imageTexture.create_from_image(load(frontImgsFolderPath+"/Pressed.png").get_image())
	BackImage = imageTexture.create_from_image(load(backImgPath).get_image())

func _to_string():
	return "{'CardName': "+CardName+" , 'CardType': "+CardType+" , 'Effects': "+ str(Effects)+ " , 'Counters': "+str(Counters)+" , 'FrontImgNormal': "+FrontImageNormal.to_string()+" , 'FrontImgPressed': "+FrontImagePressed.to_string()+" , 'BackImg': "+BackImage.to_string()+"}"
