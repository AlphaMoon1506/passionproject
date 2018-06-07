class Projectile {
  PVector pos, vel;
  float a;
  Projectile(PVector position, PVector velocity, float angle) {
    pos = position.copy();
    vel = velocity.copy();
    a = angle;
    vel.setMag(25);
  }
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    stroke(#FFDD52);
    line(-20, 0, 0, 0);
    popMatrix();
    stroke(0);
  }
  void update() {
    pos.add(vel);
   
  }
  boolean checkRemove() {
    if (pos.x > width || pos.x < 0 || pos.y > height || pos.y < 0) return true;
    return false;
  }
  boolean checkHit(Enemy e) {
    if (pos.dist(e.pos) < 12) return true;
    return false; 
  }
}