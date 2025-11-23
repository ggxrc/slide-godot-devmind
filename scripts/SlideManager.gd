extends Node

## Gerenciador Global de Slides
## Controla navegação, transições e estado dos slides

# Lista de cenas de slides em ordem
var slide_scenes: Array[String] = [
	"res://scenes/slides/slide_01_capa.tscn",
	"res://scenes/slides/slide_02_como_criar_jogo.tscn",
	"res://scenes/slides/slide_03_engines.tscn",
	"res://scenes/slides/slide_04_por_que_godot.tscn",
	"res://scenes/slides/slide_05_exemplos_jogos.tscn",
	"res://scenes/slides/slide_06_criando_projeto.tscn",
	"res://scenes/slides/slide_07_interface.tscn",
	"res://scenes/slides/slide_08_assets.tscn",
	"res://scenes/slides/slide_09_organizacao.tscn",
	"res://scenes/slides/slide_10_tres_conceitos.tscn",
	"res://scenes/slides/slide_11_personagem.tscn",
	"res://scenes/slides/slide_12_scripts.tscn",
	"res://scenes/slides/slide_13_conectando.tscn",
	"res://scenes/slides/slide_14_animacoes_1.tscn",
	"res://scenes/slides/slide_15_animacao_pratica.tscn",
	"res://scenes/slides/slide_16_pausa_inspector.tscn",
	"res://scenes/slides/slide_17_instanciamento.tscn",
	"res://scenes/slides/slide_18_tiro.tscn",
	"res://scenes/slides/slide_19_colisoes.tscn",
	"res://scenes/slides/slide_20_groups.tscn",
	"res://scenes/slides/slide_21_inimigos.tscn",
	"res://scenes/slides/slide_22_vida.tscn",
	"res://scenes/slides/slide_23_spawn.tscn",
	"res://scenes/slides/slide_24_pausa.tscn",
	"res://scenes/slides/slide_25_juice.tscn",
	"res://scenes/slides/slide_26_particulas.tscn",
	"res://scenes/slides/slide_27_screenshake.tscn",
	"res://scenes/slides/slide_28_ui.tscn",
	"res://scenes/slides/slide_29_balanceamento.tscn",
	"res://scenes/slides/slide_30_revelacao.tscn",
	"res://scenes/slides/slide_31_aprendeu.tscn",
	"res://scenes/slides/slide_32_continue_aprendendo.tscn",
	"res://scenes/slides/slide_33_agradecimento.tscn",
]

var current_slide_index: int = 0
var slide_container: Node = null
var transition_duration: float = 0.3

func _ready():
	# Procurar pelo container de slides na cena principal
	slide_container = get_tree().root.get_node_or_null("Main/SlideContainer")
	if slide_container:
		load_slide(0)

func _input(event):
	# Navegação por teclado
	if event.is_action_pressed("ui_right") or event.is_action_pressed("ui_page_down"):
		next_slide()
	elif event.is_action_pressed("ui_left") or event.is_action_pressed("ui_page_up"):
		previous_slide()
	elif event.is_action_pressed("ui_home"):
		go_to_slide(0)
	elif event.is_action_pressed("ui_end"):
		go_to_slide(slide_scenes.size() - 1)

func next_slide():
	if current_slide_index < slide_scenes.size() - 1:
		go_to_slide(current_slide_index + 1)

func previous_slide():
	if current_slide_index > 0:
		go_to_slide(current_slide_index - 1)

func go_to_slide(index: int):
	if index < 0 or index >= slide_scenes.size():
		return
	
	current_slide_index = index
	load_slide(index)

func load_slide(index: int):
	if not slide_container:
		push_error("SlideContainer não encontrado!")
		return
	
	# Limpar slide atual
	for child in slide_container.get_children():
		child.queue_free()
	
	# Carregar novo slide
	var slide_scene = load(slide_scenes[index])
	if slide_scene:
		var slide_instance = slide_scene.instantiate()
		slide_container.add_child(slide_instance)
		
		# Fade in
		slide_instance.modulate.a = 0
		var tween = create_tween()
		tween.tween_property(slide_instance, "modulate:a", 1.0, transition_duration)
		
		# Atualizar contador de slides
		update_slide_counter()

func update_slide_counter():
	var counter = get_tree().root.get_node_or_null("Main/UI/SlideCounter")
	if counter:
		counter.text = "%d / %d" % [current_slide_index + 1, slide_scenes.size()]

func get_current_slide_number() -> int:
	return current_slide_index + 1

func get_total_slides() -> int:
	return slide_scenes.size()
