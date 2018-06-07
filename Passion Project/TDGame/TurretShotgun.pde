class TurretShotgun extends Turret {
  TurretShotgun(PVector position) {
    pos = position;
  }
  void update() {
    //Shooting
    Enemy best = null;
    float bestDistance = 100000000;
    for (Enemy e : m.enemyList) {
      if (best == null) {
        best = e;
        bestDistance = dist(pos.x, pos.y, e.pos.x, e.pos.y);    //if best is null, it'll find the closest enemy and set it as best
      } else {
        float d = dist(pos.x, pos.y, e.pos.x, e.pos.y);
        if (d < bestDistance) {                                                              //this constantly looks for the closest target
          best = e;
          bestDistance = d;
        }
      }
    }
    if (best!=null && bestDistance < 150) { 
      angle = best.pos.copy().sub(pos).heading();
      vel = PVector.fromAngle(angle, best.pos.copy());
      vel.normalize();

      lock = true;
    } else {
      lock = false;
    }
    if (lock == true) {
      if (imageIndex <= 3 && frameCount % 15 == 1) imageIndex++;
      if (imageIndex == 1 && frameCount % 15 == 1) {
        m.projectileList.add(new Projectile(pos, vel, angle));
        vel = PVector.fromAngle(angle+random(0.05, 0.1), best.pos.copy());
        vel.normalize();
        m.projectileList.add(new Projectile(pos, vel, angle));
        vel = PVector.fromAngle(angle+random(0.1, 0.2), best.pos.copy());
        vel.normalize();
        m.projectileList.add(new Projectile(pos, vel, angle));
        vel = PVector.fromAngle(angle+random(-0.1, -0.05), best.pos.copy());
        vel.normalize();
        m.projectileList.add(new Projectile(pos, vel, angle));
        vel = PVector.fromAngle(angle+random(-0.2, -0.1), best.pos.copy());
        vel.normalize();
        m.projectileList.add(new Projectile(pos, vel, angle));
      }
    } else if (lock != true && imageIndex>0) imageIndex++;
  }
  void display() {
    if (imageIndex > 3) imageIndex = 0;
    rectMode(CENTER);
    rect(pos, 40, 40);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    image(m.tur1[imageIndex], -2, -2, 201, 201);
    popMatrix();
    rectMode(CORNER);
  }
}