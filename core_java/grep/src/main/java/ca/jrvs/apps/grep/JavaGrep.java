package core_java.grep.src.main.java.ca.jrvs.apps.grep;

import java.io.IOException;
import java.util.List;
import java.io.File;


public interface JavaGrep {
    /**
     * Top level search flow
     * @throws IOException
     */
    void process() throws IOException;

    /**
     * Traverse a given directory and return all files
     * @param rootDir input directory
     *
     * @return files under the rootDir
     */
    List<File> listFiles(String rootDir);

     /**
      * Read a file and return all lines
      *
      * @param inputFile file to be read
      * @return lines
      * @throws IllegalArgumentException if a given inputFile is not a file
      */
     List<String> readLines(File inputFile);

    /**
     * Check if a line contains the regex pattern (passed by user)
     * @param line input string
     * @retun if there is a match
     */
     boolean containsPattern(String line);

    /**
     * Write lines to a file
     * @param lines matched line
     * @throws IOException if write failed
     */
    void writeToFile(List<String> lines) throws IOException;

    String getRootPath();

    void setRootPath(String rootPath);

    String getRegex();

    void setRegex(String regex);

    String getOutFile();

    void setOutFile(String outFile);

}