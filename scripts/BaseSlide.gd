extends Control
class_name BaseSlide

## Classe base para todos os slides
## Fornece funcionalidades comuns e estrutura padrão

@onready var title_label: Label = get_node_or_null("MarginContainer/VBoxContainer/TitleLabel")
@onready var content_container: Control = get_node_or_null("MarginContainer/VBoxContainer/ContentContainer")

func _ready():
	setup_slide()

func setup_slide():
	# Override em slides específicos
	pass

func show_with_animation():
	modulate.a = 0
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.3)

func hide_with_animation():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.3)
	await tween.finished
