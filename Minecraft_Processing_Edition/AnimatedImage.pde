class AnimatedImage {
  private PImage[] sprites;
  private float tileRate;
  private float delay;
  private int drawIndex;
  
  public AnimatedImage(PImage[] sprites, float tileRate, int startIndex) {
    this.sprites = sprites;
    this.tileRate = tileRate;
    delay = 1f / tileRate;
    drawIndex = startIndex;
  }
  
  public void tickAnimatedImage() {
    if(delay >= 0f) {
      delay -= 1f / 60f;
    } else {
      delay = 1f / tileRate;
      drawIndex++;
      
      if(drawIndex == sprites.length) {
        drawIndex = 0;
      }
    }
    
    SpaceShooter.root.image(sprites[drawIndex], 0, 0, 0, 0);
  }
  
  public int getDrawIndex() {
    return drawIndex;
  }
}

public PImage[] getSpritesFromSheet(PImage src, int tX, int tY, int rX, int rY) {
  PImage[] result = new PImage[tX * tY];
  for(int x = 0; x < tX; x++) {
    for(int y = 0; y < tY; y++) {
      int xCoord = x * rX;
      int yCoord = y * rY;
      result[x * tX + y] = src.get(xCoord, yCoord, rX, rY);
    }
  }
  
  return result;
}
