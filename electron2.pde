class Electron2 {
  int E2x, E2y; // x and y pos of tool
  int def_E2x, def_E2y; // default position of tool
  boolean isDragging = false;
  
  // Constructor
  Electron2(int x, int y) {
    E2x = x;
    E2y = y;
    def_E2x = x;
    def_E2y = y;
  }
  
  boolean withinGrid(int x, int y) {
    return E2x > x && E2x < x +50 && E2y < y && E2y > y - 50;
  }
  
  boolean contains(int x, int y) {
    // Calculate the boundaries of the image
    int left = E2x - 20;
    int right = E2x + 20;
    int top = E2y - 20;
    int bottom = E2y + 20;
  
    // Check if the given coordinates are within the boundaries of the image
    return (x > left && x < right && y > top && y < bottom);
  }
  
  void startDrag(int x, int y) {
    isDragging = true;

    // Calculate the offset between the mouse position and the electron one's position
    int offsetX = x - E2x;
    int offsetY = y - E2y;

    // Update the electron one's position to match the mouse position
    updatePosition(x - offsetX, y - offsetY);
  }
  
  // Update position of image
  void updatePosition(int x, int y) { 
    E2x = x;
    E2y = y;
  }
  
  void stopDrag() {
    isDragging = false;
  }
  
  Electron2 clone() {
    return new Electron2(def_E2x, def_E2y);
  }
  
  void display() {
    image(img_e2, E2x, E2y, 40, 40);
  }
}
