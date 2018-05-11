class Enemy {
  PVector pos, vel;
  byte cur;
  int hp;
  PVector[] tar = new PVector[11];
  Enemy(PVector position, byte type) {
    hp = 5;
    pos = position;
    tar[0] = new PVector(180+random(-10,10), 500+random(-10,10));
    tar[1] = new PVector(180, 350);
    tar[2] = new PVector(365+random(-10,10), 350+random(-10,10));
    tar[3] = new PVector(365+random(-10,10), 500+random(-10,10));
    tar[4] = new PVector(500+random(-10,10), 500+random(-10,10));
    tar[5] = new PVector(500+random(-10,10), 350+random(-10,10));
    tar[6] = new PVector(640+random(-10,10), 350+random(-10,10));
    tar[7] = new PVector(645+random(-10,10), 500+random(-10,10));
    tar[8] = new PVector(850+random(-10,10), 500+random(-10,10));
    tar[9] = new PVector(850, 350);
    tar[10] = new PVector(1100+random(-10,10), 350+random(-10,10));
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