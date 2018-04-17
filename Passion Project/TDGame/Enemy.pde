class Enemy {
  PVector pos;
  Enemy(PVector position, byte type) {
    pos = position;
  }
  void display() {
    ellipse(pos, 30, 30);
  }
  void update() {
  }
}