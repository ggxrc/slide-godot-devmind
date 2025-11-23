extends Node

@onready var play_button = $"../MarginContainer/VBoxContainer/ContentContainer/DemoPanel/ControlButtons/PlayButton"
@onready var stop_button = $"../MarginContainer/VBoxContainer/ContentContainer/DemoPanel/ControlButtons/StopButton"
@onready var character_sprite = $"../MarginContainer/VBoxContainer/ContentContainer/DemoPanel/AnimatedCharacter/CharacterSprite"
@onready var state_label = $"../MarginContainer/VBoxContainer/ContentContainer/DemoPanel/StateLabel"

var is_animating = false
var animation_timer = 0.0
var current_frame = 0
var frames = ["🧍", "🙂", "😊", "🙂"]  # Simulação de frames

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	stop_button.pressed.connect(_on_stop_pressed)

func _process(delta):
	if is_animating:
		animation_timer += delta
		
		# Trocar frame a cada 0.2 segundos (5 FPS para animação)
		if animation_timer >= 0.2:
			animation_timer = 0.0
			current_frame = (current_frame + 1) % frames.size()
			character_sprite.text = frames[current_frame]

func _on_play_pressed():
	is_animating = true
	state_label.text = "Estado: ANIMANDO"
	state_label.add_theme_color_override("font_color", Color(0.5, 1, 0.5))

func _on_stop_pressed():
	is_animating = false
	current_frame = 0
	character_sprite.text = frames[0]
	state_label.text = "Estado: PARADO"
	state_label.add_theme_color_override("font_color", Color(1, 0.5, 0.5))
