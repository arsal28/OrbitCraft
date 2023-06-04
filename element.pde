/*
The check for element has not been completed.
*/

class Element {
  
  void display() {  
  }
  
  void checkBtn() {
    
    if (isMouseOverButton()) {
      fill(0,255,0);
    } else {
      fill(0,205,0);
    }
    
    rectMode(CENTER);
    rect(1312.5, 750, 100, 50);
    textSize(25);
    fill(255);
    text("Check", 1280, 757.5);
  }
  
  boolean isMouseOverButton() {
      return mouseX >= 1312.5 - 50 && mouseX <= 1312.5 + 50 && mouseY >= 750 - 25 && mouseY <= 750 + 25;
    }
    
    boolean clicked() {
      return mouseX >= 1312.5 - 50 && mouseX <= 1312.5 + 50 && mouseY >= 750 - 25 && mouseY <= 750 + 25;
    }
}
