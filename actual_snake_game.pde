#include <MeggyJrSimple.h>

//create variable for apple 
int xapple = 0;
int yapple = 0;

//create a boolean statement for eating apples
boolean ateApple = true;

void setup()
{
  MeggyJrSimpleSetup();
}

int speed = 200;
int direction = 0;
int marker = 4;

//defined a struct
struct Point
{
  int x;
  int y;
};

//create a new struct for each point on the snake
Point s1 = {3,4};
Point s2 = {4,4};
Point s3 = {5,4};
Point s4 = {6,4};

//declare an array
Point snakeArray[64] = {s1, s2, s3, s4};


void loop()
{
  drawSnake();
 
//display slate, delay, clear slate
  DisplaySlate();
  delay(speed);
  ClearSlate();
  
  //check buttons
  CheckButtonsPress();
    if(Button_Up)
    direction=0;
    
    if(Button_Right)
    direction=90;
  
    if(Button_Down)
    direction=180;
 
    if(Button_Left)
    direction=270;
  
  

  updateSnake();
  
  drawHead();

//draw apple
   DrawPx(xapple,yapple,Red);
   
//check if ate apple
  if(snakeArray[0].x == xapple && snakeArray[0].y == yapple)
  ateApple=true;
 
//If snake eats apple, beep, move new apple
  if(ateApple)
  {
    xapple = random (8);
    yapple = random(8);
    ateApple = false;
    
    Tone_Start(18182,50);  
  }
}




void drawSnake()
{
   for (int i =  0; i < marker; i++)
  {
    DrawPx(snakeArray[i].x, snakeArray[i].y,Green);
  }
  
}

void drawHead()
{
     DrawPx(snakeArray[0].x, snakeArray[0].y,Red);
     if(direction==0)
       snakeArray[0].y++;
       
     if(direction==90)
       snakeArray[0].x++;
       
     if(direction==180)
       snakeArray[0].y--;
       
     if(direction==270)
       snakeArray[0].x--;
       
     if(snakeArray[0].y > 7)
       snakeArray[0].y = 0;
    
     if(snakeArray[0].y < 0)
       snakeArray[0].y = 7;
     
      if(snakeArray[0].x > 7)
       snakeArray[0].x = 0;
    
     if(snakeArray[0].x < 0)
       snakeArray[0].x = 7;
}
  
  
  
void updateSnake()
{
  for (int i = marker-1; i >0; i--)
  {
      snakeArray[i].x = snakeArray[i-1].x;
      snakeArray[i].y = snakeArray[i-1].y;
  }
  
}
