extends Control

var dialogue = [
	"Você acorda numa sala estranhamente iluminada e pouco familiar. Apesar de não ter nada te restringindo, ainda sim você se sente preso nesse ambiente por algum motivo",
	"As poucas memorias te lembram que um cientista te acompanhou até um comodo, e de repente, suas sombrancelhas ficam pesadas e o mundo se apaga",
	"'Bom dia, vejo que acordou, não se preocupe com esses arredores, não faz diferença pra mim'",
	"'De qualquer forma, você está num beta testing de um possível novo sistema operacional, como eu espero que você tenha lido e lembrado no anúncio",
	"'Em suma, você vai tomar a função de um sistema operacional, gerenciando os processos, armazenando arquivos e melhorando sua máquina'",
	"'A CPU conectará os processos, quando estiver cheia, é possível armazenar na RAM de acordo com o tipo de dado, ainda que gere um lixo'",
	"'Da memória RAM, armazenar na memória secundária, que ficará lá permanentemente.'",
	"'Boa sorte, no pior dos casos você vai estar preso aqui dentro pra sempre'",
	"'? Eu não te contei? A gente está dentro de um computador, e eu estou apenas te auxiliando por fora. Me chame de programa, IA, assistente, o que quiser'",
	"Esse jogo ainda está em desenvolvimento, isso aqui não reflete a versão final, mas sim um esboço dele",
	"Existem muitas coisas a planejar ainda, peço paciência que o processo é lento"
]

var dialogue_index = 0
var finished = false

func _ready():
	load_dialogue();

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialogue();


func load_dialogue():
	if dialogue_index == 2: # personagem aparecendo
		$Chesed.visible = 1
		$name.visible = 1

	if dialogue_index == 9:
		$Chesed.visible = 0
		$name.visible = 0

	if dialogue_index < dialogue.size():
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		
	else: # fim do dialogo
		finished = true
		$TextureRect.visible = 0
		$RichTextLabel.visible = 0
		$name.visible = 0
		$enter.visible = 0
		$Chesed.visible = 0
		$continuarTxt.visible = 1
	dialogue_index += 1
