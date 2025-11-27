extends Node

@onready var trigger_button = $"../MarginContainer/VBoxContainer/TriggerButton"
@onready var pre_reveal_title = $"../MarginContainer/VBoxContainer/PreRevealTitle"
@onready var reveal_content = $"../MarginContainer/VBoxContainer/RevealContent"
@onready var glitch_effect = $"../GlitchEffect"
@onready var glitch_timer = $GlitchTimer
@onready var glitch_label = $"../MarginContainer/VBoxContainer/RevealContent/GlitchPanel/GlitchLabel"

var glitch_active = false
var glitch_count = 0

func _ready():
	trigger_button.pressed.connect(_on_trigger_pressed)
	glitch_timer.timeout.connect(_on_glitch_tick)

func _on_trigger_pressed():
	trigger_button.visible = false
	start_glitch_sequence()

func start_glitch_sequence():
	glitch_active = true
	glitch_count = 0
	glitch_timer.start()

func _on_glitch_tick():
	glitch_count += 1
	
	# Efeito glitch visual
	glitch_effect.visible = randf() > 0.5
	glitch_effect.color.a = randf() * 0.3
	
	# Fazer o título "glitchar"
	if glitch_count % 2 == 0:
		pre_reveal_title.text = _get_glitched_text("GOSTARAM DOS SLIDES?")
	else:
		pre_reveal_title.text = "GOSTARAM DOS SLIDES?"
	
	# Após 20 ticks (~2 segundos), revelar
	if glitch_count >= 20:
		reveal_final()

func _get_glitched_text(original: String) -> String:
	var glitch_chars = "▓▒░█▄▀■□▪▫"
	var result = ""
	for i in range(original.length()):
		if randf() > 0.7:
			result += glitch_chars[randi() % glitch_chars.length()]
		else:
			result += original[i]
	return result

func reveal_final():
	glitch_timer.stop()
	glitch_effect.visible = false
	pre_reveal_title.visible = false
	
	# Mostrar conteúdo com fade in
	reveal_content.visible = true
	reveal_content.modulate.a = 0
	
	var tween = create_tween()
	tween.tween_property(reveal_content, "modulate:a", 1.0, 0.5)
	
	# Animar label glitch
	animate_glitch_label()

func animate_glitch_label():
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(glitch_label, "modulate:a", 0.5, 0.5)
	tween.tween_property(glitch_label, "modulate:a", 1.0, 0.5)
