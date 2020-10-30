extends Control

onready var _passages: Array = $JSONParser.passages
onready var _dialogue: Label = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/Label
onready var _option1_btn: Button = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/Option1/Button
onready var _option2_btn: Button = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/Option2/Button
onready var _option3_btn: Button = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/Option3/Button
onready var _option4_btn: Button = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/Option4/Button

var _current_passage_index: int = 0

func _ready():
    _change_dialogue(_current_passage_index)
    
func _change_dialogue(index: int):
    _dialogue.text = _passages[index].text
    
    match _passages[index].links.size():
        1:
            _option1_btn.text = ""
            _option2_btn.text = ""
            _option3_btn.text = ""
            _option4_btn.text = _passages[index].links[0].text
            
            _option1_btn.disabled = true
            _option2_btn.disabled = true
            _option3_btn.disabled = true
            _option4_btn.disabled = false
        2:
            _option1_btn.text = _passages[index].links[0].text
            _option2_btn.text = _passages[index].links[1].text
            _option3_btn.text = ""
            _option4_btn.text = ""
            
            _option1_btn.disabled = false
            _option2_btn.disabled = false
            _option3_btn.disabled = true
            _option4_btn.disabled = true
        3:
            _option1_btn.text = _passages[index].links[0].text
            _option2_btn.text = _passages[index].links[1].text
            _option3_btn.text = _passages[index].links[2].text
            _option4_btn.text = ""
            
            _option1_btn.disabled = false
            _option2_btn.disabled = false
            _option3_btn.disabled = false
            _option4_btn.disabled = true
        4:
            _option1_btn.text = _passages[index].links[0].text
            _option2_btn.text = _passages[index].links[1].text
            _option3_btn.text = _passages[index].links[2].text
            _option4_btn.text = _passages[index].links[3].text
            
            _option1_btn.disabled = false
            _option2_btn.disabled = false
            _option3_btn.disabled = false
            _option4_btn.disabled = false
        _:
            return
            
    _current_passage_index = index


func _on_Option1_Button_pressed():
    var current_passage: Passage = _passages[_current_passage_index]
    var next_passage_pid: int = current_passage.links[0].pid
    var index: int = 0
    
    for psg in _passages:
        if psg.pid == next_passage_pid:
            _change_dialogue(index)
            return
        index += 1


func _on_Option2_Button_pressed():
    var current_passage: Passage = _passages[_current_passage_index]
    var next_passage_pid: int = current_passage.links[1].pid
    var index: int = 0
    
    for psg in _passages:
        if psg.pid == next_passage_pid:
            _change_dialogue(index)
            return
        index += 1

func _on_Option3_Button_pressed():
    var current_passage: Passage = _passages[_current_passage_index]
    var next_passage_pid: int = current_passage.links[2].pid
    var index: int = 0
    
    for psg in _passages:
        if psg.pid == next_passage_pid:
            _change_dialogue(index)
            return
        index += 1


func _on_Option4_Button_pressed():
    var current_passage: Passage = _passages[_current_passage_index]
    var next_passage_pid: int = current_passage.links[0].pid
    var index: int = 0
    
    for psg in _passages:
        if psg.pid == next_passage_pid:
            _change_dialogue(index)
            return
        index += 1
