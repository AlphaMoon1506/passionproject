class Projectile {
  PVector pos, vel;
  Projectile(PVector position, PVector velocity) {
    pos = position.copy();
    vel = velocity.copy();
  }
  void display() {
    ellipse(pos, 10, 10);
  }
  void update() {
    pos.add(vel);
  }
}