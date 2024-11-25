extends Control

var Storage

func _ready():
	Storage = self.get_parent()

func _on_Load_button_down():
	$Store.pressed = !$Store.pressed

func _on_Store_button_down():
	$Load.pressed = !$Load.pressed
