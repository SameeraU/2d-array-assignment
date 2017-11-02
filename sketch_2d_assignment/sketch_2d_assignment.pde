//connect four
//2d array assignment

//test

int cols, rows;
int [][] board = new int [cols][rows];

int cubeHeight, cubeWidth;
boolean dropObject =false;

void setup(){
  size(700, 600);
  cols = 7;
  rows = 6;
  cubeHeight = height/rows;
  cubeWidth = width/cols;
  //ellipseX= int(mouseX/cubeWidth);
  //ellipseY = int(mouseY/cubeHeight);
}

void draw(){
  
  displayBoard();
  checkMousePressed();
  dropDisk();
}
int blankCube(int x){
  for (int i = rows-1; i >= 0; i --){
    if (board[i][j] == 0){
      return i;
    }
    else{ 
      return -1;
     }
  }
}      

void checkMousePressed(){
  int x = mouseX/cubeWidth;
  int ellipseY = blankCube(x);
  if (mousePressed){
    dropObject = true;
  }
   //else{
   //dropObject = false;
  //}//
 
}

      
void dropDisk(){
  int y= mouseY;
  int x = mouseX;
  if (dropObject == true){
    
   stroke(0);
   ellipse(x, y, 60, 60);
  }
}
  
void displayBoard(){
  strokeWeight(3);
  for (int x = 0; x< cols; x ++){
    for (int y = 0; y<rows; y++){
      rect(x*cubeWidth, y*cubeHeight, cubeWidth, cubeHeight);
    }
  }
  
}