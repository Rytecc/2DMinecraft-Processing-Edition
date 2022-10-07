//Lucas Soliman
// Minecraft Processing Edition
// This file delegates all core functionalities of game.

public static final int renderWidth = 4;

public Assets assetsManager;
public Blocks blockManager;
public HashMap<Integer, Chunk> chunks;

void setup() {

  // set screen default size
  fullScreen();
  frameRate(165);

  // Initialise the assets interface
  assetsManager = new Assets("2D-Minecraft-Processing-Edition");

  // load all default blocks and create hashmap for chunks to be rendered.
  blockManager = new Blocks("BlockSpriteSheets");
  chunks = new HashMap<Integer, Chunk>();

  //Create the initial generation
  for (int x = -renderWidth * 10; x <= renderWidth * 10; x++) {
    chunks.put(x, new Chunk(x));
  }
}

void draw() {
  // set background to bright blue (day)
  background(25, 200, 255);

  // Press p to see all blocks available
  if (keyPressed) {
    if (key == 'p') {
      drawAllBlocks();
      return;
    }
  }

  //move camera and draw chunks relative to camera.
  moveCamera();
  drawChunks();

  //display some debug information
  text("x: " + (-cameraX) + "\n" + "y: " + cameraY + "\n" + "currentXCoord: " + cameraXCoord, 50, 50);
}

void drawChunks() {

  //Iterate over the surroundings of the camera chunk coordinates
  for (int x = cameraXCoord - renderWidth; x <= cameraXCoord + renderWidth; x++) {
    //Check if the current iterated coordinate is assigned a chunk value
    if (chunks.containsKey(-x)) {
      chunks.get(-x).drawChunk();
    } else {
      chunks.put(-x, new Chunk(-x));
    }
  }
}

void drawAllBlocks() {
  int x = 0;
  int y = 0;
  for (AnimatedImage img : blockManager.blocks.values()) {
    for (PImage tile : img.getSprites()) {
      image(tile, x * 64, y * 64, 64, 64);
      x++;

      if (x * 64 >= width) {
        x=0;
        y++;
      }
    }
    x++;
  }
}
