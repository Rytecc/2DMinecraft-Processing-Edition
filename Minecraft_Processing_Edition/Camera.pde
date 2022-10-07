//Lucas Soliman
// This file contains code specific to the camera

public static int cameraX;
public static int cameraY = 25 * 64;
public static int cameraXCoord;
public static int cameraSpeed = 15;

void moveCamera() {
  if (keyPressed) {
    if (key == 'a') {
      cameraX += cameraSpeed;
    } else if (key == 'd') {
      cameraX -= cameraSpeed;
    }

    if (key == 'w') {
      cameraY += cameraSpeed;
    } else if (key == 's') {
      cameraY -= cameraSpeed;
    }
  }

  //lower camera limit
  if(cameraY < -35) {
    cameraY = -35;
  }

  cameraXCoord = cameraX / (64 * chunkWidth);
}
