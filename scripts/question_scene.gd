extends Control

@onready var question_label: Label = $VBoxContainer/Label
@onready var option_container: GridContainer = $VBoxContainer/GridContainer
@onready var option_btns: Array[Button] = [
	$VBoxContainer/GridContainer/Button1,
	$VBoxContainer/GridContainer/Button2,
	$VBoxContainer/GridContainer/Button3,
	$VBoxContainer/GridContainer/Button4	
]
@onready var score_btn: Label = $Score

var select_filepath: String = ""
var index: int = 0
var questionData: Array = []
var localscore: int = 0
var playername: String = ""

func load_questions(filename: String) -> void:
	var path: String = ""
	match filename:
		"suha":
			playername = "suha"
			select_filepath = "res://scripts/game-questions/suha.gd"
			Global.score[playername] = 0
			localscore = Global.score[playername]
		"nomnom":
			playername = "rubaiya"
			select_filepath = "res://scripts/game-questions/rubaiya.gd"
			Global.score[playername] = 0
			localscore = Global.score['rubaiya']
		"ishmam":
			playername = "ishmam"
			select_filepath = "res://scripts/game-questions/ishmam.gd"
			Global.score[playername] = 0
			localscore = Global.score['ishmam']
		_:
			select_filepath = ""
	
	if not select_filepath.is_empty() and ResourceLoader.exists(select_filepath):
		var question_resource = load(select_filepath)
		if question_resource is GDScript:
			var instance = question_resource.new()			
			questionData = instance.questions
			print("Loaded questions for ", filename, ": ", questionData.size(), " questions.")
		else:
			printerr("Error: Loaded resource is not a GDScript for path: ", select_filepath)
	else:
		printerr("Error: Question file does not exist or path is empty: ", select_filepath)

func display_questions() -> void:
	#var owner = get_viewport().get_gui_focus_owner()
	#if owner:
		#owner.release_focus()
	
	if index >= questionData.size():
		Global.score[playername] = localscore
		get_tree().change_scene_to_file("res://scenes/score_end.tscn")
		
		#question_label.text = "Quiz Finished!"
		#for btn in option_btns:
			#btn.disabled = true
		#print("Quiz completed for ", Global.selected_file)
		#print(localscore)
		return
	
	get_viewport().gui_release_focus()
	var currentQ = questionData[index]
	question_label.text = currentQ["question_text"]
	for i in range(option_btns.size()):
		if i < currentQ["options"].size():
			option_btns[i].text = currentQ["options"][i]
			option_btns[i].disabled = false
			#option_btns[i].

			if not option_btns[i].is_connected("pressed", Callable(self, "_on_option_button_pressed")):
				option_btns[i].pressed.connect(Callable(self, "_on_option_button_pressed").bind(i))
		else:
			option_btns[i].text = ""
			option_btns[i].disabled = true

func _ready() -> void:
	load_questions(Global.selected_file) # Call the function to load the data

	# After loading, check if questions were loaded and then display the first one
	if questionData.size() > 0:
		display_questions()
	else:
		question_label.text = "Error: Could not load questions for " + Global.selected_file
		for btn in option_btns:
			btn.disabled = true

func _process(delta: float) -> void:
	pass


func _on_back_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/select_menu.tscn") # Replace with function body.

func _on_option_button_pressed(selected_index: int) -> void:
	# You can process the selected answer here (e.g., scoring)
	var correct_index = questionData[index]["correct_answer_index"]
	if selected_index == correct_index:
		print("Correct!")
		localscore += 1
		score_btn.text = "Score: " + str(localscore) + "/6"
	else:
		print("Wrong! Correct answer is: ", questionData[index]["options"][correct_index])

	# Move to the next question
	index += 1
	display_questions()
