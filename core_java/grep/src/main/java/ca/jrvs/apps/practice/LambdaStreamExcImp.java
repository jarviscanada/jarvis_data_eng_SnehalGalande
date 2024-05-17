package ca.jrvs.apps.practice;

import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.DoubleStream;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class LambdaStreamExcImp implements LambdaStreamExc{
    @Override
    public Stream<String> createStrStream(String... strings) {
        return Stream.of(strings);
    }

    @Override
    public Stream<String> toUpperCase(String... strings) {
        return createStrStream(strings).map(String::toUpperCase);
    }

    @Override
    public Stream<String> filter(Stream<String> stringStream, String pattern) {
        return stringStream.filter(s -> !s.contains(pattern));
    }

    @Override
    public IntStream createIntStream(int[] arr) {
        return IntStream.of(arr);
    }


    @Override
    public <E> List<E> toList(Stream<E> stream) {
        return stream.collect(Collectors.toList());
    }

    @Override
    public List<Integer> toList(IntStream intStream) {
        return intStream.boxed().collect(Collectors.toList());
    }

    @Override
    public IntStream createIntStream(int start, int end) {
        return IntStream.rangeClosed(start, end);
    }

    @Override
    public DoubleStream squareRootIntStream(IntStream intStream) {
        return intStream.mapToDouble(Math::sqrt);
    }

    @Override
    public IntStream getOdd(IntStream intStream) {
        return intStream.filter(n -> n % 2 != 0);
    }

    @Override
    public Consumer<String> getLambdaPrinter(String prefix, String suffix) {
        return message -> System.out.println(prefix + message + suffix);
    }

    @Override
    public void printMessages(String[] messages, Consumer<String> printer) {
        Stream.of(messages).forEach(printer);
    }

    @Override
    public void printOdd(IntStream intStream, Consumer<String> printer) {
        intStream.filter(n -> n % 2 != 0).mapToObj(String::valueOf).forEach(printer);
    }

    @Override
    public Stream<Integer> flatNestedInt(Stream<List<Integer>> ints) {
        return ints.flatMap(List::stream);
    }

    public static void main(String[] args) {
        LambdaStreamExcImp lambdaStreamExcImp = new LambdaStreamExcImp();

        /*
        * String stream
         */
        String[] strings = {"Hello", "world", "from", "Java", "Stream"};
        Stream<String> stringStream =  lambdaStreamExcImp.createStrStream(strings);

        /*
        *   Convert string to upper case
        */
        Stream<String> stringStream_upper= lambdaStreamExcImp.toUpperCase(strings);
        System.out.println(stringStream_upper.collect(Collectors.toList()));

        /*
         *   Convert string to string stream and filter out item that do not match the pattern.
         */
        String[] array = {"Hello", "Yellow", "Mellow", "Fellow", "Pillow"};
        Stream<String> input_Stream = Stream.of(array);
        Stream<String> stringStream_filter=lambdaStreamExcImp.filter(input_Stream,"i");
        System.out.println(stringStream_filter.collect(Collectors.toList()));

        /*
         *   Create integer stream from int array
         */
        int[] numb = {1,2,3,4,5};
        Stream<Integer> integerStream = lambdaStreamExcImp.createIntStream(numb).boxed();
        System.out.println(integerStream.collect(Collectors.toList()));

        /*
         *   Create integer stream with range values
         */
        int start = 5;
        int end = 9;
        Stream<Integer> intRangeStream = lambdaStreamExcImp.createIntStream(start, end).boxed();
        System.out.println(intRangeStream.collect(Collectors.toList()));

        /*
         *   Create squareRoot
         */
        IntStream val = IntStream.of(16,9);
        DoubleStream sqrRoot = lambdaStreamExcImp.squareRootIntStream(val);
        sqrRoot.forEach(System.out::println);

        /*
         *   Odd numbers
         */
        IntStream valOdd = IntStream.of(16,9);
        IntStream oddResult = lambdaStreamExcImp.getOdd(valOdd);
        oddResult.forEach(System.out::println);
     }
}
