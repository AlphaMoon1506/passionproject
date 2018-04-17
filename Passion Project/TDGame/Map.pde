class Map {
  ArrayList<Turret> turretList = new ArrayList<Turret>();
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
  ArrayList<Projectile> projectileList = new ArrayList<Projectile>();
  ArrayList<Rect> rectList = new ArrayList<Rect>();
  boolean shootingMode = false;
  Map() {
    turretList.add(new TurretRoaming());
    rectList.add(new Rect(0, 0, 1000, 50));
    rectList.add(new Rect(0, 150, 20, 150));
    rectList.add(new Rect(100, 150, 200, 150));
    rectList.add(new Rect(800, 150, 200, 150));
    rectList.add(new Rect(0, 400, 150, 50));
    rectList.add(new Rect(225, 400, 75, 50));
    rectList.add(new Rect(725, 400, 100, 50));
    rectList.add(new Rect(900, 400, 100, 50));
    rectList.add(new Rect(0, 550, 1000, 50));
  }
  void display() {
    fill(100);
    rect(0, 50, width, 100);
    rect(0, 300, width, 100);
    rect(0, 450, width, 100);
  }
  void update() {
    for (Turret t : turretList) {
      fill(255);
      t.update();
      t.display();
    }
    for (Projectile p : projectileList) {
      p.update();
      p.display();
    }
    for (Rect r : rectList) {
      fill(255);
      r.display();
    }
    for (int i = 0; i<projectileList.size(); i++) {
      Projectile p = m.projectileList.get(i);
      if (p.checkRemove()) m.projectileList.remove(p);
      for (Rect r : rectList) {
        if (r.checkCollision(p.pos)) { 
          println("hit"); 
          m.projectileList.remove(p);
        }
      }
    }
    if (keyPressed) {
      if (key == ' ') shootingMode = !shootingMode;
    }
  }
}