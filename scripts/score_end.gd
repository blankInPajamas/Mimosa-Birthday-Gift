extends Control

@onready var score_label: Label = $VBoxContainer/Heading
# var score_number: int 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var score_number: int = Global.score[Global.current_player]
	print(score_number)
	score_label.text = "Score: " + str(score_number) + "/6" # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_return_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/select_menu.tscn") # Replace with function body.
