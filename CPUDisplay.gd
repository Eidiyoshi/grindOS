extends Control

func _ready():
	$TypeA.value = 0
	$TypeB.value = 0
	$TypeC.value = 0

func updateBar(Data):
	
	$TypeA.max_value = PlayerData.maxStorageCPU
	$TypeB.max_value = PlayerData.maxStorageCPU
	$TypeC.max_value = PlayerData.maxStorageCPU
	
	var valueC = Data[2]
	var valueB = valueC + Data[1]
	var valueA = valueB + Data[0]
	
	$TypeA.value = valueA
	$TypeB.value = valueB
	$TypeC.value = valueC
