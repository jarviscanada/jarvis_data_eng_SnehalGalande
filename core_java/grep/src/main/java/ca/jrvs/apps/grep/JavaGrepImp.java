package ca.jrvs.apps.grep;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.BasicConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class JavaGrepImp implements JavaGrep {

    final Logger logger = LoggerFactory.getLogger(JavaGrep.class);

    private String regex;
    private String rootPath;
    private String outFile;


    public static void main(String[] args) {
        if (args.length != 3) {
            throw new IllegalArgumentException("USAGE: JavaGrep regex rootPath outFile");
        }

        BasicConfigurator.configure();

        JavaGrepImp javaGrepImp = new JavaGrepImp();
        javaGrepImp.setRegex(args[0]);
        javaGrepImp.setRootPath(args[1]);
        javaGrepImp.setOutFile(args[2]);

        try {
            javaGrepImp.process();
        }
        catch(Exception ex) {
            javaGrepImp.logger.error("Error: Unable to process", ex);
        }
    }


     /**
      * Top level search flow
      * @throws IOException
     */
    @Override
    public void process() throws IOException {
        try {
            List<String> lines_to_write = new ArrayList<>();
            String rootDir = rootPath;

            List<File> files = listFiles(rootDir);
            for (File file : files) {
                for (String line : readLines(file)) {
                    if (containsPattern(line)) {
                        lines_to_write.add(line);
                    }
                }
            }
            writeToFile(lines_to_write);
        }
        catch (IOException ex) {
            logger.error(ex.getMessage(), ex);
        }
    }

    @Override
    public List<File> listFiles(String rootDir) {
        List<File> fileList = new ArrayList<>();
        File root = new File(rootDir);
        traverseDirectory(root, fileList);
        return fileList;
    }

    private static void traverseDirectory(File directory, List<File> fileList) {
        // Get list of files and directories in the current directory
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isDirectory()) {
                    // Recursively traverse subdirectories
                    traverseDirectory(file, fileList);
                } else {
                    // Add files to the list
                    fileList.add(file);
                }
            }
        }
    }


    /**
     * Read a file and return all lines
     *
     * @param inputFile file to be read
     * @return lines
     * @throws IllegalArgumentException if a given inputFile is not a file
     */
    @Override
    public List<String> readLines(File inputFile) {
        List<String> lines = new ArrayList<>();

        // FileReader is used to read the contents of a file
        // BufferedReader is used to read text from a character-input stream
        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                    lines.add(line);
            }
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
        catch (IllegalArgumentException ex){
            logger.error(ex.getMessage(), ex);
        }
        return lines;
    }



        @Override
    public boolean containsPattern(String line) {
        // Create a Pattern object
            Pattern pattern_regex = Pattern.compile(regex);
            // Create a Matcher object
            Matcher matcher = pattern_regex.matcher(line);
        return matcher.find();
    }

    @Override
    public void writeToFile(List<String> lines) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outFile))) {
            // Iterate over the list of lines and write each line to the file
            for (String line : lines) {
                writer.write(line); // Write the line
                writer.newLine();   // Add a newline character
            }
        } catch (IOException e) {
            // Handle IO exception
            throw new RuntimeException(e);
        }
    }

    @Override
    public String getRootPath() {
        return this.rootPath;
    }

    @Override
    public void setRootPath(String rootPath) {
        this.rootPath = rootPath;
    }

    @Override
    public void setRegex(String regex) {
        this.regex = regex;
    }

    @Override
    public String getRegex() {
        return this.regex;
    }

    @Override
    public String getOutFile() {
        return this.outFile;
    }

    @Override
    public void setOutFile(String outFile) {
        this.outFile = outFile;
    }
}
