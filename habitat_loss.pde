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

PImage img;


// Processing Standard Functions
void settings() 
{
  //size(1280, 180, P3D);
  size(canvasW/4, canvasH/4, P3D);
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
    amazonas = new CellularAutomata("Amazonas", amazonasX, amazonasY, amazonasWidthPixels, height, cellSizePixels, 323);
}

void draw(){
background(255,0,0);
}
