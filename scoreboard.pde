String line[] = null;

void setup() {
  size(1280, 720);
  background(0);
}

int X_START = 10;
int Y_START = 80;
int X_SPACE = 10;
int X_SPACE2 = 5;
int Y_SPACE = 40;
int Y_SPACE2 = 360;
int SCORE_CORNER = 10;
int RING_WIDTH = 5;
int RING_X_SPACE = 40;
int RING_LENGTH = 120;
int RING_CORNER = 5;
int RING_Y = 0;
int HOLE_SIZE = 30;

int score_a = 0;
int score_b = 0;
int score_a1 = 0;
int score_a10 = 0;
int score_b1 = 0;
int score_b10 = 0;
int game_a = 0;
int game_b = 0;

PFont font;

int mytimer = 0;

void draw() {
  // score panel
  fill(255);
  stroke(255);
  rectMode(CORNERS);
  rect(X_START, Y_START, X_START+(width/2-X_SPACE*3)*2/3, height-Y_SPACE,SCORE_CORNER,SCORE_CORNER,SCORE_CORNER,SCORE_CORNER);
  rect(X_START+(width/2-X_SPACE*3)*2/3+X_SPACE, Y_START, width/2-X_SPACE2, height-Y_SPACE2,SCORE_CORNER,SCORE_CORNER,SCORE_CORNER,SCORE_CORNER);
  rect(width/2+X_SPACE2, Y_START, width/2+X_START+(width/2-X_SPACE*3)*1/3, height-Y_SPACE2,SCORE_CORNER,SCORE_CORNER,SCORE_CORNER,SCORE_CORNER);
  rect(width/2+X_START+(width/2-X_SPACE*3)*1/3+X_SPACE, Y_START, width-X_START, height-Y_SPACE,SCORE_CORNER,SCORE_CORNER,SCORE_CORNER,SCORE_CORNER);
  
  // hole for ring
  stroke(0);
  fill(0);
  ellipse(X_START+RING_X_SPACE+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE, HOLE_SIZE);
  ellipse(X_START+(width/2-X_SPACE*3)*2/3-RING_X_SPACE-RING_WIDTH+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE, HOLE_SIZE);
  ellipse(X_START+(width/2-X_SPACE*3)*2/3+X_SPACE+RING_X_SPACE+RING_WIDTH/2+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE, HOLE_SIZE);
  ellipse(width/2-X_SPACE2-RING_X_SPACE-RING_WIDTH+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE, HOLE_SIZE);
  ellipse(width/2+X_SPACE2+RING_X_SPACE+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE, HOLE_SIZE);
  ellipse(width/2+X_START+(width/2-X_SPACE*3)*1/3-RING_X_SPACE-RING_WIDTH+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE, HOLE_SIZE);
  ellipse(width/2+X_START+(width/2-X_SPACE*3)*1/3+X_SPACE+RING_X_SPACE+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE, HOLE_SIZE);
  ellipse(width-X_START-RING_X_SPACE-RING_WIDTH+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE, HOLE_SIZE);
  //circle(X_START+RING_X_SPACE+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE);
  //circle(X_START+(width/2-X_SPACE*3)*2/3-RING_X_SPACE-RING_WIDTH+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE);
  //circle(X_START+(width/2-X_SPACE*3)*2/3+X_SPACE+RING_X_SPACE+RING_WIDTH/2+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE);
  //circle(width/2-X_SPACE2-RING_X_SPACE-RING_WIDTH+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE);
  //circle(width/2+X_SPACE2+RING_X_SPACE+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE);
  //circle(width/2+X_START+(width/2-X_SPACE*3)*1/3-RING_X_SPACE-RING_WIDTH+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE);
  //circle(width/2+X_START+(width/2-X_SPACE*3)*1/3+X_SPACE+RING_X_SPACE+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE);
  //circle(width-X_START-RING_X_SPACE-RING_WIDTH+RING_WIDTH/2, RING_LENGTH, HOLE_SIZE);
  
  //ring
  fill(100);
  stroke(100);
  rectMode(CORNER);
  rect(X_START+RING_X_SPACE, RING_Y, RING_WIDTH, RING_LENGTH, RING_CORNER, RING_CORNER, RING_CORNER, RING_CORNER);
  rect(X_START+(width/2-X_SPACE*3)*2/3-RING_X_SPACE-RING_WIDTH, RING_Y, RING_WIDTH, RING_LENGTH, RING_CORNER, RING_CORNER, RING_CORNER, RING_CORNER);
  rect(X_START+(width/2-X_SPACE*3)*2/3+X_SPACE+RING_X_SPACE, RING_Y, RING_WIDTH, RING_LENGTH, RING_CORNER, RING_CORNER, RING_CORNER, RING_CORNER);
  rect(width/2-X_SPACE2-RING_X_SPACE-RING_WIDTH, RING_Y, RING_WIDTH, RING_LENGTH, RING_CORNER, RING_CORNER, RING_CORNER, RING_CORNER);
  rect(width/2+X_SPACE2+RING_X_SPACE, RING_Y, RING_WIDTH, RING_LENGTH, RING_CORNER, RING_CORNER, RING_CORNER, RING_CORNER);
  rect(width/2+X_START+(width/2-X_SPACE*3)*1/3-RING_X_SPACE-RING_WIDTH, RING_Y, RING_WIDTH, RING_LENGTH, RING_CORNER, RING_CORNER, RING_CORNER, RING_CORNER);
  rect(width/2+X_START+(width/2-X_SPACE*3)*1/3+X_SPACE+RING_X_SPACE, RING_Y, RING_WIDTH, RING_LENGTH, RING_CORNER, RING_CORNER, RING_CORNER, RING_CORNER);
  rect(width-X_START-RING_X_SPACE-RING_WIDTH, RING_Y, RING_WIDTH, RING_LENGTH, RING_CORNER, RING_CORNER, RING_CORNER, RING_CORNER);
  
  mytimer+=1;
  // score
  if (mytimer > 30) {
    line = loadStrings("score.txt");
    //println(line.length);
    String [] data = split(line[line.length-1], ' ');
    score_a = int(data[0]);
    game_a = int(data[1]);
    game_b = int(data[2]);
    score_b = int(data[3]);
    mytimer = 0;  
  }
  
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(400);

  if (score_a >= 10) {
    score_a1 = score_a - 10;
    score_a10 = 1;
    //score_a1 = score_a % 10;
    //score_a10 = score_a / 10;
    text(score_a10, X_START+100, height/2);
    text(score_a1, X_START+(width/2-X_SPACE*3)*2/3*1/2+80, height/2);
  } else {
    text(score_a, X_START+(width/2-X_SPACE*3)*2/3*1/2, height/2);
  }
  
  if (score_b >= 10) {
    score_b1 = score_b - 10;
    score_b10 = 1;
    //score_b1 = score_b % 10;
    //score_b10 = score_b / 10;
    text(score_b10, width-X_START-(width/2-X_SPACE*3)*2/3+100, height/2);
    text(score_b1, width-X_START-(width/2-X_SPACE*3)*2/3*1/2+80, height/2);
  } else {
    text(score_b, width-X_START-(width/2-X_SPACE*3)*2/3*1/2, height/2);
  }
  
  textSize(200);
  text(game_a, width/2-X_SPACE2-(width/2-X_SPACE*3)*1/3*1/2, Y_START+(height-Y_SPACE2-Y_START)*1/2);
  text(game_b, width/2+X_SPACE2+(width/2-X_SPACE*3)*1/3*1/2, Y_START+(height-Y_SPACE2-Y_START)*1/2);
}

// Call from JavaScript of index.html
void setResult(int sa, int ga, int gb, int sb) {
  score_a = sa;
  game_a = ga;
  game_b = gb;
  score_b = sb;
}

// For debug. Can control with keyboard.
void keyPressed() {
  if (key == 'a') {
    score_a += 1;
  }
  if (key == 's') {
    score_b += 1;
  }
  if (key == 'd') {
    game_a += 1;
  }
  if (key == 'f') {
    game_b += 1;
  }
}
