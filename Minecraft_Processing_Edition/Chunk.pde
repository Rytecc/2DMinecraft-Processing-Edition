public static final int chunkHeight = 256;
public static final int chunkWidth = 16;
public static final int noiseIntensity = 2;
public static final int noiseOffset = 0;
public static final int heightOffset = 5;

class BlockDrawCall {
  public BlockDrawCall(String id, int variantid) {
    blockID = id;
    variantID = variantid;
  }

  public String blockID;
  public int variantID;
}

class Chunk {
  public BlockDrawCall[][] Blocks;
  private int xCoord;
  public boolean isReady;
  public Chunk(int xCoord) {
    this.xCoord = xCoord;
    Blocks = new BlockDrawCall[chunkWidth][chunkHeight];
    generateChunk();
  }

  void generateChunk() {
    for (int x = 0; x < chunkWidth; x++) {
      int columnCoord = xCoord * chunkWidth + x;
      int n = int(noise(columnCoord + noiseOffset) * noiseIntensity) + heightOffset;

      //limit the N value to prevent index out of range exceptions
      if (n >= chunkHeight) {
        n = 255;
      } else if (n < 0) {
        n = 0;
      }

      Blocks[x][n] = getDrawCallforID("grass.png");
      for (int y = n - 1; y >= 0; y--) {
        if (y <= n - 3)
          Blocks[x][y] = getDrawCallforID("stone.png");
        else
          Blocks[x][y] = getDrawCallforID("grass.png");
      }
    }

    isReady = true;
  }

  BlockDrawCall getDrawCallforID(String id) {
    int upperBound = blockManager.blocks.get("grass.png").getSprites().length;
    return new BlockDrawCall(id, (int)random(0, upperBound));
  }

  void drawChunk() {
    if (isReady) {
      for (int x = 0; x < Blocks.length; x++) {
        for (int y = 0; y < Blocks[x].length; y++) {
          int xPos = (xCoord * chunkWidth + x) * 64;
          BlockDrawCall call = Blocks[x][y];

          if (call != null) {
            image(blockManager.blocks.get(call.blockID).getSprites()[0], xPos, height - y * 64, 64, 64);
          }
        }
      }
    }
  }
}
