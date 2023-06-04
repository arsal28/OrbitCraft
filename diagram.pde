class Diagram {
  public int y;
  public int count;
  public int electron = 0;
  private String[] orbitals = {"6p", "5d", "4f", "6s", "5p", "4d", "5s", "4p", "3d", "4s", "3p", "3s", "2p", "2s", "1s"};
  
    
  //Constructor
  Diagram() {
   
  }
  
  void display() {
    
    // Title
    fill(0);
    textSize(30);
    text("Orbital Diagram", 450, 65);
    
    // Diagram structure
    stroke(0);
    line(150, 100, 150, 850); // vertical line
    
    // print out orbitals 
    for (int i = 0; i < orbitals.length; i++) {
        text(orbitals[i], 107.5, (50*i)+135);       
    }
    
    // to print out all lines
    for (y = 100; y <= 800; y+=50) {
      line(115, y, 1000, y);
    }
    
    // to print out electrons 
    //for(y = 100; y <= 800; y+=50) {
    //  textSize(15);
    //  text(electron, 140, y+20);
    //}
  }  
}
