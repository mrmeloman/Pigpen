class pig{
  PImage sprite;
  float x;
  float y;
  float width;
  float height;
  
  pig(float x, float y, float width, float height){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    sprite = loadImage("pig.png");
    this.place();
  }
  
  public void place(){
    image(sprite,x,y,width,height);
  }
}