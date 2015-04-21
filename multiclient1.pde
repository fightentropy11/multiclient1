

// Import the net libraries
import processing.net.*;

PImage img;
// Declare a client
Client client;

void setup() {
  size(1236,901);
  //font = loadFont("WaltographUI-Bold-29.vlw");
  img = loadImage("img5.png");
  // Create the Client
  client = new Client(this, "127.0.0.1", 5204); 
  //img2 = loadImage("img2.png");
  background(img);
  
  
}

void draw() {
  
  //background(img);
  drawGrid();
  
  
  
  

  // If there is information available to read from the Server
  if (client.available() > 0) {
    // Read message as a String, all messages end with an asterisk
    String in = client.readStringUntil('*');

    // Print message received
    println( "Receiving:" + in);

    // The client reads messages from the Server and parses them with splitTokens() according to our protocol.    
    int[] vals = int(splitTokens(in, ",*" )); 

    // Render an ellipse based on those values
    //image(img2,1260,501);
    fill(89, 171, 227);
    noStroke();
    ellipse(vals[0], vals[1], 16, 16);
    
  }
}

// Send data whenever the user drags the mouse
void mouseClicked() {
  // Put the String together with our protocol: mouseX comma mouseY asterisk
  String out = mouseX + "," + mouseY + "*" ;
  // A message is sent whenever the mouse is dragged. Note that a client will receive its own messages! Nothing is drawn here!  
  client.write(out); 
  // Print a message indicating we have sent data
  println("Sending: " + out);
}

void drawGrid() {
  
  
  fill(255);
  stroke(190, 192, 195);
  strokeWeight(1);
  rect(0,501,width,100);
  fill(255);
  stroke(190, 192, 195);
  rect(0,601,width,100);
  fill(255);
  stroke(190, 192, 195);
  rect(0,700,width,100);
  
  fill(0,0,0,200);
  textSize(20);
  text("Time",10,550);
  text("Queue",10,650);
  text("Chat",10,750);
  
  
  
  
   
  
}
