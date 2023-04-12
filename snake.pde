//snake
int [] posx = new int[10];
int [] posy = new int[10];

int mov = 0;
int p = 1;

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
  frameRate(5);
  for (int i = 0; i < p; i++) {
    fill(0, 0, 255);
    rect(posx[i], posy[i], 20, 20);
  }
  movimiento();
}

void movimiento() {
  for (int i = p - 1; i > p; i-) {
    posx[i] = posx[i - 1];
    posy[i] = posy[i - 1];    
  }
  if (mov == 1) {
    posx[0] += 20;
  } else if (mov == 2) {
    posy[0] += 20;
  } else if (mov == 3) {
    posx[0] -= 20;
  } else if (mov == 4) {
    posy[0] -= 20;
  }
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
  if (keyCode == 'p' || keyCode == 'P') {
    p++;
  }
}

/*void keyReleased() {
 if (keyCode == LEFT) {
 mov = 0;
 }
 if (keyCode == UP) {
 mov = 0;
 }
 if (keyCode == DOWN) {
 mov = 0;
 }
 if (keyCode == RIGHT) {
 mov = 0;
 }
 }*/






void borders() {
  if (posx[0] >= 400) {
    posx[0] = 0;
  }
  if (posx[0] <= -20) {
    posx[0] = 380;
  }
  if (posy[0] >= 400) {
    posy[0] = 0;
  }
  if (posy[0] < -20) {
    posy[0] = 380;
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

  println(posx[0], posx[1], posx[2], posx[3], posx[4], posx[5], posx[6], posx[7], posx[8], posx[9]);
  println(posy[0], posy[1], posy[2], posy[3], posy[4], posy[5], posy[6], posy[7], posy[8], posy[9]);
  println(mov);
  println();
}
