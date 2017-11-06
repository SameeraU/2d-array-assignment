//connect four
//2d array assignment

//test

int cols = 7;
int rows = 6;
int [][] board = new int [cols][rows];
int state, onTop;
int cubeSize = 100;
int turn= 1;
int ellipseY;
void setup(){
  size(700, 600);

  
  ellipseMode(CORNER);
  
  
}

void draw(){
  displayBoard();
  dropTheDisk();
}


int blankCube(int x){
  for (int y = rows-1; y>= 0; y --){
    if (board[x][y] == 0) {
      return y;
    }
  }
  return -1;
}

void mousePressed(){
  int ellipseX = mouseX/cubeSize;
  ellipseY = blankCube(ellipseX);
  
  if (ellipseY >= 0){
    board[ellipseX][0] =turn;
    if (turn ==1){
      turn =2;
    }
    else{
     turn =1;
    }
  }    
}
void dropTheDisk() {
  if (frameCount % 4 == 0) {

    for (int x=cols-1; x>=0; x--) {
      for (int y=rows-1; y>=0; y--) {
        if (y< rows-1){
          if (board[x][y] == 2) {  
            board[x][y] = 0;
            if (y < rows-1) { 
              //if (board[x][y+1] != 1){
                board[x][ellipseY] = 2;
                print(ellipseY);
              //}
            }
          }
           else if (board[x][y] == 1) {  
              board[x][y] = 0;
              if (y < rows-1) {
                board[x][ellipseY] = 1;
              }
           }
        }
      }
    }
  }
}

void displayBoard(){
  
  for (int x = 0; x< cols; x ++){
    for (int y = 0; y<rows; y++){
      fill(255);
      stroke(1);
      strokeWeight(3);
      rect(x*cubeSize, y*cubeSize, cubeSize, cubeSize);
      if (board[x][y] > 0){
        if (board[x][y] == 1){
          fill(255, 0, 0);
        }
        else if (board[x][y] == 2){
          fill(244, 245, 2);
        }
        stroke(1);
        ellipse( cubeSize*x, cubeSize*y, cubeSize, cubeSize);
      }   
    }
  }  
}