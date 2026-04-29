extends Node2D


@onready var my_label = $Canvas/Control/Label
var player_score = 150
var player_name = "Alex"


func _ready() -> void:
	update_ui()
	
func _process(delta) -> void:
	update_ui()

func update_ui():
	# Single variable
	my_label.text = "Score: %s" % player_score
	
	# Multiple variables (wrap them in an array [])
	my_label.text = "Player %s has %s points!" % [player_name, player_score]
	
	my_label.text = "player speed %s" % str($player.velocity)
