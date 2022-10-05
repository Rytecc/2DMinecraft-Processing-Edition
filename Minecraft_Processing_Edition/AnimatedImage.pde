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

  public int getDrawIndex() {
    return drawIndex;
  }

  public void setDrawIndex(int i) {
    if (i < 0 || i >= sprites.length) {
      println("Invalid index set for animated image with size of (" + sprites.length + ") >> " + i);
      return;
    }

    drawIndex = i;
  }

  public PImage[] getSprites() {
    return sprites;
  }

  public PImage getCurrentSprite() {
    return sprites[drawIndex];
  }
}
