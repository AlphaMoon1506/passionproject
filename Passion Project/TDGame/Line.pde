class Line {
  PVector r0, m;
  Line(PVector a, PVector b) {
    r0 = a.copy();
    m = b.copy();
  }
  Float yCal(float x) {
    if (m.x==0) return null;
    float t = (x-r0.x)/m.x;
    float y = r0.y+(m.y*t);
    return y;
  }
  Float xCal(float y) {
    if (m.y==0) return null;
    float t = (y-r0.x)/m.x;
    println("t " + t);
    println(m.x);
    float x = r0.y+(m.y*t);
    return x;
  }
  String toString() {
    return r0 + "+t" + m;
  }
}

Line getLine(PVector a, PVector b) {
  PVector m = a.sub(b);
  println("M " + m);
  return new Line(a, m);
}
PVector intersection(Line l1, Line l2) {
  println(l1); println(l2);
  if ((l2.m.x - l1.m.x) == 0) return null; //TEMP
  Float t = (l1.m.x*(l2.r0.y-l1.r0.x)-l1.m.y*(l2.r0.x-l1.r0.y)) / ((l1.m.y*l2.m.x)-(l1.m.x*l2.m.y));
  Float x = (l1.r0.x + (t*l1.m.x));
  Float y = (l1.r0.y + (t*l1.m.y));
  return new PVector(x, y);
}