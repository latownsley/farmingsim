extends PanelContainer

@onready var log_label: Label = $MarginContainer/VBoxContainer/Logs/LogLabel
@onready var stone_label: Label = $MarginContainer/VBoxContainer/Stone/StoneLabel
@onready var corn_label: Label = $MarginContainer/VBoxContainer/Corn/CornLabel
@onready var tomato_label: Label = $MarginContainer/VBoxContainer/Tomato/TomatoLabel
@onready var egg_label: Label = $MarginContainer/VBoxContainer/Egg/EggLabel
@onready var milk_label: Label = $MarginContainer/VBoxContainer/Milk/MilkLabel

var is_visible = false

func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)
	self.visible = false

func _input(event):
	if Input.is_action_pressed("Inventory"):
		is_visible = !is_visible
		self.visible = is_visible

func on_inventory_changed() -> void:
	var curr_inventory: Dictionary = InventoryManager.inventory
	
	if curr_inventory.has("log"):
		log_label.text = str(curr_inventory["log"])
	
	if curr_inventory.has("stone"):
		stone_label.text = str(curr_inventory["stone"])
	
	if curr_inventory.has("corn"):
		corn_label.text = str(curr_inventory["corn"])
	
	if curr_inventory.has("tomato"):
		tomato_label.text = str(curr_inventory["tomato"])
	
	if curr_inventory.has("egg"):
		egg_label.text = str(curr_inventory["egg"])
	
	if curr_inventory.has("milk"):
		milk_label.text = str(curr_inventory["milk"])
