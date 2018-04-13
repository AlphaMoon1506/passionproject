class Map {
  ArrayList<Turret> turretList = new ArrayList<Turret>();
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
  ArrayList<Projectile> projectileList = new ArrayList<Projectile>();
  ArrayList<Quad> quadList = new ArrayList<Quad>();

  boolean shootingMode = false;
  Map() {
    turretList.add(new TurretRoaming());
    quadList.add(getQuad(new PVector(10, 10), new PVector(10, 500), new PVector(600, 500), new PVector(500, 10)));
  }
  void display() {
    fill(100);
    rect(0, 50, width, 100);
    rect(0, 300, width, 100);
    rect(0, 450, width, 100);
  }
  void update() {
    for (Quad q : quadList) {
      q.display();
      println("quad");
    }
    for (Turret t : turretList) {
      t.update();
      t.display();
    }
    for (Projectile p : projectileList) {
      p.update();
      p.display();
    }
    for (int i = 0; i<projectileList.size(); i++) {
      Projectile p = m.projectileList.get(i);
      if (p.checkRemove()) m.projectileList.remove(p);
    }
    if (keyPressed) {
      if (key == ' ') shootingMode = !shootingMode;
      println(shootingMode);
    }
  }
}