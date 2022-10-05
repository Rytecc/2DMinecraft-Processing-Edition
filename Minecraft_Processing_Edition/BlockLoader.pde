class Blocks {
  public HashMap<String, AnimatedImage> blocks;

  public Blocks(String spriteSheetsFolder) {
    blocks = new HashMap<String, AnimatedImage>();
    loadBlocks(spriteSheetsFolder);
  }

  void loadBlocks(String path) {
    File[] imgFiles = assetsManager.getFilesInDirectory("\\" + path);

    for (File sheet : imgFiles) {
      if (!sheet.exists()) {
        println("given file does not exist! >> " + sheet.getPath());
        continue;
      }

      PImage srcImg = loadImage(sheet.getPath());
      PImage[] tiles = getSpritesFromSheet(srcImg, srcImg.width / 64, srcImg.height / 64, 64, 64);
      AnimatedImage newTileSheet = new AnimatedImage(tiles, 0, 0);

      println("loaded: " + sheet.getName());
      blocks.put(sheet.getName(), newTileSheet);
    }
  }

  PImage[] getSpritesFromSheet(PImage src, int tX, int tY, int rX, int rY) {
    PImage[] result = new PImage[tX * tY];
    for (int x = 0; x < tX; x++) {
      for (int y = 0; y < tY; y++) {
        int xCoord = x * rX;
        int yCoord = y * rY;
        result[y * tX + x] = src.get(xCoord, yCoord, rX, rY);
      }
    }

    return result;
  }
}
