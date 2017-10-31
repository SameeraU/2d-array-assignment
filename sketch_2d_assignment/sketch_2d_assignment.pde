//connect four
//2d array assignment


int cols, rows;
int [][] board = new int [cols][rows];

int cubeHeight, cubeWidth, ellipseX, ellipseY;

void setup(){
  size(700, 600);
  cols = 7;
  rows = 6;
  cubeHeight = height/rows;
  cubeWidth = width/cols;
  ellipseX= int(mouseX/cols);
  ellipseY = int(mouseY/rows);
}

void draw(){
  
  displayBoard();
  
}

void mousePressed(){
  fill(255);
 ellipse(ellipseX, ellipseY, cubeWidth, cubeHeight);
  
}
void displayBoard(){
  strokeWeight(3);
  for (int x = 0; x< cols; x ++){
    for (int y = 0; y<rows; y++){
      rect(x*cubeWidth, y*cubeHeight, cubeWidth, cubeHeight);
    }
  }
  
}