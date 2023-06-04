import java.util.ArrayList;

ArrayList<Orbital> orbitalArray; // list that stores orbital tool
Orbital currentO; // reference to currently dragged orbital tool

ArrayList<Electron1> E1Array; // list that stores electron one tool
Electron1 currentE1; // reference to currently dragged electron one tool

ArrayList<Electron2> E2Array; // list that stores electron two tool
Electron2 currentE2; // reference to currently dragged electron two tool

// Images 
PImage img_e1;
PImage img_e2;
PImage img_PT; 

// Toolbox
toolBox tB; 

Diagram d; // Orbital diagram
Element e;  // Element 

// SETUP
void setup() {
  size(1600, 900);
  
  // Creating element check
  e = new Element();
  
  // Creating toolbox
  tB = new toolBox();
  
  // Creating diagram skeletal structure
  d = new Diagram();
  
  // Load images 
  img_e1 = loadImage("electron_one.png");
  img_e2 = loadImage("electron_two.png");
  img_PT = loadImage("table.png");
  
  orbitalArray = new ArrayList<Orbital>();
  E1Array = new ArrayList<Electron1>();
  E2Array = new ArrayList<Electron2>();
  
  // Create initial orbital tool and add to respective list
  Orbital initialO = new Orbital(1400, 150);
  orbitalArray.add(initialO);
  
  // Create initial electron one tool and add to respective list
  Electron1 initialE1 = new Electron1(1200, 150);
  E1Array.add(initialE1);
  
  // Create initial electron two tool and add to respective list 
  Electron2 initialE2 = new Electron2(1300, 150); 
  E2Array.add(initialE2);
}

String[] elements = {"Hydrogen","Helium","Lithium","Beryllium","Boron","Carbon","Nitrogen","Oxygen","Fluorine","Neon","Sodium","Magnesium","Aluminum","Silicon","Phosphorus","Sulfur","Chlorine","Argon","Potassium","Calcium","Scandium","Titanium","Vanadium","Chromium","Manganese","Iron","Cobalt","Nickel","Copper","Zinc","Gallium","Germanium","Arsenic","Selenium","Bromine","Krypton","Rubidium","Strontium","Yttrium","Zirconium","Niobium","Molybdenum","Technetium","Ruthenium","Rhodium","Palladium","Silver","Cadmium","Indium","Tin","Antimony","Tellurium","Iodine","Xenon","Cesium","Barium","Lanthanum","Cerium","Praseodymium","Neodymium","Promethium","Samarium","Europium","Gadolinium","Terbium","Dysprosium","Holmium","Erbium","Thulium","Ytterbium","Lutetium","Hafnium","Tantalum","Tungsten","Rhenium","Osmium","Iridium","Platinum","Gold","Mercury","Thallium","Lead","Bismuth","Polonium","Astatine","Radon"};
int n = 0; // number of electrons
String unchecked = "Unchecked";

// PROGRAM LOOP
void draw() {
  background(112, 154, 225);  
  fill(128, 128, 128);
  
  // Clear button
  if (tB.clicked()) {
    orbitalArray.clear();
    E1Array.clear();
    E2Array.clear();
  }
  
  // Display check answer button and periodic table
  rectMode(CENTER);
  rect(1312.5, 550, 500, 263);
  imageMode(CENTER);
  image(img_PT, 1312.5, 550, 480, 243);   
  e.checkBtn();

  // Display toolbox (contains all tools)
  tB.display();
  
  // Display diagram
  d.display();
  
  Electron2 E2 = new Electron2(mouseX, mouseY); // create new instance for electron 
  float E2x = E2.E2x;
  float E2y = E2.E2y;
  
  // Draw grid 
  //for (int y = 800; y > 50; y-=50) { 
  //  for (int x = 150; x < 600; x+=50) {    
  //    fill(112, 154, 225);
  //    stroke(0);
  //    strokeWeight(2);
  //    rect(x, y, 50, 50);
  //  }
  //}
  
  // Display all orbital tools
  for (Orbital initialO : orbitalArray) {
      initialO.display();
  }
  
  // Display all electron one tools
  for (Electron1 initialE1 : E1Array) {
    initialE1.display();
  }
  
  // Display all electron two tools 
  for (Electron2 initialE2 : E2Array) {
    initialE2.display();
  }
  
  // clear drawing button 
  tB.clearDrawing();
  
  text("Element: " + unchecked, 1220, 825);
}

// MOUSE EVENT LISTENERS
void mousePressed() {
  // to check if mouse is within any orbital tool in respective array
  for (Orbital initialO : orbitalArray) {
    if (initialO.contains(mouseX, mouseY)) {
      currentO = initialO;
      currentO.startDrag(mouseX, mouseY);
      return; // Exit the function after finding a match
    }
  }
  
  // to check if mouse is within any electron one tool in respective array
  for (Electron1 initialE1 : E1Array) {
    if (initialE1.contains(mouseX, mouseY)) {
      currentE1 = initialE1;
      currentE1.startDrag(mouseX, mouseY);
      return; // Exit the function after finding a match
    }
  }
  
  // to check if mouse is within any electron two tool in respective array
  for (Electron2 initialE2 : E2Array) {
    if (initialE2.contains(mouseX, mouseY)) {
      currentE2 = initialE2;
      currentE2.startDrag(mouseX, mouseY);
      return; // Exit the function after finding a match
    }
  }
}

void mouseDragged() {
  // Move the currently selected object
  if (currentO != null) {
    currentO.updatePosition(mouseX, mouseY);
  } else if (currentE2 != null) {
    currentE2.updatePosition(mouseX, mouseY);
  } else if (currentE1 != null) {
    currentE1.updatePosition(mouseX, mouseY);
  }
}

void mouseReleased() {
  
  // Stop dragging orbital
  if (currentO != null) {
    currentO.stopDrag();
    
    if (mouseX > 150 && mouseX < 600 && mouseY > 50 && mouseY < 850) {
      
      // Snap to the nearest grid square
      int gridX = round(mouseX / 50);
      int gridY = round(mouseY / 50);
      float snappedX = gridX * 50 + 25; // Adding 25 to snap to the center of the square
      float snappedY = gridY * 50 + 25; // Adding 25 to snap to the center of the square
      
      currentO.updatePosition(snappedX, snappedY);
      currentO = null;
    } else {
      currentO = null;
    }
  }
  
  // Stop dragging electron one
  if (currentE1 != null) {
    currentE1.stopDrag();
    if (mouseX > 150 && mouseX < 600 && mouseY > 50 && mouseY < 850) {
      
      // Snap to the nearest grid square
      int gridX = round(mouseX / 50);
      int gridY = round(mouseY / 50);
      int snappedX = gridX * 50 + 20; // Adding 25 to snap to the center of the square
      int snappedY = gridY * 50 + 25; // Adding 25 to snap to the center of the square
      
      currentE1.updatePosition(snappedX, snappedY);
      currentE1 = null;
    } else {
      currentE1 = null;
    }
  }
  
  // Stop dragging electron two
  if (currentE2 != null) {
    currentE2.stopDrag();
    if (mouseX > 150 && mouseX < 600 && mouseY > 50 && mouseY < 850) {
      
      // Snap to the nearest grid square
      int gridX = round(mouseX / 50);
      int gridY = round(mouseY / 50);
      int snappedX = gridX * 50 + 25; // Adding 25 to snap to the center of the square
      int snappedY = gridY * 50 + 25; // Adding 25 to snap to the center of the square
      
      currentE2.updatePosition(snappedX, snappedY);
      currentE2 = null;
    } else {
      currentE2 = null;
    }
  }
}

void mouseClicked() {
  // Check button (WIP)
  if (e.clicked()) {
    unchecked = elements[n];
    n = 19;
  } 
}


// KEYBOARD EVENT LISTENER
void keyPressed() {
  if ( key == 'o' || key == 'O') {
    if (orbitalArray.size() > 0) {
      Orbital lastOrbital = orbitalArray.get(orbitalArray.size() - 1);
      Orbital clonedOrbital = lastOrbital.clone();
      orbitalArray.add(clonedOrbital);
      println(orbitalArray);
    } else {
      Orbital initialO = new Orbital(1400, 150);
      orbitalArray.add(initialO);
    } 
  }
  
  if ( key == '1') {
    if (E1Array.size() > 0) {
      Electron1 lastE1 = E1Array.get(E1Array.size() - 1);
      Electron1 clonedE1 = lastE1.clone();
      E1Array.add(clonedE1);
    } else {
      Electron1 initialE1 = new Electron1(1200, 150);
      E1Array.add(initialE1);
    }
  }
  
  if ( key == '2') {
    if (E2Array.size() > 0) {
      Electron2 lastE2 = E2Array.get(E2Array.size() - 1);
      Electron2 clonedE2 = lastE2.clone();
      E2Array.add(clonedE2);
    } else {
      Electron2 initialE2 = new Electron2(1300, 150);
      E2Array.add(initialE2);
    }
  }
}
