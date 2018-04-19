class Rect {
  PVector pos = new PVector(0, 0);
  PVector size = new PVector(0, 0);
  Rect(int x, int y, int w, int h) {
    pos.x = x;
    pos.y = y;
    size.x = w;
    size.y = h;
  }
  void display() {
    rect(pos.x, pos.y, size.x, size.y);
  }
  boolean checkCollision(PVector p) {
    if (p.x > pos.x && p.x < (pos.x+size.x) && p.y > pos.y && p.y < (pos.y+size.y)) return true;
    return false;
  }
  boolean placementCheck() {
    if ((mouseX+20) > pos.x && (mouseX-20) < (pos.x+size.x) && (mouseY+20) > pos.y && (mouseY-20) < (pos.y+size.y)) return true;
    return false;
  }
}