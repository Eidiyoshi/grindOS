extends Control

func _ready():
	$TypeA.value = 0
	$TypeB.value = 0
	$TypeC.value = 0
	$TypeD.value = 0

func SumAll(array: Array) -> Array:
	var result: Array = [0,0,0,0] 
	for i in array.size():
		print("Rep:")
		print(i)
		if i == 0:
			result[-1] = array[-1]
		else:
			result[-1 - i] = result[-i] + array[-1 - i]
	return result

func UpdateBar(array: Array) -> void:
	var bar_values: Array = SumAll(array)
	$TypeA.value = bar_values[0]
	$TypeB.value = bar_values[1]
	$TypeC.value = bar_values[2]
	$TypeD.value = bar_values[3]
