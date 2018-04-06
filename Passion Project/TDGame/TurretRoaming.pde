class TurretRoaming extends Turret {
  float vel = 0;
  TurretRoaming() {
    type = 4;
    pos = new PVector(900, 100, 0);
  }
  void update() {
    angle = (new PVector(mouseX, mouseY).sub(pos.x, pos.y).heading());
    println(angle);
    if (keyPressed) {
      if (key == 'a' || key == 'A' && vel > -5) vel-=0.9;
      else if (key == 'd' || key == 'D' && vel < 5) vel+=0.9;
    }
    if (vel > 0) vel-=0.5;
    else if (vel < 0) vel+=0.5;
    pos.x += vel;
    if (pos.x > width-50) {
      pos.x-=10;
      vel = vel*-1;
      vel = vel/50;
    } else if (pos.x < 200) {
      pos.x+=10;
      vel = vel*-1;
      vel = vel/50;
    }
  }
  void display() {
    rectMode(CENTER);
    rect(pos, 100, 60);
    ellipse(pos, 50, 50);
    pushMatrix();
    rectMode(CORNER);
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0, -5, 40, 10);
    popMatrix();
  }
}