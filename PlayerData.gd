extends Node

signal UpdatedLevel

signal UpdatedProcessTick

signal UpdatedRAMDataResistance
signal UpdatedSecondaryDataResistance

var level = 1

var processTick = 10
var portTick = 50

var ramDataResistance = 10
var secondaryDataResistance = 20

var maxStorageRAM = 2000
var maxStorageSecondary = 100

var trashChance = 1

func getLevel():
	return level

func getProcessTick():
	return processTick
	
func getRAMDataResistance():
	return ramDataResistance
	
func getSecondaryDataResistance():
	return secondaryDataResistance
	
func addLevel(number):
	level += number
	emit_signal("UpdatedLevel",level)

func addRAMDataResistance(number):
	ramDataResistance += number
	emit_signal("UpdatedRAMDataResistance",ramDataResistance)
	
func addSecondaryDataResistance(number):
	secondaryDataResistance += number
	emit_signal("UpdatedSecondaryDataResistance",secondaryDataResistance)

func _ready():
	pass 
