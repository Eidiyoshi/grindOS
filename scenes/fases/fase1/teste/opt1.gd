extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_tree().getAtividade() == 1):
		get_parent().color = Color(0, 1, 0, 1);
	else:
		get_parent().color = Color(0, 0, 0, 1);
