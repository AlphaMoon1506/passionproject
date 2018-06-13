class Map {
  ArrayList<Turret> turretList = new ArrayList<Turret>();
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
  ArrayList<Projectile> projectileList = new ArrayList<Projectile>();
  ArrayList<Rect> rectList = new ArrayList<Rect>();
  boolean shootingMode = false;
  short selection = 3;
  int enemyCount = 1;
  PImage[] tur1 = new PImage[4];
  PImage tur1b, map, mapLight;

  int health = 100, money = 140;
  Map() {
    turretList.add(new TurretRoaming());
    enemyList.add(new Enemy(new PVector(-50, 500), 0));
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
  void loadImages() {
    for (int i = 0; i<4; i++) {
      tur1[i] = requestImage("sprite_turretRoamingHead"+i+".png");
    }
    tur1b = requestImage("turretRoamingBody.png");
    map = requestImage("maplightrework.png");
    mapLight = requestImage("maplight.png");
  }
  void display() {
    fill(100);
    rect(0, 50, width, 100);
    rect(0, 300, width, 100);
    rect(0, 450, width, 100);
    fill (255);
    tint(255, 255);
    image(map, width/2, height/2);
    for (Enemy e : enemyList) e.display();
    for (Projectile p : projectileList) p.display();
    for (Turret t : turretList) t.display();
    tint(255, 100);
    image(mapLight, width/2, height/2);
    fill(200);
    textSize(20);
    text("1. Machine Gun, $50   2. Shotgun, $100", 50, 20);
    textAlign(RIGHT);
    text("Health: " + health + " Money: " + money, width-20, 20);
    textAlign(LEFT);
    fill(80);
    text("Press SPACEBAR to switch to shooting mode", 300, 200);
    textSize(10);
    if (shootingMode) {
      fill(200);
      stroke(200);
      for (Rect r : rectList) {
        if (r.checkCollision(new PVector(mouseX, mouseY))) stroke(200, 00, 00);
      }
      line(mouseX-10, mouseY, mouseX+10, mouseY);
      line(mouseX, mouseY-10, mouseX, mouseY+10);
      stroke(0);
    }
  }
  void update() {
    ///////////////////////////////Main Update/Run Segments///////////////////////
    for (Enemy e : enemyList) {
      e.update();
    }
    for (Turret t : turretList) {
      fill(255);
      t.update();
    }
    for (Projectile p : projectileList) {
      p.update();
    }
    for (int i = 0; i<projectileList.size(); i++) {
      Projectile p = m.projectileList.get(i);
      if (p.checkRemove()) m.projectileList.remove(p);
      for (Rect r : rectList) {
        if (r.checkCollision(p.pos)) m.projectileList.remove(p);
      }
      for (int j = 0; j<enemyList.size(); j++) {
        Enemy e = m.enemyList.get(j);
        if (p.checkHit(e)) {
          e.hp--;
          m.projectileList.remove(p);
        }
      }
    }
    for (int i = 0; i<enemyList.size(); i++) {
      Enemy e = m.enemyList.get(i);
      if (e.hp<1) {
        m.enemyList.remove(e);
        money+=5;
      }
      if (e.pos.x>1000) {
        m.enemyList.remove(e);
        health--;
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
        fill(255, 50, 50, 50);
        noStroke();
        ellipse(mouseX, mouseY, 250, 250);
        stroke(0); 
        if (mousePressed && mouseY > 300 && mouseY < height) {
          boolean no = false;
          for (Rect r : rectList) {
            if (r.placementCheck()) no = true;
          }
          for (Turret t : turretList) {
            if (dist(mouseX, mouseY, t.pos.x, t.pos.y) < 50) no = true;
          }
          if (!no && money>=50) {
            turretList.add(new TurretMachineGun(new PVector(mouseX, mouseY)));
            money-=50;
            m.selection = 3;
          }
        }
      }
      if (m.selection == 1) {
        ellipse(mouseX, mouseY, 10, 10);
        fill(255, 50, 50, 50);
        noStroke();
        ellipse(mouseX, mouseY, 150, 150);
        stroke(0);
        if (mousePressed && mouseY > 300 && mouseY < height) {
          boolean no = false;
          for (Rect r : rectList) {
            if (r.placementCheck()) no = true;
          }
          for (Turret t : turretList) {
            if (dist(mouseX, mouseY, t.pos.x, t.pos.y) < 50) no = true;
          }
          if (!no && money>=100) {
            turretList.add(new TurretShotgun(new PVector(mouseX, mouseY)));
            money-=100;
            m.selection = 3;
          }
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
    if (enemyList.size() < 1) {
      enemyCount+=2;
      for (int i = 0; i<enemyCount; i++) {
        byte sp = (byte)random(0,3);
        if (sp == 0) enemyList.add(new Enemy(new PVector(-100+random(-50, 50), 500+random(-50, 50)), 0));
        else if (sp == 1) enemyList.add(new Enemy(new PVector(-100+random(-50, 50), 100+random(-50, 50)), 2));
        else if (sp == 2) enemyList.add(new Enemy(new PVector(-100+random(-50, 50), 350+random(-50, 50)), 1));
      }
    }
  }
}