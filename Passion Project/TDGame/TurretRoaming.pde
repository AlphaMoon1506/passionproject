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
    } else if (pos.x < 800 && !m.shootingMode) {
      if (velocity < 5) velocity+=0.9;
    }
    pos.x += velocity;
    if (pos.x > width-100) {
      pos.x-=10;
      velocity = velocity*-1;
      velocity = velocity*0.5;
    } else if (pos.x < 250) {
      pos.x+=10;
      velocity = velocity*-1;
      velocity = velocity*0.5;
    }
    if (imageIndex != 0 && !mousePressed) imageIndex++;
    // Shooting
    if (mousePressed && m.shootingMode) {
      if (imageIndex <= 3 && frameCount % 3 == 1) imageIndex++;
      vel = PVector.fromAngle(angle+random(-0.05, 0.05), new PVector(mouseX, mouseY));
      vel.normalize();
      if (imageIndex == 1 && frameCount % 3 == 1) m.projectileList.add(new Projectile(pos, vel, angle));
    }
  }
  void display() {
    if (imageIndex > 3) imageIndex = 0;
    fill(255);
    pushMatrix();
    translate(pos.x, pos.y);
    image(m.tur1b, -10, -1);
    rotate(angle);
    image(m.tur1[imageIndex], -2, -2, 201, 201);
    popMatrix();
  }
}