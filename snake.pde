//snake
int posx = 200;
int posy = 200;
int mov = 0;

//manzana
 int posmx;
 int posmy;

//posman
int mx[] = {0, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300, 320, 340, 360, 380};
int my[] = {0, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300, 320, 340, 360, 380};

void setup() {
  size(400, 400);
}

void snake() {
  frameRate(10);
  fill(0, 0, 255);
  rect(posx, posy, 20, 20);
  movimiento();
}

void keyPressed() {
  if (keyCode == RIGHT) {
    mov = 1;
  }
  if (keyCode == DOWN) {
    mov = 2;
  }
  if (keyCode == LEFT) {
    mov = 3;
  }
  if (keyCode == UP) {
    mov = 4;
  }
}

void movimiento() {
  if (mov == 1) {
    posx += 20;
  } else if (mov == 2) {
    posy += 20;
  } else if (mov == 3) {
    posx -= 20;
  } else if (mov == 4) {
    posy -= 20;
  }
}

void borders() {
  if (posx >= 400) {
    posx = 0;
  }
  if (posx <= -20) {
    posx = 380;
  }
  if (posy >= 400) {
    posy = 0;
  }
  if (posy < -20) {
    posy = 380;
  }
}

int posmx() {
  int i = (int) random(1, 19);
  posmx = mx[i];
  return posmx;
}

int posmy() {
  int j = (int) random(1, 19);
  posmy = mx[j];
  return posmy;
}


void manzana() {
  posmx();
  posmy();
  fill(255, 0, 0);
  rect(posmx, posmy, 20, 20);
}

void eat() {
  /*manzana();
  if (posmx == posx && posmy == posy) {
    manzana();
  }*/
  
  
  
}


void grilla() {
  int gx = 0;
  int gy = 0;
  for (int i = 0; i <= width / 20; i++) {
    for (int j = 0; j <= width / 20; j++) {
      noFill();
      stroke(255, 10);
      rect(gx, gy, 20, 20);
      gx += 20;
    }
    gy += 20;
    gx = 0;
  }
}

void draw() {
  background(0);
  grilla();
  snake();
  //eat();
  borders();
}
