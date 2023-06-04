class Electron1 {
  int E1x, E1y; // x and y pos of tool
  int def_E1x, def_E1y; // default position of tool
  boolean isDragging = false;
  
  // Constructor
  Electron1(int x, int y) {
    E1x = x;
    E1y = y;
    def_E1x = x;
    def_E1y = y;
  }
  
  boolean contains(int x, int y) {
    // Calculate the boundaries of the image
    int left = E1x - 20;
    int right = E1x + 20;
    int top = E1y - 20;
    int bottom = E1y + 20;
  
    // Check if the given coordinates are within the boundaries of the image
    return (x > left && x < right && y > top && y < bottom);
  }
  
  void startDrag(int x, int y) {
    isDragging = true;

    // Calculate the offset between the mouse position and the electron one's position
    int offsetX = x - E1x;
    int offsetY = y - E1y;

    // Update the electron one's position to match the mouse position
    updatePosition(x - offsetX, y - offsetY);
  }
  
  // Update position of image
  void updatePosition(int x, int y) { 
    E1x = x;
    E1y = y;
  }
  
  void stopDrag() {
    isDragging = false;
  }
  
  Electron1 clone() {
    return new Electron1(def_E1x, def_E1y);
  }
  
  void display() {
    imageMode(CENTER);
    image(img_e1, E1x, E1y, 40, 40);
  }
}
