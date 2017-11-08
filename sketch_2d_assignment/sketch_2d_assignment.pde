//connect four
//2d array assignment

//test

int cols = 7;
int rows = 6;
int [][] board = new int [cols][rows];

int cubeSize = 100;
int ellipseSize = 80;
int turn= 1;
int state = 1;
int ellipseDX;
void setup(){
  size(700, 600);

 
  ellipseMode(CORNER);
  
  
}

void draw(){
  if (whoIsWinner() == 0){
    
    displayBoard();
  }
  else{
    background(255);
    stroke(0);
    text("you won", 300, 300);
  }
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
  ellipseDX = int(random(1, 7));
  
  for (int i  = 0; i< cols; i++){
    for (int j = 0; j< rows; j++){
      if (validDiskPosition(i, j) != 0 && validDiskPosition(i, j) == validDiskPosition(i + 1, j) && validDiskPosition(i, j) == validDiskPosition(i + 2, j)){
        ellipseDX = i + 3;
      }
      else if (validDiskPosition(i, j) != 0 && validDiskPosition(i, j) == validDiskPosition(i + 1, j) && validDiskPosition(i, j) == validDiskPosition(i + 3, j)){
        ellipseDX = i + 2;
      }
      else if (validDiskPosition(i, j) != 0 && validDiskPosition(i, j) == validDiskPosition(i + 2, j) && validDiskPosition(i, j) == validDiskPosition(i + 3, j)){
        ellipseDX = i + 1;
      }
    }
  }
  int ellipseDY = blankCube(ellipseDX);
  if (ellipseY >= 0 && ellipseDY >= 0){
    if (turn ==1){
      board[ellipseX][ellipseY] =turn;
    }
    else if (turn ==2){
      board[ellipseDX][ellipseDY] =turn;
    }
    if (turn ==1){
      turn =2;
      
    }
    else if (turn ==2){
    
     turn =1;
    }
  }

    
}

int validDiskPosition( int xCord, int yCord){
  if (xCord < 0 || yCord < 0 || yCord >= rows || xCord>= cols){
    return 0;
  }
  else{
    return board[xCord][yCord];
  }
}
int whoIsWinner(){

  for (int i  = 0; i< cols; i++){
    for (int j = 0; j< rows; j++){
      if (validDiskPosition(i, j) != 0 && validDiskPosition(i, j) == validDiskPosition(i + 1, j) && validDiskPosition(i, j) == validDiskPosition(i + 2, j) && validDiskPosition(i, j) == validDiskPosition(i + 3, j)){
        return validDiskPosition(i, j);
      }
    }
  }
  for (int i  = 0; i< cols; i++){
    for (int j = 0; j< rows; j++){
      if (validDiskPosition(i, j) != 0 && validDiskPosition(i, j) == validDiskPosition(i , j+1) && validDiskPosition(i, j) == validDiskPosition(i, j+2) && validDiskPosition(i, j) == validDiskPosition(i , j+3)){
        return validDiskPosition(i, j);
      }
    }
  }
  for (int i  = 0; i< cols; i++){
    for (int j = 0; j< rows; j++){
      if (validDiskPosition(i, j) != 0 && validDiskPosition(i, j) == validDiskPosition(i+1, j+1) && validDiskPosition(i, j) == validDiskPosition(i+2, j+2) && validDiskPosition(i, j) == validDiskPosition(i+3, j+3)){
        return validDiskPosition(i, j);
      }
    }
  }
   for (int i  = cols; i>=0; i--){
    for (int j = rows; j>0; j--){
      if (validDiskPosition(i, j) != 0 && validDiskPosition(i, j) == validDiskPosition(i-1, j+1) && validDiskPosition(i, j) == validDiskPosition(i-2, j+2) && validDiskPosition(i, j) == validDiskPosition(i-3, j+3)){
        return validDiskPosition(i, j);
      }
    }
  }
  for (int i  = 0; i< cols; i++){
    for (int j = 0; j< rows; j++){
      if(validDiskPosition (i, j) == 0){
        return 0;
      }
    }
  }
 
 
  return 2;
 
}
  

void displayBoard(){
  
  for (int x = 0; x< cols; x ++){
    for (int y = 0; y<rows; y++){
      fill(#34F5D9);
      noStroke();
      strokeWeight(2);
      rect(x*cubeSize, y*cubeSize, cubeSize, cubeSize);
      fill(255);
      stroke(1);
      ellipse( cubeSize*x, cubeSize*y,ellipseSize, ellipseSize);
      if (board[x][y] > 0){
        if (board[x][y] == 1){
          fill(0, 0, 255);
          stroke(1);
          ellipse( cubeSize*x, cubeSize*y, ellipseSize, ellipseSize);
        }
        else if (board[x][y] == 2){
          fill(244, 245, 2);
          stroke(1);
          
          ellipse( cubeSize*x, cubeSize*y, ellipseSize, ellipseSize);
        }
        
      }   
    }
  } 
  
}