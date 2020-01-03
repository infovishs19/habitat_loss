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


float roraimaWidthPixels = 235;
    float roraimaX = 2807;
    float roraimaY = 0;
    roraima = new CellularAutomata("Roraima", roraimaX, roraimaY, roraimaWidthPixels, canvas.height, cellSizePixels, 103);
    
    float acreWidthPixels = 173;
    float acreX = 3042;
    float acreY = 0;
    acre = new CellularAutomata("Acre", acreX, acreY, acreWidthPixels, canvas.height, cellSizePixels, 129);

    float mattogrossoWidthPixels = 947;
    float mattogrossoX = 3215;
    float mattogrossoY = 0;
    mattogrosso = new CellularAutomata("Matto Grosso", mattogrossoX, mattogrossoY, mattogrossoWidthPixels, canvas.height, cellSizePixels, 1224);

    float rondoniaWidthPixels = 251;
    float rondoniaX = 4162;
    float rondoniaY = 0;
    rondonia = new CellularAutomata("Rondonia", rondoniaX, rondoniaY, rondoniaWidthPixels, canvas.height, cellSizePixels, 463);

    float maranhaoWidthPixels = 348;
    float maranhaoX = 4413;
    float maranhaoY = 0;
    maranhao = new CellularAutomata("Maranhao", maranhaoX, maranhaoY, maranhaoWidthPixels, canvas.height, cellSizePixels, 527);
   
    float paraWidthPixels = 1308;
    float paraX = 4761;
    float paraY = 0;
    para = new CellularAutomata("Para", paraX, paraY, paraWidthPixels, canvas.height, cellSizePixels, 1508);

    float tocantinsWidthPixels = 292;
    float tocantinsX = 6069;
    float tocantinsY = 0;
    tocantins = new CellularAutomata("Tocantins", tocantinsX, tocantinsY, tocantinsWidthPixels, canvas.height, cellSizePixels, 201);


    float amapaWidthPixels = 149;
    float amapaX = 6361;
    float amapaY = 0;
    amapa = new CellularAutomata("Amapa", amapaX, amapaY, amapaWidthPixels, canvas.height, cellSizePixels, 35);



  regions.add(amazonas);  
     regions.add(roraima);
    regions.add(acre);
    regions.add(mattogrosso);
    regions.add(rondonia);
    regions.add(maranhao);
    regions.add(para);
    regions.add(tocantins);
    regions.add(amapa);

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
