class Map {
  ArrayList<Turret> turretList = new ArrayList<Turret>();
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
  ArrayList<Projectile> projectileList = new ArrayList<Projectile>();
  Map() {
    turretList.add(new TurretRoaming());
  }
  void display() {
  }
  void update() {
    for (Turret t : turretList) {
      t.update();
      t.display();
    }
    for (Projectile p : projectileList) {
      p.update();
      p.display();
    }
  }
}