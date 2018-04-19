class Map {
  ArrayList<Turret> turretList = new ArrayList<Turret>();
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
  ArrayList<Projectile> projectileList = new ArrayList<Projectile>();
  ArrayList<Rect> rectList = new ArrayList<Rect>();
  boolean shootingMode = false;
  short selection = 3;
  Map() {
    turretList.add(new TurretRoaming());
    enemyList.add(new Enemy(new PVector(-100, 10), byte(1)));
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
    for (Rect r : rectList) {
      fill(150);
      r.display();
    }
    fill(200);
    rect(5, 5, 100, 40);
    rect(110, 5, 100, 40);
  }
  void update() {
    ///////////////////////////////Main Update/Run Segments///////////////////////
    for (Enemy e : enemyList) {
      e.update();
      e.display();
    }
    for (Turret t : turretList) {
      fill(255);
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
      for (Rect r : rectList) {
        if (r.checkCollision(p.pos)) m.projectileList.remove(p);
      }
    }
    //////////////////////////////////////////////////////////////////////////////
    if (!shootingMode) {
      if (keyPressed) {
        if (key == '1') m.selection = 0;
        else if (key == '2') m.selection = 1;
        else if (key == '3') m.selection = 2;
      }
      println(m.selection);
      if (m.selection == 0) {
        ellipse(mouseX, mouseY, 10, 10);
        if (mousePressed && mouseX > 0 && mouseX < width && mouseY > 300 && mouseY < height) {
          boolean no = false;
          for (Rect r : rectList) {
            if (r.placementCheck()) no = true;
          }
          if (!no) turretList.add(new TurretMachineGun(new PVector(mouseX, mouseY)));
        }
      }
    }
    //////////////////////////////////////////////////////////////
    if (keyPressed) {
      if (key == ' ') {
        shootingMode = !shootingMode;
        if (!shootingMode) m.selection = 3;
      }
    }
    //////////////////////////////////////////////////////////////
  }
}