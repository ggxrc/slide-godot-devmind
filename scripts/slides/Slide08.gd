extends Node

## Script para o Slide 08 - Assets
## Gerencia os botões de áudio e demonstrações interativas

@onready var btn_jump = $"../MarginContainer/VBoxContainer/Types/Audio/Icon/ButtonsContainer/BtnJump"
@onready var btn_hit = $"../MarginContainer/VBoxContainer/Types/Audio/Icon/ButtonsContainer/BtnHit"
@onready var btn_coin = $"../MarginContainer/VBoxContainer/Types/Audio/Icon/ButtonsContainer/BtnCoin"

@onready var audio_jump: AudioStreamPlayer = $"../AudioJump"
@onready var audio_hit: AudioStreamPlayer = $"../AudioHit"
@onready var audio_coin: AudioStreamPlayer = $"../AudioCoin"

func _ready():
	btn_jump.pressed.connect(_on_jump_pressed)
	btn_hit.pressed.connect(_on_hit_pressed)
	btn_coin.pressed.connect(_on_coin_pressed)

func _on_jump_pressed():
	if audio_jump:
		audio_jump.play()

func _on_hit_pressed():
	if audio_hit:
		audio_hit.play()

func _on_coin_pressed():
	if audio_coin:
		audio_coin.play()
