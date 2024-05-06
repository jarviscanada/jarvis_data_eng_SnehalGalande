package core_java.grep.src.main.java.ca.jrvs.apps.grep;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Stream;

public class JavaGrepLambdaImp implements JavaGrepStreamLambda {

    final Logger logger = LoggerFactory.getLogger(JavaGrepStreamLambda.class);
    final Logger l = LoggerFactory.getLogger(JavaGrepLambdaImp.class);

    private String regex;
    private String rootPath;
    private String outFile;


    public static void main(final String[] args) {


        JavaGrepLambdaImp javaGrepLambdaImp = new JavaGrepLambdaImp();

        if (args.length != 3) {
            throw new IllegalArgumentException("USAGE: JavaGrep regex rootPath outFile");
        }
        javaGrepLambdaImp.setRegex(args[0]);
        javaGrepLambdaImp.setRootPath(args[1]);
        javaGrepLambdaImp.setOutFile(args[2]);

        try {
            javaGrepLambdaImp.process();
        }
        catch(Exception ex) {
            javaGrepLambdaImp.l.error("Error: Unable to process", ex);
        }
    }


    @Override
    public void process() throws IOException {
        // List to store lines that match the pattern
        List<String> linesToWrite = new ArrayList<>();

        // Walk through the files in the root directory
        try (Stream<File> filesStream = listFiles(rootPath)) {
            filesStream.forEach(file -> {
                // Read lines from the current file
                try (Stream<String> linesStream = readLines(file)) {
                    linesStream.filter(this::containsPattern)
                            .forEach(linesToWrite::add); // Add matching lines to the list
                } catch (RuntimeException e) {
                    logger.error("Error reading lines from file: {}", file.getAbsolutePath(), e);
                }
            });
        } catch (RuntimeException e) {
            logger.error("Error listing files in directory: {}", rootPath, e);
        }

        // Write matching lines to the output file
        try {
            writeToFile(linesToWrite.stream());
        } catch (RuntimeException e) {
            logger.error("Error writing lines to file: {}", outFile, e);
        }
    }


    public Stream<File> listFiles(String rootDir) {
        Path rootPath = new File(rootDir).toPath();
        try {
            return Files.walk(rootPath)
                    .filter(Files::isRegularFile)
                    .map(Path::toFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    public Stream<String> readLines(File inputFile) {
       /* try {
            return Files.lines(Paths.get(inputFile.toString()));*/
            try {
                return Files.lines(inputFile.toPath());
            } catch (IOException e) {
                throw new RuntimeException("Error occurred while reading lines from file", e);
            }
        }



    @Override
    public boolean containsPattern(String line) {
        Pattern pattern = Pattern.compile(regex);
        return pattern.matcher(line).find();
    }

    @Override
    public void writeToFile(Stream<String> lines) throws IOException {
        try (FileOutputStream fos = new FileOutputStream(outFile)) {
            lines.forEach(line -> {
                try {
                    fos.write((line + System.lineSeparator()).getBytes()); // Write the line
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            });
        }
        catch (IOException e) {
            // Handle IO exception
            throw new RuntimeException(e);
        }
    }

    @Override
    public void setOutFile(String outFile) {
        this.outFile = outFile;
    }

    @Override
    public void getOutFile() {
        this.outFile = outFile;
    }

    @Override
    public String getRegex() {
        return this.regex;
    }

    @Override
    public void setRegex(String regex) {
        this.regex = regex;
    }

    @Override
    public String getRootPath() {
        return this.rootPath;
    }

    @Override
    public void setRootPath(String rootPath) {
        this.rootPath = rootPath;
    }

}
