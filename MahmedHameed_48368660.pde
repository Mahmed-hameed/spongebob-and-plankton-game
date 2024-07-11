//Global Variables
//Boolean Variables
boolean moveOn=false;
boolean moveOn2=false;
boolean[] mineVisible = new boolean[10]; 
// Int Variables
int groundWidth;
int groundHeight;
int screenNumber=1;
int text;
//Arrays 
int[] backGround={#024198,#ffa500,#008000,#000000}; // Array to store the backGround Colour of each Screen
int[][] brickSize={ { 40,20 } };//Array to store the Brick size present in BrickWall page
float [][] mines;// Array to store the X,and Y Coordinate of the 10 mines 
boolean[] mine;//Store Status of Every mine
float[][] mines2;
boolean[] mine2;
float [][]pineapple={ {560,200 },{ 560,50 }};
float [][]rock={ {160,300 },{  160,170}};
float [][]easterIslandHead={ {320,180},{320,60}};
float [][]Ground={{ 0,300 },{ 0,200 }};
float mineRadius = 25; 
//PVector values
PVector face= new PVector();
PVector eye= new PVector(); 
PVector eye2= new PVector(); 
PVector pants=new PVector(); 
PVector leg= new PVector();
PVector leg2= new PVector();
PVector foot= new PVector(); 
PVector foot2=new PVector();
PVector eyedot= new PVector(); 
PVector eyedot2= new PVector(); 
PVector ground= new PVector(); 
//Dimentions
float faceSize;
float pantsWidth;
float pantsHeight;
float footWidth; 
float footHeight; 
float legHeight;
float legWidth;
float eyesize;
void setup(){  
size( 800,600 );
initializemines();//initialize mines for BrickWall
initializeMines();//initialize mines for Location 2
}
void draw(){  
if (screenNumber==1){  
location1( );
}
if(  screenNumber==2){  
brickWall();
}
if(screenNumber==3){  
location2();
}
if(screenNumber==3&&moveOn2){  
endScreen();
}
}
void keyPressed() {
  switch(screenNumber) {
    case 1:
      if (key == 's' || key == 'S') {
        screenNumber = 2;
      }
      break;
    case 2:
      if (moveOn && (key == 'K' || key == 'k')) {
        screenNumber = 3;
        moveSpongeBottomRight();
        moveOn = false;
      }
      if (!moveOn) {
        controlMovement();
      }
      break;
    case 3:if( !moveOn2 ){  
    
    controlMovement();
    }
    
      
      
     
      case 4: 
      
      break;
      
  }
  checkEdges();
}
void location1(){
backGround(backGround[  0]  );
drawSpongeBobObjects( pineapple[0][0],pineapple[0][1],rock[0][0],rock[0][1],easterIslandHead[0][0], easterIslandHead[0][1]  );
drawGround(Ground[0][0],Ground [0]  [ 1 ]  );
drawdroid( 100,10.5 );
Text( 1 );
}

void brickWall(  ){ 
backGround(backGround[1]);
drawWall();
setmines();
diffuseMine();
drawdroid( 10,10 );
Text( 2);
} 
void location2(){
backGround( backGround [0] );
drawGround(Ground[1][0],Ground [1]  [ 1 ]  );
drawSpongeBobObjects( pineapple[1][0],pineapple[1][1],rock[1][0],rock[1][1],easterIslandHead[1][0], easterIslandHead[1][1]  );
setmines2(  );
diffuseMine2();
drawdroid( 10,10 );
Text( 3);
}
void drawWall(){
  int brickWidth = brickSize[0][0];
  int brickHeight = brickSize[0][1]; 
  for (int i = 0; i < height; i += brickHeight) {
    int shift = (i / brickHeight) % 2 == 0 ? 0 : brickWidth / 2;
    for (int j = shift; j < width; j += brickWidth) {
      fill(backGround[1]); 
      rect(j, i, brickWidth, brickHeight);
    }
  }
}
void endScreen(){
backGround(backGround[3]);
stars();
Text( 4);
} 

void drawdroid(  float X,float Y){  
X=face.x; 
Y=face.y;
// Adding values to the global variables
//SpongeBob face =
faceSize = width * 0.10;
//SpongeBob eyes
eye.x = face.x + width * 0.03;
eye.y = face.y + width * 0.04;
eyesize = width * 0.04;
eye2.x = eye.x + width * 0.04;
eye2.y = eye.y;
//SpongeBob eyeball
eyedot.x = eye.x;
eyedot.y = eye.y;
eyedot2.x = eye2.x;
eyedot2.y = eye2.y;
//SpongeBob pants 
pants.x=face.x;
pants.y= face.y + 3 * faceSize / 4;
pantsWidth= faceSize;
pantsHeight= faceSize / 4;
//leg 
leg.x=face.x+15;
leg.y= pants.y+20;
leg2.x=leg.x+40;
leg2.y= pants.y+20;
legHeight= 30;
legWidth= 10;
//foot 
foot.x= leg.x;
foot.y= leg.y+ legHeight;
foot2.x= leg2.x;
foot2.y= leg2.y+ legHeight;
footHeight=10;
footWidth=legWidth+5;
//draw
fill(#FFFB64);
rect(face.x, face.y, faceSize, faceSize);
fill(255, 255, 255);
ellipse(eye.x, eye.y, eyesize, eyesize);
ellipse(eye2.x, eye2.y, eyesize, eyesize);
strokeWeight(10);
point(eyedot.x, eyedot.y);
point(eyedot2.x, eyedot2.y);
strokeWeight(0); // Reset strokeWeight to 0
fill( #4E3524 );
rect( pants.x,pants.y,pantsWidth,pantsHeight );
fill( #ffff00 );
rect( leg.x,leg.y,legWidth,legHeight );
rect( leg2.x,leg2.y,legWidth,legHeight );
fill( 255,0,0 );
rect( foot.x,foot.y,footWidth,footHeight  );
rect( foot2.x,foot2.y,footWidth, footHeight );
noFill();
}
void backGround(  int Backcolour){  
background( Backcolour );
}
void Text(  int screenNumber){  
if(screenNumber==1  ){  
fill( 255 );
text( "Location 1",width *0.1,height *0.85 );
textSize( 20 );
text( "Plankton is Back",width *0.6,height *0.05 );
text( "Press: 'S' to Attack Plankton",width *0.6,height *0.1 );

}

if((screenNumber==2)&&moveOn==false){ 
  text( "use arrow keys to attack Plankton",width *0.6,height *0.1 );
}
if((screenNumber==2)&&moveOn==true){  
fill( 255 );
text( "BrickWall",width *0.1,height *0.85 ); 
textSize( 20 );
text("Press K to move on to the Locaiton 2",50,50);
noFill();
}
if((screenNumber==3)){  
fill( 255 );
text( "Location 2",width *0.1,height *0.85 ); 
textSize( 20 );
text("",50,50);
noFill();
}
if( screenNumber==4){ 
textSize( 20 );
fill( 255 );
text( "SpongBob Won!",width *0.5,height *0.5 );
noFill();
}


}
void initializemines ( ){  
mine= new boolean[10];
mines=new float [10][2]; 
for (  int  x=0;x<mines.length;x++)
{  mines[x][0]=random(mineRadius,width-mineRadius);
mines[x][1]=random(mineRadius,height-mineRadius);
mine[x]=false;
}

}
void initializeMines() {
mine2 = new boolean[10];
mines2 = new float[10][2];
for (int x = 0; x < mines2.length; x++) {
mines2[x][0] = random(mineRadius, width - mineRadius);
float startY = height / 3;
mines2[x][1] = random(startY + mineRadius, height - mineRadius);
mine2[x] = false;
  }
}

void mine( float x,float y ){  
fill(0, 128, 0); 
ellipse(x, y, 30, 45);
// Eye
fill(255);
ellipse(x, y-5, 15, 15); 
fill(0);
ellipse(x, y-5, 6, 6);
// Mouth
noFill();
stroke(0);
arc(x, y+7, 10, 5, 0, PI); 
// Arms
fill(0, 128, 0); 
ellipse(x-15, y, 5, 10); 
ellipse(x+15, y, 5, 10); 
// Legs 
ellipse(x-7, y+22, 5, 10); 
ellipse(x+7, y+22, 5, 10); 
}
void diffuseMine() { 
   boolean allMinesDiffused = true; 
  for (int j = 0; j < mine.length; j++) {
    if (checkCollision(mines[j][0], mines[j][1], face.x, face.y, faceSize, faceSize)) {
                mine[j] = true;
            }
            else if (checkCollision(mines[j][0], mines[j][1], leg.x, leg.y, legWidth, legHeight)) {
                mine[j] = true; 
            }
            else if (checkCollision(mines[j][0], mines[j][1], leg2.x, leg2.y, legWidth, legHeight)) {
                mine[j] = true;
            }
    if (!mine[j]) {
      allMinesDiffused=false;
    }
  }
  if (allMinesDiffused) {;
    moveOn=true;
    Text( 2 );
   
  }
}
void diffuseMine2() { 
     boolean allMinesDiffused2 ; 

   allMinesDiffused2 = true; 
  for (int j = 0; j < mine2.length; j++) {
    if (checkCollision(mines2[j][0], mines2[j][1], face.x, face.y, faceSize, faceSize)) {
                mine2[j] = true;
            }

    if (!mine2[j]) {
      allMinesDiffused2=false;
    }
  }
  if (allMinesDiffused2) {
    moveOn2=true;
    
  }
}

void setmines2(  ){  
  for(int j=0;j<mines2.length;j++){
if(mine2[j]==false && frameCount % 60 < 30 ){  
mine( mines2[j][0],mines2[j][1] );
} 
if( mine2[j]==true  ){  
}

}
}

void setmines(  ){  
  for(int j=0;j<mines.length;j++){
if(mine[j]==false && frameCount % 60 < 30 ){  
mine( mines[j][0],mines[j][1] );
} 
if( mine[j]==true  ){  
}

}
}
void checkEdges(){  
face.x = max(face.x, 0); 
face.x = min(face.x, width - faceSize);
face.y = max(face.y, 0);
face.y = min(face.y, height - faceSize-footHeight-legHeight);
}
boolean checkCollision(float mineX, float mineY, float objectX, float objectY, float objectWidth, float objectHeight) {
    return mineX > objectX && mineX < objectX + objectWidth && mineY > objectY && mineY < objectY + objectHeight;
}
void drawSpongeBobObjects( float pineappleX,float pineappleY,float rockX,float rockY,float easterIslandHeadX, float  easterIslandHeadY) {
  float pineappleWidth;
float pineappleHeight;
float rockWidth; 
float rockHeight; 
float easterIslandHeadWidth; 
float easterIslandHeadHeight;
groundWidth = width;
groundHeight = (height / 3) * 2;
pineappleWidth = 100;
pineappleHeight = 150;
rockWidth = 120;
rockHeight = 60;
easterIslandHeadWidth = 80;
easterIslandHeadHeight = 120;
// Pineapple House
fill(255, 200, 0); 
rect(pineappleX, pineappleY, pineappleWidth, pineappleHeight); 
fill(0, 255, 0); 
triangle(pineappleX - 20, pineappleY, pineappleX + pineappleWidth / 2, pineappleY - 50, pineappleX + pineappleWidth + 20, pineappleY); 

// Rock House
fill(93,62,59); 
ellipse(rockX, rockY, rockWidth, rockHeight); 

// Easter Island Head House
fill(100, 100, 100); 
rect(easterIslandHeadX, easterIslandHeadY, easterIslandHeadWidth, easterIslandHeadHeight); 
ellipse(easterIslandHeadX + easterIslandHeadWidth / 2, easterIslandHeadY, easterIslandHeadWidth * 0.6, 20); 
}
void drawGround(  float groundX, float groundY  ){  
fill( #00008B);
rect(groundX, groundY, groundWidth, groundHeight);
}
void resetDroidloc( int screenNumber){  
if( screenNumber==1 ){              
face.x=30; 
face.y=30;
}
if( screenNumber==3 ){  

}


}

void controlMovement() {
  if (key == CODED) {
    switch(keyCode) {
      case UP: face.y -= 5; break;
      case DOWN: face.y += 5; break;
      case LEFT: face.x -= 5; break;
      case RIGHT: face.x += 5; break;
    }
  }
}
void stars(  ){  
  fill( 255 );
 ellipse( random( 0,width  ),random( 0,height ),10,10 );
 noFill();
 }
 void moveSpongeBottomRight() {
  face.x = width - faceSize - 10;
  face.y = height - faceSize - 10; 
}
