extends Area2D

signal Connect
signal ProcessComplete

var RNG = RandomNumberGenerator.new()

var isInsideProcess = false

var Data = [0, 0, 0, 0]
var Rewards = [0, 0, 0]

var connected = false

var Dificulty = 10

var tick = 0

var max_tries = 5

var patience = PlayerData.patience

var CPU

func maxData():
	var total = 0
	for i in Data.size():
		total += Data[i]
	return total
	
func dataEmpty():
	var total = 0
	for i in Data.size():
		total += Data[i]
	return total == 0

func rewardsEmpty():
	var total = 0
	for i in Rewards.size():
		total += Rewards[i]
	return total == 0
	
func calcProcessData():
	var Max = PlayerData.level * Dificulty
	var Min = (PlayerData.level - 1) * Dificulty
	for i in Data.size():
		Data[i] = RNG.randi_range(Min, Max)
	Data[3] *= 2
	
	for i in Rewards.size():
		Rewards[i] = RNG.randi_range(0, PlayerData.level)

func spawn():
	calcProcessData()
	$Sprite/ProcessDisplay.updateMax(maxData())
	$Sprite/PatienceBar.start_bar()
	$Sprite/ProcessDisplay.updateBar()
	self.visible = true

func process(aux):
	if !CPU.Full():
		
		var aux2 = RNG.randi_range(0,2)
		var flag2 = 0
		
		while Rewards[aux2] == 0 and max_tries >= flag2:
			aux2 = RNG.randi_range(0,2)
			flag2 += 1
		
		Data[aux] -= 1
		Rewards[aux2] -= 1
		CPU.Data[aux2] += 1
		
		$Sprite/ProcessDisplay.updateBar()
		
		if dataEmpty():
			emit_signal("ProcessComplete")
			connected = false
			PlayerData.coin += PlayerData.level
			self.visible = false
			CPU.connected = false
			var cable = CPU.get_node("Cable")
			cable.scale.x = 0
			$SpawnTimer.start()
	
		
func _process(delta):
	if connected:
		tick += 1
		if tick == PlayerData.processTick and !CPU.Full():
			tick = 0
			var aux = RNG.randi_range(0,3)
			var flag = 0
			
			#while Data[aux] == 0 and max_tries >= flag:
			#	aux = RNG.randi_range(0,3)
			#	flag += 1
			
			if aux != 3 and (CPU.Data[aux] == 0 or Data[aux] == 0):
				aux = 0
			
			while aux < 3 and (CPU.Data[aux] == 0 or Data[aux] == 0):
				aux += 1
			
			print(aux)
			if Data[aux] > 0:
				$Sprite/PatienceBar.value = PlayerData.patience
				process(aux)
	else:
		tick = 0

func _ready():
	CPU = get_parent().get_parent().get_node("CPU")
	RNG.randomize()
	calcProcessData()
	$Sprite/ProcessDisplay.updateMax(maxData())
	$Sprite/PatienceBar.start_bar()
	$Sprite/ProcessDisplay.updateBar()
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if isInsideProcess:
				emit_signal("Connect",self)

func _on_Process_mouse_entered():
	isInsideProcess = true

func _on_Process_mouse_exited():
	isInsideProcess = false

func _on_SpawnTimer_timeout():
	spawn()
