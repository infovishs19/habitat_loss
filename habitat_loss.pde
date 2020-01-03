int canvasW = 7680;
int canvasH = 1080;
PGraphics canvas;


// Processing Standard Functions
void settings() 
{
  //size(1280, 180, P3D);
  size(canvasW/4, canvasH/4, P3D);
  PJOGL.profile=1;
}

void setup() {
  canvas = createGraphics(canvasW, canvasH, P3D);
  
}

void draw(){
background(255,0,0);
}
