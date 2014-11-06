float waxAndWane = 0;
boolean wanedLeft = true;
boolean wanedRight = false;
Snowflake [] guy;
void setup()
{
noCursor();
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

  background(0);
  fill(205);
  ellipse(mouseX, mouseY, 200, 200);
  fill(0);
  ellipse(mouseX+waxAndWane, mouseY, 205, 205);
  //waxAndWane = mouseX-250;

  if (waxAndWane <=-210)
  {
    wanedLeft = true;
    wanedRight = false;
  }
  if (wanedLeft == true)
  {
    if (waxAndWane <210)
    {
      //start
      if (frameCount > 200)
     {
        //start
        waxAndWane +=0.04;
     }
    }
    //start
  }
  //start
  if (waxAndWane>=210 )
  {
    wanedRight = true;
    wanedLeft = false;
  }
  if (wanedRight==true)
  {
    if (waxAndWane>-210)
    {
      waxAndWane -=0.04;
    }
  }

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
  float myY;
  int mySize;
  int sparkleX;
  int sparkleY;
  boolean isMoving = true;
  Snowflake()
  {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
    mySize = 2;
    sparkleX = (int)(Math.random()*5);
    //    sparkleY = (int)(Math.random()*5);
    if (sparkleX == 3)
    {
      sparkleX = (int)(Math.random()*5);
    }
    if (sparkleX == 1)
    {
      sparkleY = 5;
    }
    else if (sparkleX == 2)
    {
      sparkleY = 4;
    }
    else if (sparkleX == 4)
    {
      sparkleY = 2;
    }
    else 
    {
      sparkleY = 1;
    }
  }
  void show()
  {

    noStroke();
    int randColor = (int)(Math.random()*155+100);
    if (get(myX, myY+sparkleY)!=color(205))
    {
      fill(randColor, randColor, randColor);
    }
    else
    {
      fill(0);
    }
    ellipse(myX, myY, sparkleX, sparkleY);
    ellipse(myX, myY, sparkleY, sparkleX);
  }
  void lookDown()
  {
    if (myY > 0 && myY < 500 && get(myX, myY+sparkleY)!=color(205))
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
        if (Math.random()>0.5)
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
    ellipse(myX, myY, sparkleX+(sparkleX/2), sparkleY+(sparkleY/2));
  }
  void move()
  {
    if (isMoving)
    {
      myY +=1.5;
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
