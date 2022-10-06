public static int cameraX;
public static int cameraY = 25 * 64;
public static int cameraXCoord;
public static int cameraSpeed = 5;
public static final int renderWidth = 4;
public Assets assetsManager;
public Blocks blockManager;
public HashMap<Integer, Chunk> chunks;
void setup() {
  size(1280, 720);
  // Initialise the assets interface
  assetsManager = new Assets("2D-Minecraft-Processing-Edition");

  // load all default blocks.
  blockManager = new Blocks("BlockSpriteSheets");
  chunks = new HashMap<Integer, Chunk>();
  
  for(int x = -renderWidth; x <= renderWidth; x++) {
    chunks.put(x, new Chunk(x));
  }
}

void draw() {
  background(25, 200, 255);
  moveCamera();
  drawChunks();
  
  text("x: " + cameraX + "\n" + "y: " + cameraY + "\n" + "currentXCoord: " + cameraXCoord, 50, 50);
}

void moveCamera() {
  if (keyPressed) {
    if (key == 'a') {
      cameraX += cameraSpeed;
    } else if (key == 'd') {
      cameraX -= cameraSpeed;
    }
    
    if(key == 'w') {
      cameraY += cameraSpeed;
    } else if(key == 's') {
      cameraY -= cameraSpeed;
    }
  }

  cameraXCoord = cameraX / (64 * chunkWidth);
}

void drawChunks() {
  for(int x = cameraXCoord - renderWidth; x <= cameraXCoord + renderWidth; x++) {
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
  }
}
