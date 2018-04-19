Title t = new Title();
Map m = new Map();
byte gameState = 0;
boolean msRls = false;
void setup() {
  size(1000, 600);
}
void draw() {
  background(0);
  if (gameState == 0) {
    t.update();
    t.display();
  } else if (gameState == 1) {
    m.display();
    m.update();
  }
}
void ellipse(PVector p, int w, int h) {
  ellipse(p.x, p.y, w, h);
}
void rect(PVector p, int w, int h) {
  rect(p.x, p.y, w, h);
}
void mousePressed() {
  msRls = false;
}
void mouseReleased() {
  msRls = true;
}