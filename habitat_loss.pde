int canvasW = 7680;
int canvasH = 1080;
PGraphics canvas;


CellularAutomata amazonas;
CellularAutomata roraima;
CellularAutomata acre;
CellularAutomata mattogrosso;
CellularAutomata rondonia;
CellularAutomata maranhao;
CellularAutomata para;
CellularAutomata tocantins;
CellularAutomata amapa;

ArrayList<CellularAutomata> regions = new ArrayList<CellularAutomata> ();

PImage img;


// Processing Standard Functions
void settings() 
{
  //size(1280, 180, P3D);
  size(canvasW/2, canvasH/2, P3D);
  PJOGL.profile=1;
}

void setup() {
  canvas = createGraphics(canvasW, canvasH, P3D);
  img = loadImage("Amazonas_Illustartion_3_Linien_1.png");

  float cellSizePixels = 10;


  //x und y position des CellularAutomata
  float amazonasWidthPixels = 1637;
  float amazonasX = 1170;
  float amazonasY = 0;
  amazonas = new CellularAutomata("Amazonas", amazonasX, amazonasY, amazonasWidthPixels, canvas.height, cellSizePixels, 323);

  regions.add(amazonas);  

  frameRate(10);
}

void draw() {

  canvas.beginDraw();
  canvas.background(0);
  // Top-left corner of the img is at (0, 0)
  // Width and height are the img's original width and height
  canvas.image(img, 0, 0);

  //update and draw all regions
  for (CellularAutomata r : regions) {
    r.update();
    r.draw();
  }

  canvas.endDraw();
  
   image(canvas, 0, 0, width, height);
}

// mouse press to change the value of a grid cell
void mousePressed() {

    //each mouse click activates another region
    for (CellularAutomata r : regions) {
      //map to canvas size
      float mx = map(mouseX,0,width,0,canvasW);
      float my = map(mouseY,0,height,0,canvasH);
      println("mx: " + mx + " my: " + my);
        r.mousePressed(mx, my);
    }

}
