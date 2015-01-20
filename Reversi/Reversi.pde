
int BOADSIZE = 520;
int STONESIZE = 50;
int ROW = 8;
int COLUMN = 8;
int MASSSIZE = BOADSIZE/COLUMN;
int[][] stone = new int[COLUMN][ROW];

void setup() {
  print(MASSSIZE);
  size(BOADSIZE+200, BOADSIZE);
  for (int i=0; i<COLUMN; i++) {
    for (int j=0; j<ROW; j++) {
      stone[i][j] = 0;
    }
  }
  stone[3][3] = 1;
  stone[4][4] = 1;
  stone[4][3] = -1;
  stone[3][4] = -1;
}

void draw() {
  background(50, 100, 50);

  //draw line
  for (int i=0; i<COLUMN+1; i++) {
    line(i*MASSSIZE, 0, i*MASSSIZE, BOADSIZE);
  }
  for (int i=0; i<ROW+1; i++) {
    line(0, i*MASSSIZE, BOADSIZE, i*MASSSIZE);
  }

  //push mass

  //draw stone
  for (int i=0; i<COLUMN; i++) {
    for (int j=0; j<ROW; j++) {
      if (stone[i][j] == 0) {
      } else if (stone[i][j] == 1) {
        fill(255);
        ellipse(i*MASSSIZE+0.5*MASSSIZE, j*MASSSIZE+0.5*MASSSIZE, STONESIZE, STONESIZE);
      } else if (stone[i][j] == -1) {
        fill(0);
        ellipse(i*MASSSIZE+0.5*MASSSIZE, j*MASSSIZE+0.5*MASSSIZE, STONESIZE, STONESIZE);
      }
    }
  }
}

void mousePressed() {
  for (int i=0; i<COLUMN; i++) {
    for (int j=0; j<ROW; j++) {
      if (dist(mouseX, mouseY, i*MASSSIZE+0.5*MASSSIZE, j*MASSSIZE+0.5*MASSSIZE)<0.5*MASSSIZE) {
        if (stone[i][j]==0) {
          stone[i][j] = 1;
        } else {
          stone[i][j] = -stone[i][j];
        }
      }
    }
  }
}

