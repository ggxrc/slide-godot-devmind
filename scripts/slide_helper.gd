@tool
extends EditorScript

## Script auxiliar para desenvolvimento dos slides
## Execute em: File → Run (Ctrl+Shift+X)

func _run():
	print("=== SLIDE HELPER ===")
	print("")
	
	# Verificar estrutura do projeto
	check_project_structure()
	
	# Listar slides existentes
	list_existing_slides()
	
	# Sugestões
	print_suggestions()
	
	print("")
	print("=== FIM ===")

func check_project_structure():
	print("📁 Verificando Estrutura do Projeto:")
	
	var folders = [
		"res://scenes/",
		"res://scenes/slides/",
		"res://scripts/",
		"res://scripts/slides/",
		"res://assets/sprites/",
		"res://assets/fonts/",
		"res://assets/sounds/"
	]
	
	for folder in folders:
		if DirAccess.dir_exists_absolute(folder):
			print("  ✅ " + folder)
		else:
			print("  ❌ " + folder + " (não encontrada)")

func list_existing_slides():
	print("")
	print("🎬 Slides Existentes:")
	
	var dir = DirAccess.open("res://scenes/slides/")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var count = 0
		
		while file_name != "":
			if not dir.current_is_dir() and file_name.ends_with(".tscn"):
				print("  ✅ " + file_name)
				count += 1
			file_name = dir.get_next()
		
		print("")
		print("  Total: %d slides" % count)
	else:
		print("  ❌ Não foi possível abrir pasta de slides")

func print_suggestions():
	print("")
	print("💡 Próximos Passos Sugeridos:")
	print("  1. Adicione assets em assets/sprites/")
	print("  2. Crie slides faltantes duplicando SlideTemplate.tscn")
	print("  3. Registre novos slides em scripts/SlideManager.gd")
	print("  4. Teste com F5")
	print("")
	print("📖 Consulte TUTORIAL_ADICIONAR_SLIDES.md para mais detalhes")
