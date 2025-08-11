extends Control

var selected_file: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_suha_pressed() -> void:
	#print('Suha\'s scene')
	Global.selected_file = "suha"
	Global.current_player = "suha"
	get_tree().change_scene_to_file("res://scenes/quiz.tscn")
	pass # Replace with function body.


func _on_nomnom_pressed() -> void:
	#print('Nomnom scene')
	Global.selected_file = "nomnom"
	Global.current_player = "rubaiya"
	get_tree().change_scene_to_file("res://scenes/quiz.tscn")
	pass # Replace with function body.


func _on_ishmam_pressed() -> void:
	#print('Ishmam scene')
	Global.selected_file = "ishmam"
	Global.current_player = "ishmam"
	get_tree().change_scene_to_file("res://scenes/quiz.tscn")
	pass # Replace with function body.


func _on_back_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass # Replace with function body.
