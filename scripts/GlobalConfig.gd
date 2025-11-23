extends Node

## Configurações Globais do Sistema de Slides

# Configurações visuais
const BACKGROUND_COLOR := Color(0.1, 0.1, 0.15)
const TITLE_COLOR := Color(1, 1, 1)
const TEXT_COLOR := Color(0.9, 0.9, 0.95)
const ACCENT_COLOR := Color(0.5, 0.8, 1.0)
const HIGHLIGHT_COLOR := Color(1, 0.8, 0.5)

# Tamanhos de fonte padrão
const TITLE_FONT_SIZE := 56
const SUBTITLE_FONT_SIZE := 42
const BODY_FONT_SIZE := 24
const SMALL_FONT_SIZE := 18

# Configurações de animação
const DEFAULT_TRANSITION_TIME := 0.3
const FADE_DURATION := 0.5

# Configurações de apresentação
var presentation_mode := true
var show_slide_counter := true
var show_navigation_hints := true

# Estatísticas
var start_time := 0.0
var slides_viewed := []

func _ready():
	start_time = Time.get_unix_time_from_system()

func get_elapsed_time() -> String:
	var elapsed = Time.get_unix_time_from_system() - start_time
	var minutes = int(elapsed / 60)
	var seconds = int(elapsed) % 60
	return "%02d:%02d" % [minutes, seconds]

func mark_slide_viewed(slide_index: int):
	if slide_index not in slides_viewed:
		slides_viewed.append(slide_index)

func get_progress_percentage() -> float:
	var total = SlideManager.get_total_slides() if SlideManager else 33
	return (slides_viewed.size() / float(total)) * 100.0
