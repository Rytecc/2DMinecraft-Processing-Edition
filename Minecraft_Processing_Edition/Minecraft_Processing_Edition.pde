public static Minecraft_Processing_Edition root;
public HashMap<Integer, AnimatedImage> Blocks;

void setup() {
  root = this;
  size(500, 500);

  Blocks = new HashMap<Integer, AnimatedImage>();
  File[] imgFiles = getFilesInDirectory("Assets/Block");
}

void draw() {
}

File[] getFilesInDirectory(File dir) {
  return dir.listFiles(new FileExtFilter(".png").pictsFilter);
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
