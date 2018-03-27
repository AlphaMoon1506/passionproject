class Map {
  ArrayList<Turret> turretList = new ArrayList<Turret>();
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
  }
}