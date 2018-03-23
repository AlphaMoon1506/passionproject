class Title {

  Title() {
  }
  void display() {
    background(0);
    fill(50);
    for (int i = 0; i<2; i++) rect(100, i*70+300, 200, 50);
    fill(255);
    textSize(70);
    textAlign(CENTER);
    text("Tunnel Defense", 300, 100);
    textAlign(LEFT);
    textSize(25);
    text("Play", 120, 335);
    text("Exit", 120, 405);
  }
  void update() {
    if (mouseX>100 && mouseX<300) {
      for (int i = 0; i<2; i++) {
        if (mouseY>i*70+300 && mouseY<i*70+350 && mousePressed) {
          if (i == 0) gameState = 1;
          else if (i == 1) exit();
        }
      }
    }
  }
}