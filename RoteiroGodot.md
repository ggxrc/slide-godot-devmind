# [title:Roteiro Godot]
## 📑 **ESTRUTURA DO SLIDE**

### **BLOCO 1: ABERTURA (Slides 1-2)**

---

#### **Slide 1: Capa**
**Conteúdo:**
- Título grande: "INTRODUÇÃO À CRIAÇÃO DE JOGOS"
- Subtítulo: "usando Godot Engine"
- Personagem pixel art idle animando
- Seu nome/contato
- Data/local
- "Pressione → para começar"

**Elementos visuais:**
- Fundo gradiente (azul escuro → roxo)
- Partículas sutis no fundo
- Personagem centralizado
- Tipografia moderna e legível

---

#### **Slide 2: Como Criar um Jogo**
**Conteúdo:**
- Título: "Como um Jogo é Criado?"
- Diagrama: Input → Lógica → Output (animado)
- Exemplo interativo: Botão clicável que faz personagem pular
- Texto: "TODO jogo funciona com esse ciclo - 60x por segundo!"

**Elementos interativos:**
- Personagem que pula ao clicar
- Setas animadas mostrando o fluxo
- Contador de FPS visível

---

### **BLOCO 2: FUNDAMENTOS (Slides 3-7)**

---

#### **Slide 3: O que são Engines**
**Conteúdo:**
- Título: "Game Engines: Sua Caixa de Ferramentas"
- Comparação visual:
  ```
  SEM ENGINE          COM ENGINE
  ❌ Programar física   ✅ Física pronta
  ❌ Renderizar         ✅ Render automático
  ❌ Sons               ✅ Sistema de áudio
  ❌ Colisões           ✅ Detecção built-in
  ```
- Logos: Unity, Unreal, Godot, GameMaker
- Analogia: "Como usar Photoshop vs. Paint"

**Elementos visuais:**
- Grid comparativo lado a lado
- Ícones representando cada feature
- Logos clicáveis (opcional: info rápida ao clicar)

---

#### **Slide 4: Por quê Godot?**
**Conteúdo:**
- Título: "Por que Escolhemos a Godot?"
- Lista com ícones:
  - 💰 100% Gratuita (sempre)
  - 🪶 Leve (50MB vs 20GB+)
  - 🎓 Fácil de Aprender
  - 🔓 Código Aberto
  - 🚀 Crescimento Rápido
- Comparação de tamanho de download (gráfico visual)
- "Mas os CONCEITOS funcionam em TODAS as engines!"

**Elementos visuais:**
- Ícones grandes e coloridos
- Gráfico de barras (tamanho downloads)
- Logo da Godot em destaque

---

#### **Slide 5: Exemplos de Jogos na Godot**
**Conteúdo:**
- Título: "Jogos Feitos na Godot"
- Grid de screenshots/GIFs:
  - Cassette Beasts
  - Dome Keeper
  - Brotato
  - Sonic Colors Ultimate
  - Ex-Zodiac
  - CRUELTY SQUAD
- "Indie ao AAA - tudo é possível!"

**Elementos visuais:**
- Grid 3x2 com imagens
- Hover mostra nome do jogo
- Links (se possível)

---

#### **Slide 6: Criando Projeto na Godot**
**Conteúdo:**
- Título: "Vamos Começar!"
- Passo a passo visual:
  1. Abrir Godot
  2. "New Project"
  3. Escolher pasta
  4. Nome do projeto
  5. "Create & Edit"
- Screenshot de cada passo
- "Hoje usaremos projeto PRÉ-CONFIGURADO"

**Elementos visuais:**
- Screenshots anotados
- Setas indicando onde clicar
- Nota em destaque sobre projeto base

---

#### **Slide 7: Explicando Básico da Godot**
**Conteúdo:**
- Título: "Tour Rápido: Interface da Godot"
- Screenshot anotado da interface:
  ```
  ┌─────────────────────────────────┐
  │  1  │      3. VIEWPORT      │ 4 │
  │  S  ├───────────────────────┤   │
  │  C  │   5. BOTTOM PANEL     │ I │
  │  E  │   (Animation, Debug)  │ N │
  │  N  │                       │ S │
  │  E  │                       │ P │
  │     │                       │   │
  │  2. FILESYSTEM              │   │
  └─────────────────────────────────┘
  ```
- Legenda com função de cada área
- "Não precisa decorar - vamos usar naturalmente!"

**Elementos visuais:**
- Imagem grande da interface
- Números/setas coloridas
- Tooltip ao passar mouse (se interativo)

---

### **BLOCO 3: ASSETS E SETUP (Slides 8-10)**

---

#### **Slide 8: Importando Assets**
**Conteúdo:**
- Título: "Assets: A Arte do Jogo"
- O que são assets:
  - 🎨 Sprites (personagens, cenários)
  - 🔊 Sons (efeitos, música)
  - 🎬 Animações
  - 📦 Modelos 3D (não hoje)
- Como importar:
  1. Arrastar arquivos para pasta do projeto
  2. Godot detecta automaticamente
  3. Aparecem no FileSystem
- Sites para assets grátis (lista rápida)

**Elementos visuais:**
- Ícones representando cada tipo
- GIF mostrando drag & drop
- Lista de sites (itch.io, kenney.nl, etc)

---

#### **Slide 9: Organização de Projeto**
**Conteúdo:**
- Título: "Organizando seu Projeto"
- Estrutura de pastas ideal:
  ```
  res://
  ├── scenes/     (cenas .tscn)
  ├── scripts/    (códigos .gd)
  ├── sprites/    (imagens)
  ├── sounds/     (áudio)
  └── fonts/      (tipografia)
  ```
- "Organização = Menos Dor de Cabeça!"
- Comparação: Projeto organizado vs bagunçado

**Elementos visuais:**
- Árvore de pastas visual
- Ícone de pasta para cada tipo
- Antes/depois (organizado vs caótico)

---

#### **Slide 10: NOVA PÁGINA - Conceitos Fundamentais**
**Conteúdo:**
- Título: "3 Conceitos que Você PRECISA Saber"
- **1. Objetos e Componentes**
  - Tudo é feito de objetos
  - Objetos têm partes (componentes)
  - Exemplo visual: Carro = chassis + rodas + motor
- **2. Hierarquia (Parent-Child)**
  - Filho segue o pai
  - Exemplo: Arma é filha do Player
- **3. Templates (Cenas)**
  - Cria uma vez, usa infinitas
  - Exemplo: Molde de biscoito

**Elementos visuais:**
- 3 diagramas lado a lado
- Animações mostrando conceitos
- Ícones ilustrativos

---

### **BLOCO 4: CRIANDO O JOGO (Slides 11-20)**

---

#### **Slide 11: Criando Primeiro Personagem**
**Conteúdo:**
- Título: "Vamos Criar o Personagem!"
- Estrutura de nodes:
  ```
  Player (CharacterBody2D)
  ├── Sprite2D
  ├── CollisionShape2D
  ├── AnimationPlayer
  └── WeaponPoint
  ```
- "Cada parte tem uma função!"
- Checklist de criação (rápido)

**Elementos visuais:**
- Árvore de hierarquia visual
- Ícones para cada node type
- Screenshot do resultado

---

#### **Slide 12: Explicando Scripts**
**Conteúdo:**
- Título: "Scripts: O Cérebro do Jogo"
- O que é um script:
  - Código que diz como objetos se comportam
  - "Se apertar A, mova para esquerda"
- GDScript é fácil! Parece Python
- Exemplo visual de código comentado:
  ```gdscript
  # Capturar input
  var direction = Input.get_axis("left", "right")
  # Aplicar movimento
  velocity.x = direction * speed
  ```
- "Hoje: scripts PRONTOS! Só conectar."

**Elementos visuais:**
- Bloco de código com syntax highlight
- Comparação: código vs resultado no jogo
- Ícone de "play" mostrando execução

---

#### **Slide 13: Atribuindo Script ao Personagem**
**Conteúdo:**
- Título: "Conectando o Cérebro ao Corpo"
- Passo a passo:
  1. Selecionar node Player
  2. Clicar ícone de script 📄
  3. "Load" → player.gd
  4. Verificar ícone de script apareceu
- "Script anexado = Personagem ganha vida!"
- Resultado: Player com comportamento

**Elementos visuais:**
- Screenshots passo a passo
- Setas indicando botões
- Gif do processo completo

---

#### **Slide 14: Criando Animações - PARTE 1**
**Conteúdo:**
- Título: "Dando Vida ao Personagem"
- O que são animações:
  - Trocar imagens rapidamente (flipbook)
  - Estados visuais (idle, walk, jump)
- AnimationPlayer: ferramenta da Godot
- "Vamos criar animação IDLE juntos!"
- Preview do resultado: personagem piscando

**Elementos visuais:**
- Diagrama de flipbook
- Sprite sheet anotado
- GIF do resultado final

---

#### **Slide 15: Criando Animações - PARTE 2**
**Conteúdo:**
- Título: "Animação na Prática"
- Passo a passo resumido:
  1. AnimationPlayer → New → "idle"
  2. Add Track → region_rect
  3. Keyframes em posições calculadas
  4. Loop ON → Play!
- Tabela de referência:
  ```
  idle: 2 frames (0.2s, loop)
  walk: 4 frames (0.4s, loop)
  jump: 1 frame (0.1s)
  fall: 1 frame (0.1s)
  ```
- "Agora é com vocês!"

**Elementos visuais:**
- Timeline visual do AnimationPlayer
- Tabela colorida com info
- Sprite sheet com números

---

#### **Slide 16: Mostrando Inspector e Atributos - PAUSA**
**Conteúdo:**
- Título: "⏸️ PAUSA: O Inspector é Seu Amigo"
- O que é o Inspector:
  - Painel de configurações de cada objeto
  - Muda valores SEM tocar no código!
- Demonstração: mudar `speed` do player
  - speed = 100 → lento
  - speed = 500 → rápido
  - speed = 1000 → MUITO rápido!
- "Experimentar = Aprender!"
- **5 MINUTOS DE PAUSA**

**Elementos visuais:**
- Screenshot do Inspector destacado
- Slider visual mostrando valores
- GIF comparando velocidades
- Timer grande: "5:00"

---

#### **Slide 17: Fazendo Personagem Atirar**
**Conteúdo:**
- Título: "Poder de Fogo!"
- Conceito: Instanciação
  - Criar objetos durante o jogo
  - Template → Cópia infinita
- Estrutura do projétil:
  ```
  Bullet (Area2D)
  ├── Sprite2D
  ├── CollisionShape2D
  └── Script
  ```
- Como funciona:
  1. Apertar botão
  2. Criar cópia de bullet.tscn
  3. Posicionar na arma
  4. Adicionar ao mundo
- "Template pronto, só configurar!"

**Elementos visuais:**
- Diagrama: 1 template → ∞ cópias
- Árvore do bullet
- GIF mostrando tiro em ação

---

#### **Slide 18: NOVA PÁGINA - Sistema de Tiro Completo**
**Conteúdo:**
- Título: "Anatomia do Tiro"
- O que o script faz (visual):
  ```
  ┌─────────────┐
  │ 1. DETECTAR │ Input (clique)
  └──────┬──────┘
         │
  ┌──────▼──────┐
  │ 2. INSTANCIAR│ Criar projétil
  └──────┬──────┘
         │
  ┌──────▼──────┐
  │ 3. POSICIONAR│ WeaponPoint
  └──────┬──────┘
         │
  ┌──────▼──────┐
  │ 4. MOVER    │ velocity × delta
  └──────┬──────┘
         │
  ┌──────▼──────┐
  │ 5. DESTRUIR │ Após X segundos
  └─────────────┘
  ```
- Variáveis customizáveis:
  - fire_rate (velocidade de tiro)
  - bullet_speed (rapidez)
  - bullet_lifetime (duração)

**Elementos visuais:**
- Flowchart animado
- Sliders mostrando valores
- Comparação visual de valores

---

#### **Slide 19: Criando Colisões**
**Conteúdo:**
- Título: "Fazendo as Coisas se Tocarem"
- O que é colisão:
  - Detectar quando objetos se encostam
  - Base de TODO gameplay
- Tipos na Godot:
  - **Física:** Empurra/bloqueia (StaticBody, RigidBody)
  - **Detecção:** Só avisa que tocou (Area2D)
- Configurando:
  - CollisionShape2D
  - Layers e Masks (quem colide com quem)
- Exemplo: Projétil (Area2D) toca Inimigo (CharacterBody2D)

**Elementos visuais:**
- Diagrama Venn (layers)
- Shapes diferentes (circle, rect, capsule)
- Tabela de layers/masks

---

#### **Slide 20: NOVA PÁGINA - Grupos e Tags**
**Conteúdo:**
- Título: "Organizando com Grupos"
- O que são grupos:
  - "Etiquetas" para categorizar objetos
  - Facilita detectar tipo do objeto
- Exemplo:
  ```
  Projétil colide com algo...
  ↓
  É do grupo "enemy"?
    SIM → Causar dano
    NÃO → Ignorar
  ```
- Como adicionar:
  1. Selecionar node
  2. Node → Groups
  3. Adicionar "enemy", "player", etc
- Grupos usados no projeto:
  - `player`
  - `enemy`
  - `projectile`
  - `ground`

**Elementos visuais:**
- Fluxograma de decisão
- Screenshot da aba Groups
- Lista visual dos grupos

---

### **BLOCO 5: INIMIGOS E GAMEPLAY (Slides 21-24)**

---

#### **Slide 21: Criando NPCs/Inimigos**
**Conteúdo:**
- Título: "Criando Oponentes"
- Estrutura do inimigo:
  ```
  Enemy (CharacterBody2D)
  ├── Sprite2D
  ├── CollisionShape2D
  ├── HitBox (Area2D)
  ├── HealthBar
  └── Script
  ```
- Comportamento:
  - Patrulha (vai e volta)
  - Detecta projétil
  - Perde vida
  - Morre
- "Mesma base do Player, comportamento diferente!"

**Elementos visuais:**
- Árvore de nodes
- Diagrama de movimento (patrulha)
- GIF do inimigo em ação

---

#### **Slide 22: NOVA PÁGINA - Sistema de Vida**
**Conteúdo:**
- Título: "HP: Pontos de Vida"
- Conceito universal de jogos:
  - HP = Hit Points
  - Dano diminui HP
  - HP = 0 → Morte
- Implementação visual:
  ```
  HP = 3
  ↓
  Toma dano (1)
  ↓
  HP = 2
  ↓
  Toma dano (1)
  ↓
  HP = 1
  ↓
  Toma dano (1)
  ↓
  HP = 0 → Morte!
  ```
- Feedback visual:
  - Barra de vida
  - Piscar vermelho
  - Animação de morte

**Elementos visuais:**
- Flowchart do sistema
- Barra de vida progressiva
- Comparação: com/sem feedback

---

#### **Slide 23: NOVA PÁGINA - Sistema de Spawn**
**Conteúdo:**
- Título: "Fazendo Inimigos Aparecerem"
- Por que spawn automático:
  - Jogos precisam de desafio contínuo
  - Ondas de inimigos
- Como funciona:
  ```
  Timer (2 segundos)
  ↓
  Escolhe spawn point aleatório
  ↓
  Instancia enemy.tscn
  ↓
  Posiciona no spawn point
  ↓
  Adiciona ao mundo
  ↓
  [Repete]
  ```
- Configurável:
  - spawn_interval (frequência)
  - max_enemies (limite na tela)

**Elementos visuais:**
- Timeline com spawns
- Mapa mostrando spawn points
- Sliders para configuração

---

#### **Slide 24: PAUSA - 10 MINUTOS**
**Conteúdo:**
- Título: "⏸️ PAUSA CRIATIVA - 10 MINUTOS"
- O que fazer:
  - ☕ Tomar água/café
  - 💭 Digerir os conceitos
  - 🎨 Explorar assets externos
  - 🎮 Testar o que fizeram até agora
- Sites de assets (relembrar):
  - itch.io/game-assets
  - kenney.nl
  - opengameart.org
- "Voltem renovados! Vem a melhor parte..."

**Elementos visuais:**
- Timer grande: "10:00"
- Lista de sites com QR codes
- Imagem relaxante (café, etc)

---

### **BLOCO 6: POLISH E FINALIZAÇÃO (Slides 25-30)**

---

#### **Slide 25: NOVA PÁGINA - Game Juice**
**Conteúdo:**
- Título: "O Segredo dos Jogos Divertidos: JUICE!"
- O que é Game Juice:
  - Pequenos detalhes que fazem GRANDE diferença
  - Feedback visual, sonoro, tátil
- Comparação lado a lado:
  ```
  SEM JUICE          COM JUICE
  ❌ Mata inimigo     ✅ Explosão
     (desaparece)        + Shake
                         + Som
                         + Partículas
                         + Freeze frame
                         + Pontos
  ```
- "80% do 'divertido' vem do juice!"

**Elementos visuais:**
- Vídeo comparativo
- Lista de elementos de juice
- Slider "sem juice ←→ com juice"

---

#### **Slide 26: NOVA PÁGINA - Adicionando Efeitos**
**Conteúdo:**
- Título: "Efeitos que Fazem a Diferença"
- Lista de efeitos a adicionar:
  - 📷 **Screen Shake** (tremor de câmera)
  - ❄️ **Freeze Frame** (pausa de 0.05s)
  - ✨ **Partículas** (explosões)
  - 🔊 **Sons** (feedback auditivo)
  - 💯 **Pontuação** (recompensa visual)
- "Cada um demora 2 minutos, impacto enorme!"

**Elementos visuais:**
- Grid com preview de cada efeito
- Comparação antes/depois
- Ícones grandes para cada tipo

---

#### **Slide 27: NOVA PÁGINA - UI e HUD**
**Conteúdo:**
- Título: "Comunicando com o Jogador"
- O que é UI/HUD:
  - Interface do Usuário
  - Heads-Up Display
  - Informações na tela
- Elementos comuns:
  - Pontuação (score)
  - Vida (hearts/bar)
  - Munição/poder
  - Minimapa
  - Timer
- No nosso jogo:
  - Score no topo
  - Vidas (opcional)

**Elementos visuais:**
- Screenshot de HUD de jogos famosos
- Mockup da nossa UI
- Breakdown de elementos

---

#### **Slide 28: NOVA PÁGINA - Balanceamento**
**Conteúdo:**
- Título: "A Arte do Equilíbrio"
- Por que balancear:
  - Muito fácil = Chato
  - Muito difícil = Frustrante
  - Ideal = Flow (desafio crescente)
- Variáveis que afetam dificuldade:
  ```
  MAIS FÁCIL                MAIS DIFÍCIL
  ↓                         ↓
  Player rápido             Player lento
  Dano alto                 Dano baixo
  Inimigos lentos           Inimigos rápidos
  Spawn espaçado            Spawn frequente
  Inimigos fracos           Inimigos tanques
  ```
- "Testar, ajustar, testar de novo!"

**Elementos visuais:**
- Slider de dificuldade
- Gráfico de curva de aprendizado
- Tabela comparativa

---

#### **Slide 29: NOVA PÁGINA - Experimentação Livre**
**Conteúdo:**
- Título: "Agora é com VOCÊS!"
- Tempo: 20-30 minutos
- Desafios sugeridos:
  
  **FÁCIL:**
  - [ ] Mudar cores do jogo
  - [ ] Ajustar velocidades
  - [ ] Trocar sprites
  
  **MÉDIO:**
  - [ ] Adicionar segundo tipo de inimigo
  - [ ] Criar power-up de velocidade
  - [ ] Sistema de vidas visuais
  
  **DIFÍCIL:**
  - [ ] Boss fight (1 inimigo gigante)
  - [ ] Inimigos que atiram
  - [ ] Diferentes armas
- "Quebrem o jogo! É a melhor forma de aprender."

**Elementos visuais:**
- Checklist grande
- Timer
- Galeria de inspirações

---

#### **Slide 30: REVELAÇÃO FINAL**
**Conteúdo:**
- Título com efeito glitch: "MOMENTO DA VERDADE..."
- [Trigger do efeito glitch]
- ```
  ░░░ ESTE SLIDE FOI FEITO 100% NA GODOT! ░░░
  ```
- [Alt+Tab mostrando editor]
- Explicação rápida:
  - Cada slide = uma cena
  - Transições = animações
  - Botões = detecção de input
  - Tudo que ensinamos = usado aqui
- "Projeto disponível no GitHub!"
- Link/QR code

**Elementos visuais:**
- Efeito glitch dramático
- Screenshot do editor
- QR code grande
- Logo da Godot com destaque

---

### **BLOCO 7: ENCERRAMENTO (Slides 31-33)**

---

#### **Slide 31: NOVA PÁGINA - Recapitulação**
**Conteúdo:**
- Título: "O Que Você Aprendeu Hoje"
- Checklist visual:
  
  **FUNDAMENTOS:**
  ✅ Como jogos funcionam (game loop)
  ✅ O que são game engines
  ✅ Objetos e componentes
  ✅ Hierarquia e templates
  
  **PRÁTICA:**
  ✅ Criar personagem jogável
  ✅ Sistema de movimento e física
  ✅ Animações
  ✅ Sistema de tiro
  ✅ Inimigos com IA básica
  ✅ Colisões e combate
  ✅ Efeitos e polish
  
  **CONCEITOS UNIVERSAIS:**
  ✅ Esses fundamentos funcionam em QUALQUER engine!

**Elementos visuais:**
- Lista com checkmarks animados
- Ícones para cada item
- Progresso visual (barra preenchida)

---

#### **Slide 32: NOVA PÁGINA - Próximos Passos**
**Conteúdo:**
- Título: "Continue Aprendendo!"
- **PRATICAR:**
  - Clone jogos clássicos (Pong, Space Invaders)
  - Participe de Game Jams (itch.io/jams)
  - Termine projetos pequenos
  
- **APRENDER:**
  - 📚 docs.godotengine.org
  - 🎥 GDQuest (YouTube)
  - 🎥 HeartBeast (YouTube)
  - 📖 Game Programming Patterns
  
- **COMUNIDADE:**
  - 💬 r/godot
  - 💬 Discord oficial Godot
  - 💬 Forum Godot
  
- **DESAFIO DA SEMANA:**
  Adicione UMA feature nova ao jogo e compartilhe!

**Elementos visuais:**
- Seções claramente divididas
- Ícones para cada recurso
- QR codes para links
- Badge de "desafio"

---

#### **Slide 33: NOVA PÁGINA - Agradecimento e Contatos**
**Conteúdo:**
- Título: "Obrigado!"
- Mensagem:
  ```
  "Vocês foram incríveis! 🚀
  
  Lembrem-se:
  - Todo dev começou do zero
  - Erros são parte do processo
  - Façam jogos RUINS primeiro
  - A indústria precisa de VOCÊS
  
  Agora vão lá e CRIEM!"
  ```
- **MATERIAIS:**
  - GitHub: [seu-link]
  - Discord: [seu-servidor]
  - Email: [seu-email]
  
- **FEEDBACK:**
  "Por favor, respondam a pesquisa rápida!"
  [QR code para formulário]

**Elementos visuais:**
- Foto/avatar seu
- QR codes grandes
- Personagem do jogo em pose vitoriosa
- Confete/celebração animada

---

## 📊 **RESUMO DA ESTRUTURA**

```
BLOCO 1: ABERTURA (2 slides)
├─ Capa
└─ Como criar um jogo

BLOCO 2: FUNDAMENTOS (6 slides)
├─ O que são engines
├─ Por quê Godot
├─ Exemplos de jogos
├─ Criando projeto
├─ Interface básica
└─ Conceitos fundamentais

BLOCO 3: SETUP (3 slides)
├─ Importando assets
├─ Organização
└─ Assets externos

BLOCO 4: CRIANDO JOGO (10 slides)
├─ Personagem (estrutura)
├─ Scripts (conceito)
├─ Atribuindo script
├─ Animações parte 1
├─ Animações parte 2
├─ PAUSA (5 min) - Inspector
├─ Sistema de tiro parte 1
├─ Sistema de tiro parte 2
├─ Colisões
└─ Grupos

BLOCO 5: INIMIGOS (4 slides)
├─ Criando inimigos
├─ Sistema de vida
├─ Sistema de spawn
└─ PAUSA (10 min)

BLOCO 6: POLISH (6 slides)
├─ Game juice
├─ Efeitos
├─ UI/HUD
├─ Balanceamento
├─ Experimentação livre
└─ REVELAÇÃO

BLOCO 7: ENCERRAMENTO (3 slides)
├─ Recapitulação
├─ Próximos passos
└─ Agradecimento

TOTAL: 33 slides
```