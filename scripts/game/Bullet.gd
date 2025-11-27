extends Area2D
class_name Bullet

## Script do Tiro - Funciona independente do contexto
## Use este script no seu projeto de jogo!

# ============================================
# CONFIGURAÇÕES (ajuste no Inspector)
# ============================================
@export var speed: float = 600.0
@export var damage: int = 1
@export var lifetime: float = 3.0  # Tempo até desaparecer

# ============================================
# VARIÁVEIS INTERNAS
# ============================================
var direction: int = 1  # 1 = direita, -1 = esquerda

# ============================================
# INICIALIZAÇÃO
# ============================================
func _ready():
	# Conectar sinais de colisão
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)
	
	# Timer para destruir o tiro após um tempo
	await get_tree().create_timer(lifetime).timeout
	queue_free()

# ============================================
# MOVIMENTO
# ============================================
func _physics_process(delta):
	position.x += speed * direction * delta

# ============================================
# FUNÇÃO PARA DEFINIR DIREÇÃO (chamada pelo Player)
# ============================================
func set_direction(dir: int):
	direction = dir
	# Inverter sprite se atirar para esquerda
	if dir < 0:
		scale.x = -1

# ============================================
# COLISÕES
# ============================================
func _on_body_entered(body):
	# Verificar se é um inimigo
	if body.is_in_group("enemies") or body is Enemy:
		if body.has_method("take_damage"):
			body.take_damage(damage)
		queue_free()
	
	# Verificar se é parede/chão (TileMap ou StaticBody2D)
	if body is TileMap or body is StaticBody2D:
		queue_free()

func _on_area_entered(area):
	# Colisão com outras áreas (hitboxes de inimigos, etc.)
	var parent = area.get_parent()
	if parent.is_in_group("enemies") or parent is Enemy:
		if parent.has_method("take_damage"):
			parent.take_damage(damage)
		queue_free()
