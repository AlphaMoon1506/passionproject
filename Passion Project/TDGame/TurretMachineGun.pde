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
    if (best!=null && bestDistance < 200) { 
      angle = best.pos.copy().sub(pos).heading();
      vel = PVector.fromAngle(angle, best.pos.copy());
      vel.normalize();
      lock = true;
    } else {
      lock = false;
    }
    if (lock == true && frameCount % 20 ==  1) m.projectileList.add(new Projectile(pos, vel));
  }
  void display() {
    rectMode(CENTER);
    rect(pos, 40, 40);
    ellipse(pos, 20, 20);
    pushMatrix();
    rectMode(CORNER);
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0, -5, 30, 5);
    popMatrix();
  }
}