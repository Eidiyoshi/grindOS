extends Control

var value
	
func _ready():
	pass # Replace with function body.

func start_bar():
	$ProgressBar.max_value = PlayerData.patience
	$ProgressBar.value = PlayerData.patience
	value = PlayerData.patience
	$PatienceDelay.start()

func _on_PatienceDelay_timeout():
	if value > 0:
		value -= 1
		$ProgressBar.value = value
		$PatienceDelay.start()
	elif PlayerData.coin > 0:
		PlayerData.coin -= PlayerData.coin * 0.001
