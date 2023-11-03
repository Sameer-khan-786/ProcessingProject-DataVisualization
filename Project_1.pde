int currentProgram = 1; // First program will run when you run the code
PVector focalPoint;    // focal point
color[] rainbowColors; // rainbowColors array
boolean toggle = false;
float max_distance;
int gridSize = 40;

void setup() 
{
  size(800, 450); // size of the screen
  noStroke();   
  max_distance = dist(0, 0, width, height);
  focalPoint = new PVector(width/2, height/2);
  drawMenu(); // Draw Menu
  
  rainbowColors = new color[] 
  {
    color(148, 0, 211),  // Violet
    color(75, 0, 130),   // Indigo
    color(0, 0, 255),    // Blue
    color(0, 128, 0),    // Green
    color(255, 255, 0),  // Yellow
    color(255, 165, 0),  // Orange
    color(255, 0, 0)     // Red
  };
}

void draw() 
{
  if (currentProgram == 1) 
  {
    background(0); // Clear the background
    focalPoint();  // Draw Task 1
  } 
  else if (currentProgram == 2) 
  {
    background(0); // Clear the background
    distance2D();  // Draw Task 2
  } 
  else if (currentProgram == 3) 
  {
    background(0); // Clear the background
    rainbowStates();    // Draw Task 3
  }
  drawMenu();  // Redraw the menu
}

void drawMenu() 
{
  // Menu buttons
  fill(100);
  rect(width - 160, 0, 160, height);

  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Menu", width - 80, 30);

  // Program 1 button
  fill(0);
  rect(width - 150, 60, 140, 40);
  fill(255);
  text("Focal Point", width - 80, 80);

  // Program 2 button
  fill(0);
  rect(width - 150, 120, 140, 40);
  fill(255);
  text("Distance 2D", width - 80, 140);

  // Program 3 button
  fill(0);
  rect(width - 150, 180, 140, 40);
  fill(255);
  text("Rainbow States", width - 80, 200);
}

void mousePressed() 
{
  // Check which button was clicked
  if (mouseX > width - 150 && mouseX < width - 10) 
  {
    if (mouseY > 60 && mouseY < 100) 
    {
      currentProgram = 1;
    } 
    else if (mouseY > 120 && mouseY < 160) 
    {
      currentProgram = 2;
    } 
    else if (mouseY > 180 && mouseY < 220) 
    {
      currentProgram = 3;
    }
  }

  // Change the focal point for Program 1
  if (currentProgram == 1) 
  {
    focalPoint.set(mouseX, mouseY);
  }
}

void mouseClicked() 
{
  // Toggle the state when the left mouse button is clicked for Distance 2D Program
  if (currentProgram == 2) 
  {
    toggle = !toggle;
  } 
  else if (currentProgram == 3) 
  {
    // Rotate the colors for Rainbow States program Program
    color temp = rainbowColors[0];
    for (int i = 0; i < rainbowColors.length - 1; i++) 
    {
      rainbowColors[i] = rainbowColors[i + 1];
    }
    rainbowColors[rainbowColors.length - 1] = temp;
  }
}

void focalPoint() 
{
  drawGrid(gridSize, focalPoint);
}

void drawGrid(int gridSize, PVector focalPoint) 
{
  for (int x = 0; x <= width; x += gridSize) 
  {
    for (int y = 0; y <= height; y += gridSize) 
    {
      noStroke();
      fill(255);
      rect(x-1, y-1, 3, 3);
      stroke(255, 100);
      line(x, y, focalPoint.x, focalPoint.y);
    }
  }
}

void distance2D() 
{
  noStroke();
  if (toggle) 
  {
    // White background and black ellipses
    background(255);
    fill(0);
  } else 
  {
    // Black background and white ellipses
    background(0);
    fill(255);
  }

  for (int i = 0; i <= width; i += 20) 
  {
    for (int j = 0; j <= height; j += 20) 
    {
      float size = dist(mouseX, mouseY, i, j);
      size = size / max_distance * 66;
      ellipse(i, j, size, size);
    }
  }
}

void rainbowStates() 
{
  background(255); // White Background

  PShape usa;
  PShape[] states = new PShape[7];
  String[] stateCodes = {"MI", "IN", "KY", "OH", "WV", "PA", "NY"};

  usa = loadShape("usa-wikipedia.svg"); // Load whole Map

  for (int i = 0; i < stateCodes.length; i++) 
  {
    states[i] = usa.getChild(stateCodes[i]);
  }

  shape(usa, -600, -180);  // Draw the full map

  for (int i = 0; i < states.length; i++) 
  {
    states[i].disableStyle(); // Disable the colors found in the file
    fill(rainbowColors[i]);   // Fill the rainbow colours
    noStroke();
    shape(states[i], -600, -180);
  }
}
