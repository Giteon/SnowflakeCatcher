Snowflake [] guy;
void setup()
{

  size(500, 500);
  background(0);
  guy = new Snowflake[200];

  for (int i=0; i<guy.length; i++)
  {

    guy[i] = new Snowflake();
  }
}
void draw()   
{   

 ///////////////////////////
 background(0);
  fill(235);
 ellipse(mouseX, mouseY, 200, 200);

    //ellipse(250, 250, 500, 500);
   ////////////////////////
   for (int g=0; g<guy.length; g++) 

   {
    guy[g].erase();
    guy[g].lookDown();
    guy[g].move();
    guy[g].wrap();
    guy[g].show();
    
  }
}

class Snowflake    
{     
  int myX;
  int myY;
  int mySize;
  int sparkleX;
  int sparkleY;
  boolean isMoving = true;
  Snowflake()
  {
    myX = (int)(Math.random()*350+75);
    myY = (int)(Math.random()*350+75);
    mySize = 2;
    sparkleX = (int)(Math.random()*5);
    sparkleY = (int)(Math.random()*5);
  }
  void mouseDragged()
  {
// In mouseDragged() write some code that draws to the screen. When you are happy with your assignment, push your repository to your GitHub account. Submit the url of your working program to the school loop drop box. 
}

void show()
{

  noStroke();
  int randColor = (int)(Math.random()*50+205);
  fill(randColor,randColor,randColor);
   ellipse(myX,myY,sparkleX,sparkleY);
}
void lookDown()
{
  if (myY > 0 && myY < 500 && get(myX,myY+sparkleY)!=color(235))
  {
    isMoving = false;
  }
  else
  {
    isMoving = true;
    sparkleX = sparkleX + (int)(Math.random()*8-4);
    sparkleY = sparkleY + (int)(Math.random()*8-4);
    if (sparkleX == sparkleY)
    {
      if(Math.random()>0.5)
      {
        sparkleX = 4;
        sparkleY = 1;
      }
      else 
      {
        sparkleX = 1;
        sparkleY = 4;
      }
    }
    if (sparkleX > 5)
    {
      sparkleY = 1;
      sparkleX = 5;
    }
    if (sparkleX < 1)
    {
      sparkleX = 1;
    }
     if (sparkleY > 5)
    {
      sparkleX = 1;
      sparkleY = 5;
    }
    if (sparkleY < 1)
    {
      sparkleY = 1;
    }
  }
    // void lookDown() checks if y is between the top and bottom of the screen, and the position just below (x,y) is not black. 
//If so, set isMoving to false; otherwise set isMoving to true 
}
void erase()
{
  fill(0);
  ellipse(myX,myY,sparkleX+(sparkleX/2),sparkleY+(sparkleY/2));
}
void move()
{
  if(isMoving)
  {
    myY ++;
  }
   // void move() which checks if the snow flake isMoving. If it is, increase y by one

 }
 void wrap()
 {
  if (myY > 494)
  {
      // myY < 0;
      // myX = (int)(Math.random()*500);

      myX = (int)(Math.random()*500);
      myY = (int)(Math.random()*500);
    }
    // void wrap() which checks if the y coordinate is off the bottom of the screen. 
//If it is, set y to 0 and generate a new random x coordinate
}
}
