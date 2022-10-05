// This class allows for interfacing with essential files like images etc;
// The user.dir directs to the Processing 4.0.1 application location
class Assets {
  private String assetPath;

  //parentName refers to subfolder attributed to given application
  public Assets(String parentName) {
    assetPath = System.getProperty("user.dir") + "\\Assets\\" + parentName;
  }

  public File[] getFilesInDirectory(String path) {
    File dir = new File(assetPath + "\\" + path);
    return dir.listFiles(new FileExtFilter(".png").pictsFilter);
  }

  public File getFileInAssets(String path) {
    return new File(assetPath + "\\" + path);
  }
}
