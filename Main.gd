extends Node2D

var switches: Array[Switch] = []
var person_index: int = 1
var switch_scene: PackedScene = preload("res://Switch.tscn")

func _ready():
	for i in range(0, 100):
		_add_switch(i)
#	for child in $SwitchContainer.get_children():
#		if not child.is_in_group("switch"):
#			continue
#		switches.append(child as Switch)

func _add_switch(index: int):
	var switch: Switch = switch_scene.instantiate()
	switch.index = index
	$SwitchContainer.add_child(switch)
	switches.append(switch)

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_process_person(person_index)
		person_index += 1
		$IndexLabel.text = "Index: "+str(person_index)

func _process_person(index: int):
	for i in range(0, switches.size()):
		if i % index == 0:
			print("Person "+str(index)+" switching "+str(i))
			var switch: Switch = switches[i]
			switch.state = not switch.state
