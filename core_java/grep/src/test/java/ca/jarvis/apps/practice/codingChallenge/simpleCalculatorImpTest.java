package ca.jarvis.apps.practice.codingChallenge;

import ca.jrvs.apps.practice.codingChallenge.simpleCalculatorImp;

import static org.junit.jupiter.api.Assertions.*;

class simpleCalculatorImpTest {

    simpleCalculatorImp calculator;

    @org.junit.jupiter.api.BeforeEach
    void setUp() {
        calculator = new simpleCalculatorImp();
    }

    @org.junit.jupiter.api.Test
    void add() {
        int expected = 2;
        int actual = calculator.add(1, 1);
        assertEquals(expected, actual);
    }

    @org.junit.jupiter.api.Test
    void subtract() {
        int expected = 3;
        int actual = calculator.subtract(6, 3);
        assertEquals(expected, actual);
    }

    @org.junit.jupiter.api.Test
    void multiply() {
        int expected = 9;
        int actual = calculator.multiply(3, 3);
        assertEquals(expected, actual);
    }

    @org.junit.jupiter.api.Test
    void divide() {
        double expected = 2;
        double actual = calculator.divide(4, 2);
        assertEquals(expected, actual);
    }

    @org.junit.jupiter.api.Test
    void power() {
        int expected = 4;
        int actual = calculator.power(2, 2);
        assertEquals(expected, actual);
    }

    @org.junit.jupiter.api.Test
    void abs() {
        double expected = -9;
        double actual = calculator.abs(-9);
        assertEquals(expected, actual);
    }

}