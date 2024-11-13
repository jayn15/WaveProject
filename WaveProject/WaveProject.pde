//Main Code

String request = "Draw a green circle at center (56.8,225) with radius 135";

float coordinateX,coordinateY,radius;
String colour;

void setup(){
  size(500,500);
  
  int openBracket = request.indexOf("("); 
  int closedBracket = request.indexOf(")");
  int comma = request.indexOf(",");
  
  String coordinateX = request.substring(openBracket+1, comma);
  String coordinateY = request.substring(comma+1, closedBracket);
  
  println("Coordinate is", coordinateX, coordinateY);
  
  int colourStart = request.indexOf("circle");
  
  colour = request.substring(7,colourStart-1);
  
  println("Colour is", colour);
  
  int radiusStart = request.indexOf("radius ");
  
  radius = float(request.substring(radiusStart+7));
  
  println(radius);
  
}

void draw(){
  background(255,255,255);
  
  if (colour.equals("red")){
    fill(255,0,0);
  }
  else if (colour.equals("green")){
     fill(0,255,0);
  }
  else if (colour.equals("blue")){
    fill(0,0,255);
  }
  else if (colour.equals("black")){
    fill(0,0,0);
  }
  
  else{
    fill (0,0,0);
  }
  circle(coordinateX,coordinateY,radius);

}
  