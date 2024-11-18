extends Control

var GuiBar = self.GuiBar
var Storage = get_parent()

func _ready():
	pass # Replace with function body.

func updateBar():
	GuiBar.Trash.margin_bottom = 400
	
