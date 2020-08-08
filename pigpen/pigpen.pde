final float PIGWIDTH = 200;
final float PIGHEIGHT = 200;
final float BUTSIZE = 400;
ArrayList<pig> pigs;
int state, resets;
button bstart, breset;
Librarian log;

void setup() {
  frameRate(50);
  fullScreen();
  resets = 0;
  log = new Librarian(day() + "." + month() + "." + year() + "_" + hour() + "." + minute() + "." + second());
  setupState0();
}

void generate() {
  background(255, 255, 255);
  if (state == 0) {
    bstart = new button(width/2, height - height/4, BUTSIZE, BUTSIZE, "Начать");
    bstart.tadjust(width/2 - 105, height - height/4 + 20);
    bstart.place();
    String intro = "Вы увидите перед собой 9 свиней в большом квадратном загоне. \n Ваша задача - разместить ещё 2 квадратных загона таким образом, чтобы \n каждая свинья была изолирована в собственном индивидуальном загоне. \n Линии рисуются пальцем, кнопка Заново удаляет линии.";
    fill(50);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    text(intro, width/2, height/2);
  }
  if (state == 1) {
    for (int i = 0; i < pigs.size(); i++) {
      pigs.get(i).place();
    }
    breset = new button(width/13, 2*height/6, BUTSIZE, BUTSIZE, "Заново");
    breset.tadjust(width/13, 2*height/6);
    breset.place();
  }
}

void draw() {
  if (state == 1) {
    System.out.println(frameRate);
  }
}

void mouseDragged() {
  if (state == 1) {
    String buf = millis() + "," + mouseX + "," + mouseY + "," + state + "," + resets + "," + "DRAW";
    log.write(buf);
    fill(color(0, 0, 0));
    strokeWeight(12);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mousePressed() {
  if (state == 0) {
    if (bstart.isPressed()) {
      String buf = millis() + "," + mouseX + "," + mouseY + "," + state + "," + resets + "," + "START";
      log.write(buf);
      setupState1();
    }
  }
  if (state == 1) {
    if (breset.isPressed()) {
      resets++;
      String buf = millis() + "," + mouseX + "," + mouseY + "," + state + "," + resets + "," + "RESET";
      log.write(buf);
      setupState1();
    } else {
      String buf = millis() + "," + mouseX + "," + mouseY + "," + state + "," + resets + "," + "DPRESS";
      log.write(buf);
    }
  }
}

void mouseReleased() {
  if (state == 1) {
    if (breset.isPressed() == false) {
      String buf = millis() + "," + mouseX + "," + mouseY + "," + state + "," + resets + "," + "DRELEASE";
      log.write(buf);
    }
  }
}

void keyPressed() {
  if (key == 'q' || key == 'Q' || key == 'й' || key == 'Й') {
    String buf = millis() + "," + mouseX + "," + mouseY + "," + state + "," + resets + "," + "EXIT";
    log.write(buf);
    exit();
  }
}


void setupState0() {
  state = 0;
  generate();
}

void setupState1() {
  state = 1;

  stroke(0);
  strokeWeight(10);

  float penheight = height/25;
  float penwidth = ((width - height)/2) + penheight;

  float step = (height - (height*2)/25)/6;

  float firstX = penwidth + step - PIGWIDTH/2;
  float firstY = penheight + step - PIGHEIGHT/2;

  float secondX = firstX + 2*step;
  float secondY = firstY + 2*step;

  float thirdX = secondX + 2*step;
  float thirdY = secondY + 2*step;

  pigs = new ArrayList<pig>();

  pigs.add(new pig(firstX, firstY, PIGWIDTH, PIGHEIGHT));
  pigs.add(new pig(secondX, firstY, PIGWIDTH, PIGHEIGHT));
  pigs.add(new pig(thirdX, firstY, PIGWIDTH, PIGHEIGHT));

  pigs.add(new pig(firstX, secondY, PIGWIDTH, PIGHEIGHT));
  pigs.add(new pig(secondX, secondY, PIGWIDTH, PIGHEIGHT));
  pigs.add(new pig(thirdX, secondY, PIGWIDTH, PIGHEIGHT));

  pigs.add(new pig(firstX, thirdY, PIGWIDTH, PIGHEIGHT));
  pigs.add(new pig(secondX, thirdY, PIGWIDTH, PIGHEIGHT));
  pigs.add(new pig(thirdX, thirdY, PIGWIDTH, PIGHEIGHT));


  generate();

  line(penwidth, penheight, penwidth + height - penheight, penheight);
  line(penwidth, penheight, penwidth, height - penheight);
  line(penwidth + height - penheight, height - penheight, penwidth, height - penheight);
  line(penwidth + height - penheight, height - penheight, penwidth + height - penheight, penheight);
}