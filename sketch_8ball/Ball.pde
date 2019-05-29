class Ball implements isCollideable {
  int counter;
  int x, y;
  int c1, c2, c3;
  float speed;
  float angle;
  boolean solid;
  int number;

  Ball(int xx, int yy, int r, int g, int b, boolean s, int num) {
    counter=0;
    x=xx;
    y=yy;
    c1 = r;
    c2 = g;
    c3 = b;
    speed=0;
    angle=0;
    solid = s;
    number = num;
    //INSTANCE VARIABLES
  }
  Ball() {
  }
  
  int getx(){
    return x;
  }
  int gety(){
    return y;
  }
  
  void setx(int n){
    x=n;
  }
  void sety(int n){
    y=n;
  }
  
  void display() {
    if(solid){
    fill(c1, c2, c3);
    circle(x, y, 30);
    ellipseMode(CENTER);  // Set ellipseMode to CENTEr
    fill(255);  // Set fill to white
    ellipse(x, y, 13, 13);  // Draw white ellipse using CENTER mode
    fill(0, 0, 0);
    textSize(12);
    text(number, x-4, y+5); 
    }
    else{
      fill(255, 255, 255);
      circle(x, y, 30);
      fill(c1, c2, c3);
      rect(x-15, y-5, 30, 10);
    }
  }
  boolean bounce() {
    if (x<85) {
      if ((y<88 && angle>90 && angle<180) || (y>559 && angle>180 && angle<270)) {
        goin();
      } else {
        angle=180-angle;
      }
      return true;
    }
    if (x>1105) {
      if ((y<88) || (y>559)) {
        goin();
      } else {
        angle=180-angle;
        //angle=(int)(Math.random()*180)+90;
        //CODE INSPIRED BY KAITLYN DUONG^^^^
      }
      return true;
    }
    if (y<72) {
      if (x>578 && x<618) {
        goin();
      } else {
        angle=360-angle;
      }
      return true;
    }
    if (y>560) {
      if (x>578 && x<618) {
        goin();
      } else {
        angle=360-angle;
      }
      return true;
    }
    return false;
  }
  
  void goin() {
    speed=0;
    balls.remove(this);
  }
  
  boolean isTouching(Ball b){
    return(x/45==b.getx()/45 && y/45==b.gety()/45);
  }

  
  boolean anytouches(){
    for(Ball b:balls){
      if(this.isTouching(b)){
        return true;
      }
      }
    return false;
  }
  
  void move() {
    ArrayList<Ball> touching;
    touching=checkTouch();
    for(Ball i:touching){
      //hit(); ADD IN LATER
      i.transferspeed(speed/2);
      i.transferangle(angle);
      angle+=180;
    }
    x+=cos((float)(angle))*speed;
    y-=sin((float)(angle))*speed;
    if (bounce()) {
      for (int i=0; i<3; i++) {
        x+=cos((float)(angle))*speed;
        y+=sin((float)(angle))*speed;
      }
    }

    touching=checkTouch();
    for(Ball i:touching){
      i.transferspeed(speed/2);
      angle+=180;
    }
   if(speed!=0 && counter%3==0){
      speed--;
    }
   counter++;

  }
  
 ArrayList<Ball> checkTouch(){
    ArrayList<Ball> temp= new ArrayList<Ball>();
    for(Ball b:balls){
      if(isTouching(b)){
        temp.add(b);
      }
    }
    return temp;
  }
      
  boolean transferspeed(float power) {
    speed+=power/2;
    return true;
  }
  boolean transferangle(float ang) {
    angle = ang;
    return true;
  }
}
