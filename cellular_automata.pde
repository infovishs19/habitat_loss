class CellularAutomata {
  
  float x;
  float y;
  String label;
  float limit;
  float pixelWidth;
  float pixelHeight;
  float rectWidth;
  float rectHeight;
  int gridWidth;
  int gridHeight;
  float [][] grid;
  //float [][] newGrid;
  
    //constructor(label, gridWidth, gridHeight, limit, col, colorger, colorger1, colornot) {
    CellularAutomata(String label, float x, float y, float pw, float ph, float cellSize, float limit) {
        //the name of the CellularAutomata, e.g. the Region in the Amazonas
        this.x = x;
        this.y = y;
        this.label = label;
        this.limit = limit;

        this.pixelWidth = pw;
        this.pixelHeight = ph;

        this.rectWidth = cellSize;
        this.rectHeight = cellSize;

        //number of cells in the x and y direction
        // this.gridWidth = gridWidth;
        // this.gridHeight = gridHeight;
        this.gridWidth = floor(this.pixelWidth / this.rectWidth);
        this.gridHeight = floor(this.pixelHeight / this.rectHeight);

        //a two dimensional array to hold the states of all cells
        this.grid = this.create2DArray(this.gridWidth, this.gridHeight);

        //a grid representing the next generation
       // this.newGrid = this.create2DArray(this.gridWidth, this.gridHeight);

        println(this.grid);
    }

    //draw the cellular automata
    void draw() {

      
       canvas.pushMatrix();
        canvas.translate(this.x, this.y);

        //draw a rectangle to see bounds of CellularAutomata
        canvas.noFill();
        canvas.noStroke();
        canvas.stroke(255);
        canvas.rect(0, 0, this.pixelWidth, this.pixelHeight);

        for (int i = 0; i < this.gridWidth; i++) {
            for (int j = 0; j < this.gridHeight; j++) {
                float x = i * this.rectWidth;
                float y = j * this.rectHeight;

                float cellState = this.grid[i][j];
                if (cellState > 0) {
                    canvas.noStroke();

                    //je nach wert der Zelle 
                    //die eine oder andere Farbe setzen
                    if (cellState >= 1) {
                        canvas.fill(224,38,64);
                    }
                    else if (cellState == 0.9) {
                        canvas.fill(255,49,66);
                 
                    }
                    else if(cellState == 0.8){
                        canvas.fill(227,57,68);
         
                    }
                    else if (cellState == 0.7) {
                        canvas.fill(229,66,70);

                    }
                    else if (cellState == 0.6) {
                        canvas.fill(230,75,73);

                    }
                    else if (cellState == 0.5) {
                        canvas.fill(232,84,75);

                    }
                    else if (cellState == 0.4) {
                        canvas.fill(234,94,77);

                    }
                    else if (cellState == 0.3) {
                        canvas.fill(236,103,79);

                    }
                    else if (cellState == 0.2) {
                        canvas.fill(238,112,81);
               
                    }
                    else if (cellState == 0.1) {
                        canvas.fill(239,121,83);

                    }
                    else if (cellState == 0) {
                        canvas.fill(241,130,85);


                    }
                   
                   canvas.fill(255);
                    canvas.rect(x, y, this.rectWidth, this.rectHeight);
                    canvas.textAlign(CENTER,CENTER);
                    canvas.noStroke();
                    //canvas.fill(0);
                }

            }
        }
        canvas.popMatrix();

    }

    void update() {

        //limit simualtion to a limit number of cells
        int n = this.nrActiveCells();
        if (n >= this.limit) {
            println("limit reached: £" +  this.limit + " , " +  n);
            return;
        }
        //create a two dimensional array for calculating the next generation
        float [][] nextGen = this.create2DArray(this.gridWidth, this.gridHeight);
        // console.log('nextGen');
        // console.log(nextGen);
        //calculate the new states for each grid cell
        //omit border cells to keep code simple
        for (int i = 1; i < this.gridWidth - 1; i++) {
            for (int j = 1; j < this.gridHeight - 1; j++) {
                //get the states of the neigbouring cells
                float topLeft = this.grid[i - 1][j - 1];
                float top = this.grid[i][j - 1];
                float topRight = this.grid[i + 1][j - 1];
                float left = this.grid[i - 1][j];
                float right = this.grid[i + 1][j];
                float bottomLeft = this.grid[i - 1][j + 1];
                float bottom = this.grid[i][j + 1];
                float bottomRight = this.grid[i + 1][j + 1];

                //the value of the current cell
                float self = this.grid[i][j];

                nextGen[i][j] = this.rules(self, topLeft, top, topRight, left, right, bottomLeft, bottom, bottomRight);
            }
        }

        //copy the new generation to the actual grid
        for(int i=0; i<this.gridWidth; i++){
          for(int j=0; j<this.gridHeight; j++){
           this.grid[i][j] = nextGen[i][j];
          }
        }
       

    }

    int nrActiveCells() {
        //counts the nr of cells which have a value of 1
        int count = 0;
        for (int i = 0; i < this.gridWidth; i++) {
            for (int j = 0; j < this.gridHeight; j++) {
                if (this.grid[i][j] > 0) {
                    count++;
                }
            }
        }
        return count;
    }

    //diese function müsst ihr so verändern, dass das gewünschte verhalten daraus resultiert
    float rules(float self,float  topLeft, float top, float topRight, float left, float right, float bottomLeft, float bottom, float bottomRight) {
        //here you can set the rules which should apply to an individual cell

        if (self == 1) {
            float value =random(0.1,1);
            float roundedValue = round(value*10)/10;
            return roundedValue;
            //return random (0.5, 1)
        }

        if(self>0){
            return self;
        }

      

        if (right > 0 || left > 0) {
            if (random(0, 1) > 0.5) {
                return 1;
            }
            else return 0;
        }
        else if (bottom > 0 || bottomLeft > 0 || bottomRight > 1 || top > 0 || topLeft > 0 || topRight > 0) {

            if (random(0, 1) > 0.9) {
                return 1;
            }
            else return 0;
        }
        else return 0;
    }

    void mousePressed(float mx,float  my) {
        if (mx < this.x || mx > (this.x + this.pixelWidth) || my < this.y || my > (this.y + this.pixelHeight)) {
           
            println(this.label + " mouse pressed: out of bounds ");
             println("this.x " + this.x + " this.y " + this.y + " this.pixelWidth " + this.pixelWidth + " this.pixelHeight " + this.pixelHeight + " mx: " + mx + " my " + my);
            return;
        }
        println(this.label + " mouse captured");
        // let localX = mx - this.x;
        float localX = this.pixelWidth / 2;
        float localY = this.pixelHeight - 50;
        int xindex = floor(localX / this.rectWidth);
        int yindex = floor(localY / this.rectHeight);

        println("mx,my", mx, my);
        println("this.x,this.y", this.x, this.y);
        println("localX,localY", localX, localY);
        println("xindex,yindex", xindex, yindex);


        println(xindex + "," + yindex);
        this.grid[xindex][yindex] = 1;

    }

    float [][] create2DArray(int w, int h) {
        float [][] arr = new float[w][h];
      
        //initialize the grid cells with 0
        for (int i = 0; i < w; i++) {
            for (int j = 0; j < h; j++) {
                arr[i][j] = 0;
            }
        }
        return arr;
    }
}
