extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	print("A")
	print($adicoes.margin_top)
	print($adicoes.margin_right)
	print($adicoes.margin_bottom)
	print($adicoes.margin_left)

func _on_Button_pressed():
	$adicoes.window_title = "Adições futuras"
	$adicoes.dialog_text = ("Upgrades:\n" + 
	"Upgrades serão uma progrmas/conceitos/harware que auxiliam na automação do sistema operacional exemplos são:\n" +
	" - Os gerentes(escalonador de processos, gerente de arquivos e etc), programas que serão desbloqueados mais para o fim do jogo, onde automatizam o fluxo de dados\n" +
	" - Quantum, será salvo uma configurção feita pelo jogador, de quanto tempo a CPU irá ficar conectada com cada processo e ao apertar um botão, essa configuração é realizada\n" +
	" - Monoprogramado/multiprogramado será explicado com o desbloqueio de slots de processos(atualmente está começando com 5, mas provavelmente começará com 1 processo)\n" +
	"\nTutorial:\n" +
	"A BIOS será utilizada como tutorial do jogo, apresentando cada componete de hardware presente, sua função(tanto na vida real como em jogo) e ao terminar, passar o controle para o jogador\n" +
	"\nSistema de salvamento:\n" + 
	"Salvar somente o que está contido na memória secundária, para mostrar que a memória RAM e  a CPU são voláteis\n" +
	"\nObservações:\n" +
	"O jogo parece estar atrasado, porém já foram criados os módulos principais(por enquanto e tirando o salvamento), logo agora é questão de se aplicar esses módulos para fazer o resto\n")
	$adicoes.visible = 1 
