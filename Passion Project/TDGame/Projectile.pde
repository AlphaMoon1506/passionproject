class Projectile {
  PVector pos, vel;
  float a;
  Projectile(PVector position, PVector velocity, float angle) {
    pos = position.copy();
    vel = velocity.copy();
    a = angle;
    vel.setMag(35);
  }
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    strokeWeight(2);
    stroke(#E3C00E);
    line(-20, 0, 0, 0);
    stroke(#FFDD52);
    strokeWeight(3);
    line(0, 0, 15, 0);
    popMatrix();
    stroke(0);
    strokeWeight(1);
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