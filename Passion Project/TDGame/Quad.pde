class Quad { //DEPRECATED CODE
  Line l1, l2, l3, l4;
  Quad (Line a, Line b, Line c, Line d) {
    l1 = a;
    l2 = b;
    l3 = c;
    l4 = d;
  }
  void display() {
    PVector a = intersection(l1, l2);
    PVector b = intersection(l2, l3);
    PVector c = intersection(l3, l4);
    PVector d = intersection(l4, l1);
    fill(255);
    println("A " + a + " B " + b + " C " + c + " D " + d);
    quad(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
  }
  boolean contains(PVector r) {
    Float x1 = l1.xCal(r.y);
    Float y1 = l1.yCal(r.x);

    Float x2 = l2.xCal(r.y);
    Float y2 = l2.yCal(r.x);

    Float x3 = l3.xCal(r.y);
    Float y3 = l3.yCal(r.x);

    Float x4 = l4.xCal(r.y);
    Float y4 = l4.yCal(r.x);

    Float xmin = x1, xmax = x1, ymin = y1, ymax = y1;
    if (xmin == null || x2<xmin) xmin = x2;
    if (xmin == null || x3<xmin) xmin = x3;
    if (xmin == null || x4<xmin) xmin = x4;

    if (xmax == null || x2>xmax) xmax = x2;
    if (xmax == null || x3>xmax) xmax = x3;
    if (xmax == null || x4>xmax) xmax = x4;

    if (ymin == null || y2<xmin) ymin = y2;
    if (ymin == null || y3<xmin) ymin = y3;
    if (ymin == null || y4<xmin) ymin = y4;

    if (ymax == null || y2>xmax) ymax = y2;
    if (ymax == null || y3>xmax) ymax = y3;
    if (ymax == null || y4>xmax) ymax = y4;

    if (xmin == null || xmax == null || ymin == null || ymax == null) return false;
    return (xmax>r.x && xmin<r.x && ymax>r.y && ymin<r.y);
  }
}

Quad getQuad(PVector a, PVector b, PVector c, PVector d) {
  println("A " + a + " B " + b + " C " + c + " D " + d);
  Line ab = getLine(a, b);
  Line bc = getLine(b, c);
  Line cd = getLine(c, d);
  Line da = getLine(d, a);
  println("AB " + ab.m + " BC " + bc.m + " CD " + cd.m + " DA " + da.m);
  return new Quad(ab, bc, cd, da);
}