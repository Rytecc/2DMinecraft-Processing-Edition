import java.io.*;

class FileExtFilter {
  String ext;
  public FileExtFilter(String ext) {
    this.ext = ext;
  }

  public final FilenameFilter pictsFilter = new FilenameFilter() {
    boolean accept(File dir, String name) {
      name = name.toLowerCase();
      if (name.endsWith(ext)) {
        return true;
      }
      return false;
    }
  };
}
