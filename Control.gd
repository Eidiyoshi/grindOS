extends Control

func _ready():
	pass

var Storage = get_parent()

func _on_Load_button_down():
	$Store.pressed = !$Store.pressed
	Storage.load_store = $Store.pressed

func _on_Store_button_down():
	$Load.pressed = !$Load.pressed
	Storage.load_store = $Store.pressed
