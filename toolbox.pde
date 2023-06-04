class toolBox {
  public float tb_x = 1162.5; // x-pos of toolbox
  public float tb_y = 100; // y-pos of toolbox
  
  // Constructor
  toolBox() {
    
  }
  
  void display() {
    textSize(30);
    fill(0);
    text("ToolBox", 1260, 65);
    fill(255);
    rectMode(CORNER);
    rect(tb_x, tb_y, 300, 100);
    textSize(20);
    fill(0);
    text("Press O to create more empty orbitals!", tb_x, 250);
    text("Press 1 to create more single spin electrons!", tb_x, 275);
    text("Press 2 to create more double spin electrons!", tb_x, 300);
  }
  
  void clearDrawing() {
    
    if (isMouseOverButton()) {
      fill(50);
    } else {
      fill(0);
    }
    
    // Draw button
    rectMode(CENTER);
    rect(1312.5, 350, 100, 50);
    textSize(25);
    fill(255);
    text("Clear", 1285, 357.5);
  
  }
  
  boolean isMouseOverButton() {
    return mouseX >= 1312.5 - 50 && mouseX <= 1312.5 + 50 && mouseY >= 350 - 25 && mouseY <= 350 + 25;
  }
  
  boolean clicked() {
    return mousePressed && mouseX >= 1312.5 - 50 && mouseX <= 1312.5 + 50 && mouseY >= 350 - 25 && mouseY <= 350 + 25;
  }
}
