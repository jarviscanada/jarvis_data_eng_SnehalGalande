package ca.jrvs.apps.practice.codingChallenge;

public class simpleCalculatorImp implements simpleCalculatorInterface {
        @Override
        public int add(int x, int y) {
            return x+y;
        }

        @Override
        public int subtract(int x, int y) {
            return x-y;
        }

        @Override
        public int multiply(int x, int y) {
            return x*y;
        }

        @Override
        public double divide(int x, int y) {
            if(y == 0)
                throw new ArithmeticException("Division by zero");
            else
                return (double)x/y;
        }

        @Override
        public int power(int x, int y) {
            if (y == 0) {
                return 1;
            }
            // Recursive case: calculate power(x, y-1) and multiply by x
            return x * power(x, y - 1);
        }

        @Override
        public double abs(double x) {
            if (x < 0) {
                return x; // If x is negative, return its positive
            }
            else {
                return x;  // If x is non-negative, return x itself
            }
        }

    public static void main(String[] args) {
        simpleCalculatorImp calc = new simpleCalculatorImp();
    }
}
