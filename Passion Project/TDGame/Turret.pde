abstract class Turret {
  PVector pos, vel;
  byte type;
  int imageIndex;
  float angle;
  boolean lock;
  abstract void display();
  abstract void update();
}