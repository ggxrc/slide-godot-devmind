extends Node

@onready var play_button = $"../MarginContainer/VBoxContainer/ContentContainer/DemoPanel/ControlButtons/PlayButton"
@onready var stop_button = $"../MarginContainer/VBoxContainer/ContentContainer/DemoPanel/ControlButtons/StopButton"
@onready var character_sprite: AnimatedSprite2D = $"../MarginContainer/VBoxContainer/ContentContainer/DemoPanel/AnimatedCharacter"
@onready var state_label = $"../MarginContainer/VBoxContainer/ContentContainer/DemoPanel/StateLabel"

var is_playing = false

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	stop_button.pressed.connect(_on_stop_pressed)
	# Iniciar parado
	character_sprite.stop()
	character_sprite.frame = 0
	_update_state_label()

func _on_play_pressed():
	if is_playing:
		# Se está animando, pausar
		character_sprite.pause()
		is_playing = false
	else:
		# Se está parado/pausado, voltar a animar
		character_sprite.play("run_01")
		is_playing = true
	_update_state_label()

func _on_stop_pressed():
	# Parar e resetar para o frame 0
	character_sprite.stop()
	character_sprite.frame = 0
	is_playing = false
	_update_state_label()

func _update_state_label():
	if is_playing:
		state_label.text = "Estado: ANIMANDO"
		state_label.add_theme_color_override("font_color", Color(0.5, 1, 0.5))
		play_button.text = "⏸ Pause"
	else:
		if character_sprite.frame == 0:
			state_label.text = "Estado: PARADO"
			state_label.add_theme_color_override("font_color", Color(1, 0.5, 0.5))
		else:
			state_label.text = "Estado: PAUSADO"
			state_label.add_theme_color_override("font_color", Color(1, 1, 0.5))
		play_button.text = "▶ Play"
