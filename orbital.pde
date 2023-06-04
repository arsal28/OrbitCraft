class Orbital {
  float Ox, Oy; // x and y pos of tool
  float def_Ox, def_Oy; // default position of tool
  boolean isDragging = false; // drag state
  
  // Constructor
  Orbital(float x, float y) {
    Ox = x;
    Oy = y;
    def_Ox = x;
    def_Oy = y;
  }
  
  void display() { 
    fill(128, 128, 128);
    stroke(0);
    strokeWeight(2);
    circle(Ox, Oy, 45);
    //System.out.println(String.valueOf(Ox) + ", " + String.valueOf(Oy));
  }
  
  boolean contains(int x, int y) {
    // Calculate the distance between the given coordinates and the center of the circle
    float distance = dist(x, y, Ox, Oy);

    // Check if the distance is less than the radius of the circle
    return distance < 22.5;
  }
  
  void startDrag(int x, int y) {
    isDragging = true;

    // Calculate the offset between the mouse position and the orbitals's position
    float offsetX = x - Ox;
    float offsetY = y - Oy;

    // Update the orbital's position to match the mouse position
    updatePosition(x - offsetX, y - offsetY);
  }
  
  // Update position of orbital
  void updatePosition(float x, float y) { 
    Ox = x;
    Oy = y;
  }
  
  void stopDrag() {
    isDragging = false;
  }
  
  Orbital clone() {
    return new Orbital(def_Ox, def_Oy);
  }
}
