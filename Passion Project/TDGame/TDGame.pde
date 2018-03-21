Title t = new Title();
byte gameState = 0;
void setup() {
  size(1000, 600);
}
void draw() {
  if (gameState == 0) {
    t.display();
  }
}