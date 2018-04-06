abstract class Turret {
  PVector pos, vel;
  byte type;
  float angle;
  boolean lock;
  abstract void display();
  abstract void update();
}