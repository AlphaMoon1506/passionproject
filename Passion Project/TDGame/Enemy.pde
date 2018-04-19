class Enemy {
  PVector pos, vel;
  PVector[] tar = new PVector[1];
  Enemy(PVector position, byte type) {
    pos = position;
    tar[0] = new PVector(1000, 400);
  }
  void display() {
    fill(50);
    ellipse(pos, 30, 30);
  }
  void update() {
    vel = PVector.sub(tar[0], pos);
    vel.normalize();
    vel.setMag(2);
    pos.add(vel);
  }
}