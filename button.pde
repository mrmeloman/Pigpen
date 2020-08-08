class button {
  float x, tx, y, ty, width, height;
  String text;
  float r = 0;

  public button(float x, float y, float width, float height, String text) {
    this.x = x;
    this.tx = x;
    this.y = y;
    this.ty = y;
    this.width = width;
    this.height = height;
    this.text = text;
  }

  public button(float x, float y, float width, float height, float r, String text) {
    this.x = x;
    this.tx = x;
    this.y = y;
    this.ty = y;
    this.width = width;
    this.height = height;
    this.r = r;
    this.text = text;
  }

  public button(float x, float y, float width, float height, float tx, float ty, String text) {
    this.x = x;
    this.tx = tx;
    this.y = y;
    this.ty = ty;
    this.width = width;
    this.height = height;
    this.text = text;
  }

  public button(float x, float y, float width, float height, float tx, float ty, float r, String text) {
    this.x = x;
    this.tx = tx;
    this.y = y;
    this.ty = ty;
    this.width = width;
    this.height = height;
    this.r = r;
    this.text = text;
  }

  public void place() {
    stroke(0);
    strokeWeight(5);
    fill(255);
    rectMode(CENTER);
    rect(x, y, width, height, r);
    textSize(64);
    fill(50);
    text(text, tx, ty);
  }

  public void tadjust(float tx, float ty) {
    this.tx = tx;
    this.ty = ty;
  }

  public boolean isPressed() {

    if ((mouseX > this.x - this.width/2 && mouseX < this.x + this.width/2) && (mouseY > this.y - this.height/2 && mouseY < this.y + this.height/2)) {
      return true;
    } else {
      return false;
    }
  }
}
