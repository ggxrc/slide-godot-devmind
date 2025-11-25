# Copilot Instructions

## Project Snapshot
- Slides are full Godot scenes; `scenes/Main.tscn` loads `SlideManager.gd`, a root `SlideContainer`, and overlays UI such as `UI/SlideCounter`.
- Godot 4.2+ is required; run `Main.tscn` (F5) inside the editor for the full presentation, or `SlideTemplate.tscn`/individual slides for focused testing.
- Input relies on default `ui_left/right/page_down/page_up/home/end` actions, so avoid renaming those without updating the project settings.

## Architecture & Conventions
- `SlideManager.gd` is the navigation brain: it keeps an explicit `slide_scenes` array and swaps scenes inside `Main/SlideContainer` with simple fade tweens. Always register new slides here in the correct order.
- Slides follow the naming pattern `scenes/slides/slide_##_slug.tscn` with matching scripts (if needed) in `scripts/slides/Slide##.gd`; keep numbering zero-padded (e.g., `slide_05_exemplos_jogos`).
- Each slide usually inherits from `SlideTemplate.tscn` / `BaseSlide.gd`, giving access to `setup_slide()`, `title_label`, and `ContentContainer`. Override `setup_slide()` instead of `_ready()` when possible.
- Slide scripts frequently use `@onready var path = $"../..."` to grab controls relative to the template hierarchy. Preserve node names (`MarginContainer/VBoxContainer/...`) when editing layouts so those lookups remain valid.
- Shared style constants live in `GlobalConfig.gd` (colors, font sizes, default transition times). Reuse these instead of hardcoding new values to keep a consistent visual identity.

## Assets & Scene Structure
- Assets live under `assets/` (`sprites`, `fonts`, `sounds`); Godot `.import` files are committed, so keep new sources beside their `.import` companions.
- `SlideTemplate.tscn` uses a margin of 80/60 px around content; large custom layouts should still fit within that safe area to avoid viewport clipping on projectors.
- When adding interactive pieces, prefer lightweight nodes (Labels, Buttons, TextureRects) and keep logic in `scripts/slides` to avoid bloating the template itself.

## Tooling & Workflows
- Use `scripts/slide_helper.gd` (`@tool` EditorScript) via Godot’s `File → Run` to verify folder structure, list available slides, and get quick next-step hints—helpful before demos.
- No automated tests exist; validation is by running scenes. When debugging transitions, enable Godot’s Remote Scene Tree and inspect `SlideContainer` contents to ensure proper cleanup.
- Keep commits scoped to slide numbers (e.g., “slide_14: add animation demo”) so future presenters can locate relevant assets quickly.

## Common Pitfalls
- Forgetting to clear `SlideManager.slide_scenes` when renaming/removing slides causes runtime `load()` errors; watch the editor output for `push_error` from `load_slide`.
- Missing nodes (e.g., deleting `UI/SlideCounter`) break `SlideManager.update_slide_counter()`. Either keep the node or guard the code before removing UI pieces.
- Scene files assume ASCII-only labels except where emoji demonstrate effects (see `Slide14.gd` frames). If adding new Unicode characters, ensure the chosen font supports them.
