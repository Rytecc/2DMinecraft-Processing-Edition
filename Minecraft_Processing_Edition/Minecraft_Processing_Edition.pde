public Assets assetsManager;
public Blocks blockManager;
Chunk c;
void setup() {
  fullScreen();
  // Initialise the assets interface
  assetsManager = new Assets("2D-Minecraft-Processing-Edition");

  // load all default blocks.
  blockManager = new Blocks("BlockSpriteSheets");
  c = new Chunk(0);
}

void draw() {
  background(0, 25, 0);
  if (keyPressed) {
    if (key == 'p') {
      drawAllBlocks();
    }
  }

  c.drawChunk();
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
