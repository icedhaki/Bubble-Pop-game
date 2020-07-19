Bubble bubble;
Bubble bubble1;
Bubble bubble2;
Bubble bubble3;
Bubble bubble4;
Bubble bubble5;
Bubble bubble6;

int counter=0;
int count=0;
String l,u,s,t,v,g,k,h;

float color1=random(100,255);
float color2=random(100,255);
float color3=random(100,255);

void setup(){
  size(500,500);
  bubble=new Bubble();
  bubble1=new Bubble();
  bubble2=new Bubble();
  bubble3=new Bubble();
  bubble4=new Bubble();
  bubble5=new Bubble();
  bubble6=new Bubble();
}

void draw(){
  background(255);
  
  if(count==0){
    fill(0);
    textSize(20);
    t="Bubble Pop Game";
    g="Press 'Start' to start, 'Exit' to exit";
    v="Press with mouse bubbles in order to pop them";
    k="Speed of bubbles increases as score increases";
    h="Speed of bubbles decreases as you miss them";
    
    text(t,width/3,height/6);
    text(v,width/25,height/4);
    text(g,width/5,height/3);
    text(k,width/25,height/2.4);
    text(h,width/25,height/2);
    
    rectMode(CENTER);
    fill(255);
    float rect1X=width/4;
    float rect2X=3*width/4;
    float rect1Y=2*height/3;
    float rectW=130;
    float rectH=50;
    
    rect(rect1X,rect1Y,rectW,rectH);
    rect(rect2X,rect1Y,rectW,rectH);
    fill(0);
    textSize(20);
    l="Start game";
    text(l,rect1X-(rectW/2.5),rect1Y+rectH/8);
    u="Exit game";
    text(u,rect2X-(rectW/2.5),rect1Y+rectH/8);
    
    // start button
    if(mousePressed==true && mouseX>=rect1X-rectW/2 && mouseX<=rect1X+rectW/2 && mouseY>=rect1Y-rectH/2 && mouseY<=rect1Y+rectH/2){
      count=count+1;
    }
    // exit button
    else if (mousePressed==true && mouseX>=rect2X-rectW/2 && mouseX<=rect2X+rectW/2 && mouseY>=rect1Y-rectH/2 && mouseY<=rect1Y+rectH/2){
      exit();
    }
  }
  
  else{
    for(int i=50;i<width;i=i+100){
      for(int j=70;j<width;j=j+100){
        rectMode(CENTER);
        fill(0,color1,0);
        rect(i,j,10,100);
        fill(color2,color1,0);
        ellipse(i+20,j+20,50,50);
        ellipse(i+20,j-20,50,50);
        ellipse(i-20,j+20,50,50);
        ellipse(i-20,j-20,50,50);
        fill(color3,0,0);
        ellipse(i,j,30,30);
      }
    }
    
    bubble.display();
    bubble.move();
    bubble.reset();
    
    bubble1.display();
    bubble1.move();
    bubble1.reset();
    
    bubble2.display();
    bubble2.move();
    bubble2.reset();
    
    bubble3.display();
    bubble3.move();
    bubble3.reset();
    
    bubble4.display();
    bubble4.move();
    bubble4.reset();
    
    bubble5.display();
    bubble5.move();
    bubble5.reset();
    
    bubble6.display();
    bubble6.move();
    bubble6.reset();
    
    s=Integer.toString(counter);
    fill(0);
    textSize(16);
    text("Score:",20,20);
    text(s,70,20);
  }
}

class Bubble{
  float bubbleX;
  float bubbleY;
  float bubbleR;
  float direction;
  float speed;
  float r,g,b;
  
  Bubble(){
    
    bubbleY=height;
    bubbleR=random(40,80);
    bubbleX=random(5+bubbleR/2,width-5-bubbleR/2);

    speed=2;
    direction=random(-2,2);
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
  }
  
  void display(){
    fill(r,g,b);
    ellipse(bubbleX,bubbleY,bubbleR,bubbleR);
  }
  
  void move(){
    bubbleX = bubbleX + random(-1, 1) * speed;
    bubbleY = bubbleY - speed - counter;
    if(bubbleY<=0){
      r=random(0,255);
      g=random(0,255);
      b=random(0,255);
      bubbleX=random(0,width);
      bubbleY=height;
      bubbleR=random(40,80);
      counter=counter-1;
    }
  }
  
  void reset(){
    if(mousePressed==true && mouseX>=bubbleX-bubbleR/2 && mouseX<=bubbleX+bubbleR/2 && mouseY>=bubbleY-bubbleR/2 && mouseY<=bubbleY+bubbleR/2){
      r=random(0,255);
      g=random(0,255);
      b=random(0,255);
      bubbleX=random(0,width);
      bubbleY=height;
      bubbleR=random(40,80);
      counter=counter+1;
    }
   
  }
  
}
