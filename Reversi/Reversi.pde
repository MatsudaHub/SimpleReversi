
int BOADSIZE = 500;
int STONESIZE = 50;
int ROW = 8;
int COLUMN = 8;
int[][] stone = new int[COLUMN][ROW];

void setup() {
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
    line(i*BOADSIZE/COLUMN, 0, i*BOADSIZE/COLUMN, BOADSIZE);
  }
  for (int i=0; i<ROW+1; i++) {
    line(0, i*BOADSIZE/ROW, BOADSIZE, i*BOADSIZE/ROW);
  }

  //draw stone
  for (int i=0; i<COLUMN; i++) {
    for (int j=0; j<ROW; j++) {
      if (stone[i][j] == 0) {        
      } else if (stone[i][j] == 1) {
        fill(255);
        ellipse((i*BOADSIZE*1/COLUMN)+0.5*BOADSIZE*1/COLUMN, (j*BOADSIZE*1/ROW)+0.5*BOADSIZE*1/ROW, STONESIZE, STONESIZE);
      } else if (stone[i][j] == -1) {
        fill(0);
        ellipse((i*BOADSIZE*1/COLUMN)+0.5*BOADSIZE*1/COLUMN, (j*BOADSIZE*1/ROW)+0.5*BOADSIZE*1/ROW, STONESIZE, STONESIZE);
      }
    }
  }
}

