# The Double Life

> *"Everyone has a side they hide. Some have two lives."*

[![Godot Engine](https://img.shields.io/badge/Godot-4.x-478CBF?logo=godotengine&logoColor=white)](https://godotengine.org)
[![Genre](https://img.shields.io/badge/Genre-Psychological%20Thriller%20%2F%20Mystery%20%2F%20Stealth-red)](#)
[![Format](https://img.shields.io/badge/Format-2D%20Top--Down-brightgreen)](#)

**The Double Life** is a 2D top-down psychological thriller and stealth investigation game developed in **Godot 4**. 

Players step into the shoes of **Julian Vance**, a forensic investigator navigating a precarious double life in the city of **Greyhaven**. By day, Julian assists law enforcement by analyzing crime scenes and reviewing official files. By night, he infiltrates restricted locations to pursue leads the official system cannot—or will not—investigate.

---

## 🎮 Core Gameplay Loop

```
               ┌──────────────────────────────┐
               │         DAY PHASE            │
               │  • Inspect official files    │
               │  • Gather crime scene clues  │
               │  • Interview colleagues      │
               └──────────────┬───────────────┘
                              │
                              ▼
               ┌──────────────────────────────┐
               │      DEDUCTION & JOURNAL     │
               │  • Cross-examine evidence    │
               │  • Identify contradictions   │
               │  • Unlock night leads        │
               └──────────────┬───────────────┘
                              │
                              ▼
               ┌──────────────────────────────┐
               │        NIGHT PHASE           │
               │  • Infiltrate restricted areas│
               │  • Sneak past security       │
               │  • Manage suspicion meter    │
               └──────────────────────────────┘
```

1. **Investigate (Day)**: Explore official spaces like the Greyhaven Police Department and crime scenes. Examine physical evidence, read case files, and gather statements.
2. **Deduce (Journal)**: Link clues in your notebook. Finding discrepancies (e.g., timeline mismatches) unlocks clandestine night leads.
3. **Infiltrate (Night)**: Sneak into off-limits warehouses and corporate offices after hours to uncover suppressed evidence while keeping your suspicion meter low.

---

## 🕹️ Controls

| Action | Primary Key | Secondary / Alternative |
| :--- | :--- | :--- |
| **Move Up** | <kbd>W</kbd> | <kbd>↑</kbd> |
| **Move Left** | <kbd>A</kbd> | <kbd>←</kbd> |
| **Move Down** | <kbd>S</kbd> | <kbd>↓</kbd> |
| **Move Right** | <kbd>D</kbd> | <kbd>→</kbd> |
| **Interact / Inspect** | <kbd>E</kbd> | — |
| **Sneak / Walk Quietly** | <kbd>Shift</kbd> | — |
| **Case Journal** | <kbd>J</kbd> | — |
| **Cancel / Close Dialog** | <kbd>Esc</kbd> | — |

---

## 📂 Project Architecture

```
the-double-life/
├── project.godot            # Engine settings, input mappings, and autoload singletons
├── scenes/                  # Game scenes organized by domain
│   ├── ui/                  # Main Menu, Loading Screen, Intro, Greyhaven City Map
│   ├── characters/          # Player scene, collision, and animation frames
│   └── levels/              # Police Department, Crime Scenes, and Warehouses
├── scripts/                 # Modular GDScript architecture
│   ├── characters/          # Player movement, animation, and stealth controllers
│   ├── systems/             # GameManager (singleton state, clues, suspicion) & Interactables
│   └── ui/                  # UI logic, map interactions, and dialogue handlers
├── data/                    # External data files
│   └── case_01_clues.json   # Clues, evidence sources, and deduction links
└── assets/                  # Raw and imported game resources
    ├── audio/               # Voiceovers, ambient rain, and atmospheric music
    ├── buildings/           # Exterior illustrations (City Hall, Tower, Museum, etc.)
    ├── characters/          # Character portraits and Julian sprite sheets
    ├── maps/                # Greyhaven district maps
    ├── tiles/ & tilesets/   # Isometric and top-down environment tilesets
    └── ui/                  # Dialogue boxes, timers, fonts, and icons
```

---

## 🚀 Getting Started

### Prerequisites
- **[Godot Engine 4.x](https://godotengine.org/download)** (version 4.2+ recommended)

### Running the Project
1. **Clone the repository**:
   ```bash
   git clone https://github.com/SarthakPatil18/DoubleLife.git
   cd DoubleLife
   ```
2. **Launch Godot Engine**:
   - Click **Import**.
   - Browse to `the-double-life/project.godot` and select **Open**.
   - Click **Import & Edit**.
3. **Play**:
   - Press <kbd>F5</kbd> (or the **Play** button in the top-right corner) to run the game from the loading screen.

---

## 🛠️ Built With

- **Engine**: [Godot 4](https://godotengine.org/)
- **Language**: GDScript 2.0
- **Renderer**: Forward+ / Compatibility 2D
- **Fonts**: JetBrains Mono & JetBrains Sans

---

## 📜 License & Acknowledgments

This project is an original independent game prototype created by **Sarthak Patil**. All rights reserved.
