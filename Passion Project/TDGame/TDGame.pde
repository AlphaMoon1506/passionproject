Title t = new Title();
Map m = new Map();
byte gameState = 0;
void setup() {
  size(1000, 600);
}
void draw() {
  background(0);
  if (gameState == 0) {
    t.update();
    t.display();
  }
}