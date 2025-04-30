class Card {
  float x, y, width, height;
  Item item;
  boolean flipped;

  Card(float x, float y, float width, float height, Item item) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.item = item;
  }

void display() {
  if (flipped) {
    image(loadImage(item.image), x, y, width, height);
  } else {
    PImage backImage = loadImage("Background.jpg");
    image(backImage, x, y, width, height);
  }
}
  void flip() {
    flipped = !flipped;
  }
  boolean isFlipped() {
    return flipped;
  }
    void flipBack() {
    flipped = false;
  }
  boolean isMouseInside(float mouseX, float mouseY) {
    return mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height;
  }
  boolean matches(Card other) {
    return this.item.name.equals(other.item.name);
  }
}
