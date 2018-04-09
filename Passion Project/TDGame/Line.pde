class Line {
  PVector r0, m;
  Line(PVector a, PVector b) {
    r0 = a;
    m = b;
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
    float x = r0.y+(m.y*t);
    return x;
  }
}

Line getLine(PVector a, PVector b) {
  PVector m = a.sub(b);
  return new Line(a, m);
}