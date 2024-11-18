extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if( get_parent().visible ):
		modulate.a += 1 * delta

	if( !get_parent().visible ):
		modulate.a = 0
