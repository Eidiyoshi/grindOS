extends Control

signal in_Ui
signal out_Ui

var Max = 0
var Process

var total_size = 0

func updateMax(Number):
	Max = Number

func _ready():
	Process = self.get_parent().get_parent()
	$TypeA.value = 0
	$TypeB.value = 0
	$TypeC.value = 0
	$Normal.value = 0

func updateBar():
	var Data = Process.Data
	
	$TypeA.max_value = Max
	$TypeB.max_value = Max
	$TypeC.max_value = Max
	$Normal.max_value = Max
	
	var valueNormal  = Data[3]
	var valueC = valueNormal + Data[2]
	var valueB = valueC + Data[1]
	var valueA = valueB + Data[0]
	
	$TypeA.value = valueA
	$TypeB.value = valueB
	$TypeC.value = valueC
	$Normal.value = valueNormal
