class TurretMachineGun extends Turret {
  TurretMachineGun(PVector position) {
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
    if (best!=null && bestDistance < 250) { 
      angle = best.pos.copy().sub(pos).heading();
      vel = PVector.fromAngle(angle, best.pos.copy());
      vel.x = vel.x * 50;                                            //this calculates velocity and trajectory for the bullets, as well as rotation for the turret
      vel.y = vel.y * 50;
      lock = true;
    } else {
      lock = false;
    }
    if (mousePressed && lock == true) {
      m.projectileList.add(new Projectile(pos, vel));            //every time the cannon is at image zero and the lock is true, it will fire a shell
    }
  }
  void display() {
    rectMode(CENTER);
    rect(pos, 50, 50);
    ellipse(pos, 50, 50);
    pushMatrix();
    rectMode(CORNER);
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0, -5, 40, 10);
    popMatrix();
  }
}