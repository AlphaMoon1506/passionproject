class Enemy {
  PVector pos, vel;
  byte cur;
  PVector[] tar = new PVector[11];
  Enemy(PVector position, byte type) {
    pos = position;
    tar[0] = new PVector(180, 500);
    tar[1] = new PVector(180, 350);
    tar[2] = new PVector(365, 350);
    tar[3] = new PVector(365, 500);
    tar[4] = new PVector(500, 500);
    tar[5] = new PVector(500, 350);
    tar[6] = new PVector(640, 350);
    tar[7] = new PVector(645, 500);
    tar[8] = new PVector(850, 500);
    tar[9] = new PVector(850, 350);
    tar[10] = new PVector(1000, 350);
  }
  void display() {
    fill(50);
    ellipse(pos, 30, 30);
  }
  void update() {
    if (pos.dist(tar[cur]) < 5 && cur<10) cur++;
    vel = PVector.sub(tar[cur], pos);
    vel.normalize();
    vel.setMag(2);
    pos.add(vel);
  }
}