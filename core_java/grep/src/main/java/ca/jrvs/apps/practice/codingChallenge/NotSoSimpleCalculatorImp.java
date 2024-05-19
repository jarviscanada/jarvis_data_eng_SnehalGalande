package ca.jrvs.apps.practice.codingChallenge;

public class NotSoSimpleCalculatorImp implements NotSoSimpleCalculator{
    private simpleCalculatorInterface calc;

    public NotSoSimpleCalculatorImp(simpleCalculatorInterface mockSimpleCalc) {
    }

    public void NotSoSimpleCalculatorImp(simpleCalculatorInterface calc) {
        this.calc = calc;
    }

    @Override
    public int power(int x, int y) {
        if (y == 0)
            return 1;
        int result = x;
        for (int i = 1; i < y; i++) {
            result *= x;
        }
        return result;
    }

    @Override
    public int abs(int x) {
        return calc.multiply(x, -1);
    }

    @Override
    public double sqrt(int x) {
        if (x < 0)
            throw new IllegalArgumentException("Cannot calculate square root of a negative number");
        if (x == 0 || x == 1)
            return x;
        return Math.sqrt(x);
    }
}
