class Quad {
  Line l1, l2, l3, l4;
  Quad (Line a, Line b, Line c, Line d) {
    l1 = a;
    l2 = b;
    l3 = c;
    l4 = d;
  }
  boolean contains(PVector r) {
    Float x1 = l1.xCal(r.y);
    float y1 = l1.yCal(r.x);
    return false;
  }
}