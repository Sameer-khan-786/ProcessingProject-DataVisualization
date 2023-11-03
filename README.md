# ProcessingProject-DataVisualization
The primary goal of this project is to manipulate graphics objects/images using Processing. The Distance 2D example should be modified so that the size of the ellipses are toggled. Get Child example should be modified so that the 7 states' colors rotates through the rainbow colors.
# PROJECT 1
By:- Sameer Khan

# Explanation:
Upon running the code, a graphical interface is displayed with a menu located in the upper right corner of the window. This menu allows the user to select one of several programs to run. The dimensions of the display window are set to 800 pixels in width and 450 pixels in height, with adequate space allocated for the menu. By default, the first program is executed when the code is run, but the user can easily switch to other tasks from the menu. Below is an initial screenshot of the interface:
 
•	For the Embedding Iteration program (1st Task), the focal point can be chosen by clicking the mouse. This allows the user to dynamically adjust the focal point for this program.
•	For the Distance 2D program (2nd Task), the size of the ellipses toggles between two states when the left mouse button is clicked. This interactive feature provides a dynamic visual effect in response to user input.
•	For the Get Child program (3rd Task), the colors of 7 states rotate through a sequence of rainbow colors each time the mouse is clicked.
•	rect() function is used to generate interactive buttons within the menu interface. The command fill(0) assigns a black color for the buttons background, while fill(100) assigns a grayish tone for the menu's background.
•	When you click the mouse, the void mouseClicked() function is activated. What it does can change depending on the program you're using. It might do different things in different situations.
•	The void mousePressed() function is called whenever you press a mouse button. It checks which button you pressed and changes the currentProgram variable accordingly.
•	The drawMenu() function makes a menu on screen with buttons for different programs.
•	The function void draw() keeps running continuously after the setup. It uses different functions to show different things on the screen, depending on the currentProgram's value.
