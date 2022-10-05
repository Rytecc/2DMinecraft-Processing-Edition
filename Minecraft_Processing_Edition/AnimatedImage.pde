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
    if (delay >= 0f) {
      delay -= 1f / 60f;
    } else {
      delay = 1f / tileRate;
      drawIndex++;

      if (drawIndex == sprites.length) {
        drawIndex = 0;
      }
    }

    Minecraft_Processing_Edition.root.image(sprites[drawIndex], 0, 0, 0, 0);
  }

  public int getDrawIndex() {
    return drawIndex;
  }
}
