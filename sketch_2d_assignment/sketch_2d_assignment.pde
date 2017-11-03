//connect four
//2d array assignment

//test

int cols = 7;
int rows = 6;
int [][] board = new int [cols][rows];

int cubeSize = 100;
int turn= 1;

void setup(){
  size(700, 600);

  
  ellipseMode(CORNER);
  
  
}

void draw(){
  displayBoard();
  
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
  int ellipseY = blankCube(ellipseX);
  
  if (ellipseY >= 0){
    board[ellipseX][ellipseY] =turn;
    if (turn ==1){
      turn =2;
    }
    else{
     turn =1;
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
          fill(0, 0, 255);
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