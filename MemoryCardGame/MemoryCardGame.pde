int score = 0 ;
int maxMove = 15 ; 
ArrayList<Card> cards = new ArrayList<Card>();
Card firstCard = null;
Card secondCard = null;
int flipBackDelay = 1000;
int flipBackTime = -1; 
int movesCount = 0;
int winCount = 0;
PFont font;

void setup() {
  size(800, 800);
  generateCards();
}
void generateCards() {
  ArrayList<Item> items = new ArrayList<Item>();
  items.add(new Item("Gambar0", "Gambar0.jpg"));
  items.add(new Item("Gambar1", "Gambar1.jpg"));
  items.add(new Item("Gambar2", "Gambar2.jpg"));
  items.add(new Item("Gambar3", "Gambar3.jpg"));
  items.add(new Item("Gambar4", "Gambar4.jpg"));
  items.add(new Item("Gambar5", "Gambar5.jpg"));
  items.add(new Item("Gambar6", "Gambar6.jpg"));
  items.add(new Item("Gambar7", "Gambar7.jpg"));

  ArrayList<Item> cardValues = generateRandom(items);
  cardValues.addAll(cardValues);
  shuffleArray(cardValues);

  int cols = 4;
  float cardWidth = 200;
  float cardHeight = 200;
  
  for (int i = 0; i < cardValues.size(); i++) {
    int col = i % cols;
    int row = floor(i / cols);
    float x = col * cardWidth;
    float y = row * cardHeight;    
    cards.add(new Card(x, y, cardWidth, cardHeight, cardValues.get(i)));
  }
}
void draw() {
  background(255);
  displayCards();
  if (flipBackTime > 0 && millis() > flipBackTime) {
    firstCard.flipBack();
    secondCard.flipBack();
    firstCard = null;
    secondCard = null;
    flipBackTime = -1; // Reset waktu flipback
  }
  fill(0);
  textSize(24);
  textAlign(LEFT);
  text("Moves : " + movesCount , 20 , height - 40);
  text("Score : " + score , 20 , height - 20);
  
  if (movesCount >= maxMove){
    gameOver();
    
}
}
void gameOver() {
  fill(255, 0, 0); // Set text color to red
  textSize(32);
  textAlign(CENTER, CENTER);
  text("You Lose! Your score : " + score, width / 2, height / 2);
  resetGame();
}
void resetGame() {
  score = 0;
  movesCount = 0;
  winCount = 0;
  generateCards();
}

void mousePressed() {
  checkCardClick(mouseX, mouseY);
}


ArrayList<Item> generateRandom(ArrayList<Item> items) {
  ArrayList<Item> tempArray = new ArrayList<Item>(items);
  ArrayList<Item> resultArray = new ArrayList<Item>();
  while (!tempArray.isEmpty()) {
    int randomIndex = floor(random(tempArray.size()));
    Item selectedItem = tempArray.remove(randomIndex);
    resultArray.add(selectedItem);
  }
  return resultArray;
}

void shuffleArray(ArrayList<Item> array) {
  for (int i = array.size() - 1; i > 0; i--) {
    int j = floor(random(i + 1));
    Item temp = array.get(i);
    array.set(i, array.get(j));
    array.set(j, temp);
  }
}
void displayCards() {
  for (Card card : cards) {
    card.display();
  }
  if (winCount == cards.size() / 2) {
    font = createFont("Arial" , 20 , true);
    fill(200
    );
    textSize(32);
    textAlign(CENTER, CENTER);
    text("You Win!", width / 2, height / 2);
    
  }
}
void checkCardClick(float mouseX, float mouseY) {
  for (Card card : cards) {
    if (card.isMouseInside(mouseX, mouseY) && !card.isFlipped() && (firstCard == null || secondCard == null)) {
      card.flip();
      if (firstCard == null) {
        firstCard = card;
      } else {
        secondCard = card;
        movesCount++;
        if (firstCard.matches(secondCard)) {
          winCount++;
          firstCard = null;
          secondCard = null;
          score++;
        } else {
          flipBackTime = millis() + flipBackDelay;
        }
      }
    }
  }
}
