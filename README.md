# Memory Card Game

**Overview**

This is a **Memory Card Game** developed using **Processing**, a *Java-based* programming environment. The game is built with **Object-Oriented Programming (OOP)** principles in C++-like syntax (via Processing's PDE files). The objective is to match pairs of cards within a limited number of moves, testing the player's memory skills. The game features a 4x4 grid of cards, scoring, move tracking, and win/lose conditions.

## Features

- **Gameplay**: Players flip two cards at a time to find matching pairs. Matches increase the score, while non-matches flip back after a delay.
- **Move Limit**: Players have a maximum of *15 moves* to find all pairs.
- **Win/Lose Conditions**: Win by matching all pairs; lose if the move limit is exceeded.
- **Visuals**: Cards display images when flipped, with a default background image when unflipped.
- **Score and Moves Tracking**: Displays the current score and moves taken.
- **Reset Functionality**: Automatically resets the game after a win or loss.

## OOP Components

The project leverages OOP principles, including:

### 1. **Classes and Objects**

- `Card` **Class**:
  - **Attributes**: `x`, `y` (position), `width`, `height` (size), `item` (associated `Item` object), `flipped` (state).
  - **Methods**:
    - `display()`: Renders the card (image if flipped, background if not).
    - `flip()`: Toggles the card's flipped state.
    - `isFlipped()`: Checks if the card is flipped.
    - `flipBack()`: Resets the card to unflipped.
    - `isMouseInside()`: Detects if the mouse is within the card's bounds.
    - `matches()`: Compares the card's item with another card's item.
  - **Purpose**: Represents individual cards on the grid, encapsulating their state and behavior.

- `Item` **Class**:
  - **Attributes**: `name` (identifier), `image` (file path to the card's image).
  - **Purpose**: Stores data for card content (name and image), used to determine matches.

### 2. **Encapsulation**

- The `Card` and `Item` classes bundle data (attributes) and behavior (methods) together.
- Access to attributes is controlled within the class (e.g., `flipped` is modified only via `flip()` or `flipBack()`).

### 3. **Abstraction**

- The `Card` class abstracts the complexity of card behavior (flipping, displaying, matching) into simple method calls.
- The `Item` class abstracts the card's content into a reusable structure.

### 4. **Modularity**

- The code is organized into classes and functions, making it easier to modify or extend (e.g., adding new card types or game modes).

## Code Explanation

### Key Functions

- `setup()`: Initializes the game window (*800x800 pixels*) and calls `generateCards()` to create the card grid.
- `generateCards()`:
  - Creates a list of `Item` objects (each with a name and image).
  - Randomly selects and duplicates items to create pairs.
  - Shuffles the pairs and arranges them in a *4x4 grid* of `Card` objects.
- `draw()`:
  - Updates the game state and renders the UI.
  - Displays cards, score, and move count.
  - Handles card flip-back after a delay if cards don't match.
  - Checks for game-over (move limit reached) or win conditions.
- `mousePressed()`: Detects mouse clicks and triggers `checkCardClick()` to flip cards.
- `checkCardClick()`:
  - Identifies which card was clicked.
  - Flips the card if it's not already flipped and if fewer than two cards are currently flipped.
  - Handles matching logic: increments score and `winCount` for matches, or sets a flip-back delay for non-matches.
- `gameOver()`: Displays a *"You Lose"* message and resets the game.
- `resetGame()`: Resets score, moves, and win count, and regenerates the card grid.
- `generateRandom()` **and** `shuffleArray()`: Utility functions to randomize and shuffle the card items.
- `displayCards()`: Renders all cards and displays a *"You Win"* message if all pairs are matched.

### Game Logic

- Cards are stored in an `ArrayList<Card>` and displayed in a *4x4 grid*.
- Players click to flip cards, with a maximum of *two cards* flipped at a time.
- If the cards match (same `Item` name), they remain flipped, and the score and `winCount` increase.
- If they don't match, they flip back after a *1-second delay* (`flipBackDelay`).
- The game ends when:
  - All pairs are matched (`winCount == cards.size() / 2`), displaying *"You Win!"*
  - The move limit (`maxMove = 15`) is reached, displaying *"You Lose!"* and resetting the game.

## Requirements

- **Processing**: Install the Processing IDE (version *3 or higher* recommended).
- **Assets**: Ensure image files (`Gambar0.jpg` to `Gambar7.jpg` and `Background.jpg`) are in the project's `data` folder.
- **Fonts**: Uses the *"Arial"* font for text display.

## How to Run

1. Clone the repository: [Memory Card Game](https://github.com/delima1234-Sunbright/Socket-Programming_Skincare-Programming-/blob/main/MemoryCardGame).
2. Open the `.pde` file in the Processing IDE.
3. Ensure the required image files are in the `data` folder of the sketch.
4. Click the **Run** button in Processing to start the game.

## Gameplay Instructions

- Click on a card to flip it and reveal its image.
- Click a second card to attempt a match.
- If the cards match, they stay flipped, and your score increases.
- If they don't match, they flip back after a short delay.
- You have *15 moves* to find all *8 pairs*.
- Win by matching all pairs; lose if you exceed the move limit.
