extends Node2D


# Declare member variables here. Examples:
# var a = 2
var red = 0
var green = 0
var blue = 0

var flagRed = true
var flagGreen = true
var flagBlue = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$Criadores.add_color_override("font_color", Color(red, green, blue))
	$Professor.add_color_override("font_color", Color(red-0.5, green-0.5, blue-0.5))
	$Agradecimentos.add_color_override("font_color", Color(red + 0.4 , green + 0.4, blue +0.4) )
	
	print(red)
	print(blue)
	print(green)
	
	if(flagRed):
		red = red + 0.01
	else:
		red = red - 0.01
	
	if(flagGreen):
		green = green + 0.015
	else:
		green = green - 0.015
		
	if(flagBlue):
		blue = blue + 0.02
	else:
		blue = blue - 0.02
	
	if( red >= 1 ):
		flagRed = false
	if( red <= 0):
		flagRed = true
	
	if( blue >= 1 ):
		flagBlue = false
	if( blue <= 0):
		flagBlue = true
	
	if( green >= 1 ):
		flagGreen = false
	if( green <= 0):
		flagGreen = true
	
	
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu/MenuScreen.tscn")
	call_deferred("free")
