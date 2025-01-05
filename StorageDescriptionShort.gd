extends Control

func _ready():
	pass # Replace with function body.

func UpdateTypeA(number: int) -> void:
	print("Type A - %d" % number)
	$TypeA.text = "Type A - %d" % number

func UpdateTypeB(number: int) -> void:
	$TypeB.text = "Type B - %d" % number

func UpdateTypeC(number: int) -> void:
	$TypeC.text = "Type C - %d" % number

func UpdateAll(array: Array) -> void:
	UpdateTypeA(array[0])
	UpdateTypeB(array[1])
	UpdateTypeC(array[2])
