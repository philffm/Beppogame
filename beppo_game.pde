//Social game; how to avoid obstacles


//variables
int wide;
int move;
int down;
int leftRight;
boolean killswitch;
int score;
int r1;
int r2;
int r3;
String r1img="kim.png";
String r2img="vlad.png";
String r3img="donald.png";


String[] imageNames = { "kim.png", "vlad.png", "donald.png" };
PImage[] images = new PImage[imageNames.length];


//setup
void setup() {
  size(1000, 1600);

  /* variables */
  wide = 150;
  move = 0;
  down = 0;
  leftRight = 150;
  killswitch = false;
  score = 0;
  r1 = int(random(0, 5));
  r2 = int(random(0, 5));
  r3 = int(random(0, 5));
   
}


//game anim
void draw() {

if (killswitch == false) {
    
    /* BG & setup */
    background(200, 200, 200);
 
    noStroke();
    fill(120);
    rect(width/8, 0, width-width/4, height);
  
    stroke(255);
    strokeWeight(10);
    line(width/8, 0, width/8, height);
    line(width-width/8, 0, width-width/8, height);
  
    strokeWeight(3);
    line(width/8 + wide, 0, width/8 + wide, height);
    line(width/8 + wide*2, 0, width/8 + wide*2, height);
    line(width/8 + wide*3, 0, width/8 + wide*3, height);
    line(width/8 + wide*4, 0, width/8 + wide*4, height);
  
    fill(0, 0, 255);
  
  
    /* obstacles */
    
    fill(50, 200, 100);
    
   
  
    if (r2 == r1 || r3 == r2 || r3 == r1) {
      r1 = int(random(1));
      r2 = 2;
      r3 = int(random(3, 5));;
    }
    
    
    if (r2 != r1 && r3 != r2 && r3 != r1) {  
      obstacle(r1);
      obstacle(r2);
      obstacle(r3);  
    }
    
  
    /* repeat */
  
    if (down <= -2200) {
      down = 0;
      r1 = int(random(0, 6));
      int index = int(random(imageNames.length));
      String r1img= imageNames[index];

      r2 = int(random(0, 6));
      r3 = int(random(0, 6));
      score += 1;
    }
    
    String scoreBoard = "Score: " + str(score);
    textSize(60);
    fill(255, 255, 0);
    text(scoreBoard, 150, 60);
  
  
    /* speed */
    if (score < 5) {
      down = down - 15;
    } else if (score < 10) { 
      down = down - 20;
    } else if (score < 15) {
      down = down - 25;
    } else if (score < 20) {
      down = down - 30;
    } else if (score < 25) {
      down = down - 35;  
    } else if (score < 30) {
      down = down - 40; 
    } else if (score >= 30) {
      down = down - 45; 
    }
  }
}


//function

void obstacle(int r) {
  

      if (r == 0) {
      image(loadImage(r1img),width/8 + 10, -down, wide - 20, -height/10);
    } else if (r == 1) {
      image(loadImage(r2img),width/8 + leftRight + 10, -down, wide - 20, -height/10);
    } else if (r == 2) {
      image(loadImage(r3img),width/8 + leftRight *2 + 10, -down, wide - 20, -height/10);
    } else if (r == 3) {
      image(loadImage(r2img),width/8 + leftRight *3 + 10, -down, wide - 20, -height/10);
    } else {
      image(loadImage(r1img),width/8 + leftRight *4 + 10, -down, wide - 20, -height/10);
    }
}


//kill player

void keyPressed() {
  
  if (key == 'b') {
    fill(255, 0, 0);
    rect(0, 0, width, height);
    killswitch = true;
    
    String scoreBoard = "Score: " + str(score);
    textSize(100);
    fill(255, 255, 0);
    text(scoreBoard, 275, height/2);
  }
  
  if (key == 'n') {
    killswitch = false;
    score = 0;
    down = 0;
  }
  
}
