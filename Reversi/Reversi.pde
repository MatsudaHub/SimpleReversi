
int BOADSIZE = 520;
int STONESIZE = 50;
int ROW = 8;
int COLUMN = 8;
int MASSSIZE = BOADSIZE/COLUMN;
int[][] stone = new int[COLUMN][ROW];
int player = 1;  //player is 1 or -1

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
    line(i*MASSSIZE, 0, i*MASSSIZE, BOADSIZE);
  }
  for (int i=0; i<ROW+1; i++) {
    line(0, i*MASSSIZE, BOADSIZE, i*MASSSIZE);
  }

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
          if (player==1) {
            stone[i][j] = 1;
            stoneTurn(i, j);
          } else if (player==-1) {
            stone[i][j] = -1;
            stoneTurn(i, j);
          }
          player = -player;
        } else {
        }
      }
    }
  }
}

void stoneTurn(int ii, int jj) {
  //UpCheck
  if (jj!=0) {
    if (stone[ii][jj-1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj-k>=0) {
          if (stone[ii][jj-k]==0) {
            count = 0;
            break;
          } else if (stone[ii][jj-k]==-player) {
            count++;
          } else if (stone[ii][jj-k]==player) {
            for (int l=1; l<=count; l++) {
              stone[ii][jj-l] = player;
            }
          }
        }
      }
    }
  }
  //DownCheck
  if (jj!=7) {
    if (stone[ii][jj+1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj+k<=7) {
          if (stone[ii][jj+k]==0) {
            count = 0;
            break;
          } else if (stone[ii][jj+k]==-player) {
            count++;
          } else if (stone[ii][jj+k]==player) {
            for (int l=1; l<=count; l++) {
              stone[ii][jj+l] = player;
            }
          }
        }
      }
    }
  }
  //LeftCheck
  if (ii!=0) {
    if (stone[ii-1][jj]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (ii-k>=0) {
          if (stone[ii-k][jj]==0) {
            count = 0;
            break;
          } else if (stone[ii-k][jj]==-player) {
            count++;
          } else if (stone[ii-k][jj]==player) {
            for (int l=1; l<=count; l++) {
              stone[ii-l][jj] = player;
            }
          }
        }
      }
    }
  }
  //RightCheck
  if (ii!=7) {
    if (stone[ii+1][jj]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (ii+k<=7) {
          if (stone[ii+k][jj]==0) {
            count = 0;
            break;
          } else if (stone[ii+k][jj]==-player) {
            count++;
          } else if (stone[ii+k][jj]==player) {
            for (int l=1; l<=count; l++) {
              stone[ii+l][jj] = player;
            }
          }
        }
      }
    }
  }
  
  //UpLeftCheck
  if (jj!=0 && ii!=0) {
    if (stone[ii-1][jj-1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj-k>=0 && ii-k>=0) {
          if (stone[ii-k][jj-k]==0) {
            count = 0;
            break;
          } else if (stone[ii-k][jj-k]==-player) {
            count++;
          } else if (stone[ii-k][jj-k]==player) {
            for (int l=1; l<=count; l++) {
              stone[ii-l][jj-l] = player;
            }
          }
        }
      }
    }
  }
  //DownLeftCheck
  if (jj!=7 && ii!=0) {
    if (stone[ii-1][jj+1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj+k<=7 && ii-k>=0) {
          if (stone[ii-k][jj+k]==0) {
            count = 0;
            break;
          } else if (stone[ii-k][jj+k]==-player) {
            count++;
          } else if (stone[ii-k][jj+k]==player) {
            for (int l=1; l<=count; l++) {
              stone[ii-l][jj+l] = player;
            }
          }
        }
      }
    }
  }
  //DownRightCheck
  if (jj!=7 && ii!=7) {
    if (stone[ii+1][jj+1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj+k<=7 && ii+k<=7) {
          if (stone[ii+k][jj+k]==0) {
            count = 0;
            break;
          } else if (stone[ii+k][jj+k]==-player) {
            count++;
          } else if (stone[ii+k][jj+k]==player) {
            for (int l=1; l<=count; l++) {
              stone[ii+l][jj+l] = player;
            }
          }
        }
      }
    }
  }
  //UpRightCheck
  if (jj!=0 && ii!=7) {
    if (stone[ii+1][jj-1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj-k>=0 && ii+k<=7) {
          if (stone[ii+k][jj-k]==0) {
            count = 0;
            break;
          } else if (stone[ii+k][jj-k]==-player) {
            count++;
          } else if (stone[ii+k][jj-k]==player) {
            for (int l=1; l<=count; l++) {
              stone[ii+l][jj-l] = player;
            }
          }
        }
      }
    }
  }
}

