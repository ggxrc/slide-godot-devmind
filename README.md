# 🎮 Slides Interativos na Godot Engine

## Sistema de Apresentação para Minicurso de Criação de Jogos

[![Godot Engine](https://img.shields.io/badge/Godot-4.x-blue.svg)](https://godotengine.org/)
[![License](https://img.shields.io/badge/license-Educational-green.svg)]()

> **🚀 INÍCIO RÁPIDO:** Leia [COMECE_AQUI.md](COMECE_AQUI.md) para executar em 3 passos!

---

## 📋 Sobre o Projeto

Este é um sistema de apresentação de slides **100% interativo** criado inteiramente na Godot Engine para um minicurso de criação de jogos.

**Diferencial:** Os slides não apenas *falam* sobre criar jogos na Godot - eles **são** um jogo feito na Godot!

## 🎮 Controles

- **→ / Page Down**: Próximo slide
- **← / Page Up**: Slide anterior
- **Home**: Primeiro slide
- **End**: Último slide

## 📁 Estrutura do Projeto

```
slides/
├── scenes/
│   ├── Main.tscn          # Cena principal
│   ├── SlideTemplate.tscn # Template base
│   └── slides/            # Cenas individuais de slides
├── scripts/
│   ├── SlideManager.gd    # Gerenciador global
│   ├── BaseSlide.gd       # Classe base
│   └── slides/            # Scripts específicos de slides
├── assets/
│   ├── sprites/           # Imagens e sprites
│   ├── fonts/             # Fontes customizadas
│   └── sounds/            # Efeitos sonoros
├── project.godot
└── README.md
```

## 🚀 Como Usar

1. Abra o projeto na Godot 4.x
2. Execute a cena `Main.tscn`
3. Use as setas do teclado para navegar

## ✨ Recursos

- ✅ Sistema de navegação fluido
- ✅ Transições animadas
- ✅ Elementos interativos
- ✅ Contador de slides
- ✅ Efeitos visuais
- ✅ Exemplos práticos de código

## 📝 Slides Implementados

### Bloco 1: Abertura
- [x] Slide 1: Capa
- [x] Slide 2: Como Criar um Jogo (com exemplo interativo)

### Bloco 2: Fundamentos
- [x] Slide 3: O que são Engines
- [x] Slide 4: Por quê Godot?
- [ ] Slide 5: Exemplos de Jogos
- [ ] Slide 6: Criando Projeto
- [ ] Slide 7: Interface da Godot

### Blocos seguintes...
(Em desenvolvimento)

## 🎨 Personalizando

### Adicionar Novo Slide

1. Duplique `SlideTemplate.tscn`
2. Renomeie para `slide_XX_nome.tscn`
3. Edite o conteúdo
4. Adicione o caminho em `SlideManager.gd` → `slide_scenes`

### Mudar Cores/Tema

Edite os `theme_override` nos nós de cada slide.

## 📦 Assets Necessários

Para completar a apresentação, você pode adicionar:
- Pixel art do personagem (sprite sheet)
- Logos das engines (Unity, Unreal, Godot, GameMaker)
- Screenshots de jogos feitos na Godot
- Screenshots da interface da Godot
- Fontes personalizadas (opcional)
- Efeitos sonoros (opcional)

Sites recomendados:
- itch.io/game-assets
- kenney.nl
- opengameart.org

## 🔧 Requisitos

- Godot Engine 4.2+
- Nenhuma dependência externa

## 📄 Licença

Projeto educacional - Use livremente para seus próprios minicursos!

## 🤝 Contribuindo

Sinta-se livre para melhorar os slides, adicionar animações ou criar novos recursos interativos!
