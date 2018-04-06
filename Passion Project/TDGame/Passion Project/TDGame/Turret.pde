abstract class Turret {
  PVector pos, vel;
  byte type;
  float angle;
  abstract void display();
  abstract void update();
}