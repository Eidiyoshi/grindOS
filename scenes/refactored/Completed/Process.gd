extends "res://scenes/refactored/Part/Port.gd"

var RNG = RandomNumberGenerator.new()

var connected: Area2D = null

var Data: Array = [0,0,0,0]
var Reward: Array = [0,0,0]

func _ready():
	RNG.randomize()
	pass

func Connect(object: Area2D) -> void:
	connected = object
	connecting = false

func Disconnect() -> void:
	connected = null

func CreateProcess(Storage: Array) -> void:
	for i in Storage.size():
		Reward[i] = RNG.randi_range(0, PlayerData.level * 5)
		Data[i] = RNG.randi_range(0, Storage[i] / PlayerData.number_processes)
	Data[3] = RNG.randi_range(0, PlayerData.level * 10)
	$Sprite/StorageBarLong.UpdateMax(Data)
	$Sprite/StorageBarLong.UpdateBar(Data)
	$Sprite2/StorageDescriptionLong.UpdateAll(Data)

func _on_Process_mouse_entered():
	$Sprite2/StorageDescriptionLong.visible = true

func _on_Process_mouse_exited():
	$Sprite2/StorageDescriptionLong.visible = false
