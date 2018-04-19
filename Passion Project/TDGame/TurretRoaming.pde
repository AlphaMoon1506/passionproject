class TurretRoaming extends Turret {
  float velocity = 0;
  TurretRoaming() {
    type = 4;
    pos = new PVector(900, 100, 0);
  }
  void update() {
    // Motion / Aiming
    if (m.shootingMode) angle = (new PVector(mouseX, mouseY).sub(pos.x, pos.y).heading());
    velocity = velocity*0.92;
    if (velocity > -0.005 && velocity < 0.005) velocity = 0;
    if (keyPressed && m.shootingMode) {
      if (key == 'a' || key == 'A' && velocity > -5) velocity-=0.9;
      else if (key == 'd' || key == 'D' && velocity < 5) velocity+=0.9;
    }
    else if (pos.x < 800 && !m.shootingMode) {
      if (velocity < 5) velocity+=0.9;
    }
    pos.x += velocity;
    if (pos.x > width-100) {
      pos.x-=10;
      velocity = velocity*-1;
      velocity = velocity*0.5;
    } else if (pos.x < 300) {
      pos.x+=10;
      velocity = velocity*-1;
      velocity = velocity*0.5;
    }
    // Shooting
    if (mousePressed && m.shootingMode) {
      vel = PVector.fromAngle(angle+random(-0.05,0.05), new PVector(mouseX, mouseY));
      vel.x = vel.x*30;
      vel.y = vel.y*30;
      if (frameCount % 10 == 1)
      m.projectileList.add(new Projectile(pos, vel));
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