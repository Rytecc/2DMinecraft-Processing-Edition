/*Lucas Soliman
This class stores multiple sprites in an array.
This class supports 2D sprite animation
sprites array is populated via the BlockLoader atlases
*/
class AnimatedImage {
  private PImage[] sprites;
  private float tileRate;
  private float delay;
  private int drawIndex;
  private boolean valid;
  public AnimatedImage(PImage[] sprites, float tileRate, int startIndex) {
    this.sprites = sprites;
    this.tileRate = tileRate;
    delay = 1f / tileRate;
    drawIndex = startIndex;
    for (PImage img : sprites) {
      if (img == null) {
        println("ANIMATED IMAGE IS INVALID!");
        valid = false;
        return;
      }

      valid = true;
    }
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
