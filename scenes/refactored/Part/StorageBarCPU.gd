extends "res://scenes/refactored/Part/StorageBarShort.gd"

func _ready():
	$TypeA.value = 0
	$TypeB.value = 0
	$TypeC.value = 0
	
func UpdateMax() -> void:
	$TypeA.max_value = PlayerData.maxStorageCPU
	$TypeB.max_value = PlayerData.maxStorageCPU
	$TypeC.max_value = PlayerData.maxStorageCPU
	
