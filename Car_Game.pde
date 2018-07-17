float x;
float y=375;
float speed=5;
float a=200;
float b=500;
float cspeed=2;
float aspeed=1;
float carpositionx;
float carpositiony;
float cokepositionx;
float cokepositiony;
float dogpositionx;
float dogpositiony;
PImage img;

void setup() {
  size(500, 500);
  img = loadImage("replay.jpg");
  img.resize(30, 0);
}

void draw() {
  background(130, 174, 219);
  move();
  collide();
  //road
  fill(111, 110, 106);
  noStroke();
  rect(0, 300, 500, 200);
  fill(255, 227, 13);
  rect(0, 350, 80, 10);
  rect(100, 350, 80, 10);
  rect(200, 350, 80, 10);
  rect(300, 350, 80, 10);
  rect(400, 350, 80, 10);
  rect(495, 350, 80, 10);
  rect(0, 430, 80, 10);
  rect(100, 430, 80, 10);
  rect(200, 430, 80, 10);
  rect(300, 430, 80, 10);
  rect(400, 430, 80, 10);
  rect(495, 430, 80, 10);

  //coke
  fill(255, 0, 0);
  ellipse(a, 400, 40, 20);
  fill(255);
  textSize(10);
  text("COKE", a-13, 403);

  //animal
  fill(180, 152, 80);
  ellipse(300, b, 10, 25);
  ellipse(305, b-13, 3, 3);
  ellipse(295, b-13, 3, 3);
  ellipse(300, b-13, 10, 10);
  ellipse(300, b+13, 5, 15);
  
  //broken car
  fill(216,136,192);
  noStroke();
  rect(120,325,50,20);
  ellipse(155,325,30,35);
  fill(0);
  ellipse(130,355,20,20);
  ellipse(160,355,20,20);
  fill(122);
  ellipse(130,355,10,10);
  ellipse(160,355,10,10);
  fill(255);
  stroke(0);
  ellipse(155,319,13,10);
  noStroke();
  
  fill(201,201,201);
  ellipse(130,315,10,10);
  ellipse(135,313,13,13);
  ellipse(130,310,11,11);
  
  ellipse(120,300,10,10);
  ellipse(125,297,13,13);
  ellipse(120,295,11,11);
  
  ellipse(140,295,10,10);
  ellipse(145,293,13,13);
  ellipse(140,290,11,11);
  
  fill(255,94,0);
  triangle(125,320,120,325,130,325);
  triangle(135,320,130,325,140,325);
  fill(255,14,5);
  triangle(130,320,125,325,135,325);
  
  fill(255,142,36);
  stroke(0);
  ellipse(70,340,30,10);
  triangle(70,305,60,340,80,340);

  //car
  noStroke();
  fill(102, 170, 206);
  rect(x, y, 50, 20);
  rect(x+25, y-20, 25, 25);
  fill(0);
  ellipse(x+10, y+30, 20, 20);
  ellipse(x+40, y+30, 20, 20);
  fill(122);
  ellipse(x+10, y+30, 10, 10);
  ellipse(x+40, y+30, 10, 10);
  fill(255);
  stroke(0);
  rect(x+35, y-15, 13, 10);
}

void move() {
  
  
  x=x+speed;
  a=a+cspeed;
  b=b-aspeed;
  
  if (x>width) {
    x=-20;
  }
  if (a>width) {
    a=-20;
  }
  if (b<300) {
    b=510;
  }
  carpositionx = x+25;
  carpositiony = y+10;
  cokepositionx=a;
  cokepositiony=400;
  dogpositionx=300;
  dogpositiony=b;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y=y-speed;
    }
  }
  if (key == CODED) {
    if (y<470) {
      if (keyCode == DOWN) {
        y=y+speed;
      }
    }
  }
}

void collide() {
  boolean hitcokex = false;
  boolean hitcokey = false;
  boolean hitdogx = false;
  boolean hitdogy = false;
  if ((carpositionx+25>cokepositionx-20)&&(carpositionx-25<cokepositionx+20)) {
    hitcokex = true;
  }
  if ((carpositiony-10<cokepositiony+10)&&(carpositiony+10>cokepositiony-10)) {
    hitcokey = true;
  }

  if ((carpositiony-15<dogpositiony+15)&&(carpositiony+10>dogpositiony-15)) {
    hitdogy = true;
  }
  if ((carpositionx+25>dogpositionx-5)&&(carpositionx+25<dogpositionx+5)) {
    hitdogx = true;
  }

  if (hitcokex == true && hitcokey == true) {
    background(0);
    fill(255);
    textSize(24);
    text("you lost", 200, 100);
    textSize(10);
    text("play again",5,60);
    speed=0;
    cspeed=0;
    aspeed=0;
    fill(255);
    noStroke();
    ellipse(25, 25, 50, 50);
    image(img, 10, 10);
  }
  if (hitdogx == true && hitdogy == true) {
    background(0);
    fill(255);
    textSize(24);
    text("you lost", 200, 100);
    textSize(10);
    text("play again",5,60);
    speed=0;
    cspeed=0;
    aspeed=0;
    fill(255);
    noStroke();
    ellipse(25, 25, 50, 50);
    image(img, 10, 10);
  }
  if((carpositiony-15<355)&&(carpositionx+25>110)&&(carpositionx-25<170)) {
    background(0);
    fill(255);
    textSize(24);
    text("you lost", 200, 100);
    textSize(10);
    text("play again",5,60);
    speed=0;
    cspeed=0;
    aspeed=0;
    fill(255);
    noStroke();
    ellipse(25, 25, 50, 50);
    image(img, 10, 10);
  }
}

void mousePressed() {
  if (mouseX>0 && mouseX<50 && mouseY>0 && mouseY<50) {
    speed=5;
    cspeed=2;
    aspeed=1;
    x = 0;
    y = 375;
  }
}
