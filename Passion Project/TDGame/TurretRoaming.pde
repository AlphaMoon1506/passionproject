class TurretRoaming extends Turret {
  TurretRoaming() {
    type = 4;
    pos = new PVector(900, 100, 0);
  }
  void update() {
    angle = (new PVector(mouseX, mouseY).sub(pos.x, pos.y).heading());
    println(angle);
    if (keyPressed) {
      if (key == 'a' || key == 'A') pos.x-=5;
      else if (key == 'd' || key == 'D') pos.x+=5;
    }
  }
  void display() {
    ellipse(pos, 50, 50);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0,-5, 40, 10);
    popMatrix();
  }
}