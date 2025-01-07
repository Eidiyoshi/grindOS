extends "res://scenes/refactored/Part/SubPart/StorageBarLong.gd"


func _ready():
	$TypeA.value = 0
	$TypeB.value = 0
	$TypeC.value = 0
	$TypeD.value = 0
	
func UpdateMax(Max: Array) -> void:
	var aux: int = 0
	for i in Max.size():
		aux += Max[i]
	$TypeD.max_value = aux
	$TypeC.max_value = aux
	$TypeB.max_value = aux
	$TypeA.max_value = aux
