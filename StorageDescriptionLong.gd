extends Control

func _ready():
	pass # Replace with function body.

func UpdateTypeA(number: int) -> void:
	$TypeA.text = "Type A - %d" % number

func UpdateTypeB(number: int) -> void:
	$TypeB.text = "Type B - %d" % number

func UpdateTypeC(number: int) -> void:
	$TypeC.text = "Type C - %d" % number

func UpdateTypeD(number: int) -> void:
	$TypeD.text = "Type D - %d" % number

func UpdateAll(array: Array) -> void:
	UpdateTypeA(array[0])
	UpdateTypeB(array[1])
	UpdateTypeC(array[2])
	UpdateTypeD(array[3])
