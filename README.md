# Merienda Software Libre

This repository contains everything needed to create the presentation using Marp (Markdown Presentation Ecosystem).

## 📁 Repository Structure
```
├── imgs/             # Images and other media files
├── rose-pine.css     # Custom CSS theme
├── slices.md         # Slices
├── flake.nix         # Nix flake configuration
└── flake.lock        # Nix flake lock file
```
## 🚀 Quick Start

### Using VS Code + Marp Extension

1. Install [Visual Studio Code](https://code.visualstudio.com/)
2. Install the [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) extension
3. Open any `.md` file
4. Click the "Open Preview to the Side" button or use `Ctrl+K V`

### Using Nix Flakes (Alternative)

If you have Nix with flakes enabled:

```bash
# Enter development shell
nix develop

# Build the presentation while working on
marp --theme rose-pine.css slides.md --watch 
```
