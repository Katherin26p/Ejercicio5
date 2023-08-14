int dashLength = 10; 
boolean drawDash = true; 
PImage fondo;
void setup() {
  size(500, 500);
  fondo = loadImage("fondo.png");
}

void draw() {
  background(255);
  image(fondo,0,0);
 ellipse(width/2,height/2,50,50);
  float centerX = width / 2; 
  float centerY = height / 2;
  float mouseXPos = mouseX; 
  float mouseYPos = mouseY; 

  stroke(0);
  if (dist(centerX, centerY, mouseXPos, mouseYPos) > dashLength) {
    float angle = atan2(mouseYPos - centerY, mouseXPos - centerX);
    float dx = cos(angle) * dashLength;
    float dy = sin(angle) * dashLength;

    float x = centerX;
    float y = centerY;

    while (dist(x, y, centerX, centerY) < dist(centerX, centerY, mouseXPos, mouseYPos)) {
      if (drawDash) {
        line(x, y, x + dx, y + dy);
      }
      x += dx * 2;
      y += dy * 2;
      drawDash = !drawDash;
    }
  }
}
