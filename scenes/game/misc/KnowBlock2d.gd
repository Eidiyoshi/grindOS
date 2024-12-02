extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func setTextGame( titulo:String, texto:String ):
	$inGame.window_title = titulo
	$inGame.dialog_text = texto

func setTextRL( titulo:String, texto:String ):
	$inRL.window_title = titulo
	$inRL.dialog_text = texto

func botaoPressionado(tituloG, tituloR, textoG,textoR):
	setTextGame(tituloG,textoG)
	setTextRL(tituloR,textoR)
	$inGame.visible = 1 
	$inRL.visible = 1
	
func _on_ButtonRAM_pressed():
	botaoPressionado(
	"RAM no jogo",

	"RAM na vida real",

	"Para fins de gameplay, foi implementado três tipos de dados, com o branco representado o 'lixo' " +
	"da CPU para a RAM, escrever\n da RAM para a CPU, ler" +
	"na barra das memórias, é possível conectar para os slots da memória secundária seguindo o mesmo princípio"
	,

	"A RAM (Random Acess Memory) permite armazenar informações "+
"temporariamente, então informações são perdidas após desligar o computador.\n\nSendo mais rapido que a memoria secundaria, " +
"é um componente essencial para o computador e sistema operacional\n\n"+
"O termo Acesso aleatório vem para indicar que ele possui acesso para "+
"todos os espaços e em qualquer momento.\n\n"+
	"\n\nArmazenamento: Baixo\nPreço: Alto\nVelocidade: Alta"+
	""
	);


func _on_KnowBButtonHDD_pressed():
	botaoPressionado(
	"HDD/SSD no jogo",
	
	"Memória secundária na vida real",
	
	"No momento, fora armazenar os dados, ela não tem muita função, porém planejamos utilizar ela para salvar o jogo",
	
	"O HDD (Hard Disk Driver) permite armazenar informações "+
	"permanentemente, mesmo após desligar o computador. Sendo o componente com o " +
	"maior armazenamento, ele também guarda os programas de usuário e o sistema operacional." +
	"\n\nArmazenamento: Alto\nPreço: Baixo\nVelocidade: Baixa" +
	""
	);


func _on_KnowBButtonCPU_pressed():
	botaoPressionado(
	"CPU no jogo",
	
	"CPU na vida real",
	
	"Conecte a CPU para os processos, aguarde até finalizar\n"+
	"Caso ela fique lotada, transfira para a memória RAM"
	,
	
	"A CPU (Central Processing Unit) realiza as operações lógicas, aritméticas e processamento de dados"
	);


func _on_KnowBButonProcessos_pressed():
	botaoPressionado(
	"Processos no jogo",
	
	"Processos na vida real",
	
	"Os processos podem ser conectados a CPU, que será trabalhado e transferido os dados\n" +
	"Existe uma barra de tempo ao lado, caso ela chegue ao zero, o jogador começara a perder moedas\n"+
	"Para reiniciar, basta conectar a CPU ao processo em questão"
	,
	
	"Um processo é uma instância de um programa, que contém as instruções para que o programa opere\n"+
	"Existem vários estados de um processo, desde criando até encerrando. \n"+
	"Um dos jeitos de multitarefa é compartilhar o tempo entre os processos, dando a impressão que o processador está fazendo multiplas tarefas ao mesmo tempo"
	);
