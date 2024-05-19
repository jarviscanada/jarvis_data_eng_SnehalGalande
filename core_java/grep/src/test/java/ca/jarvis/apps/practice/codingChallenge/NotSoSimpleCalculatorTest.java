package ca.jarvis.apps.practice.codingChallenge;

import ca.jrvs.apps.practice.codingChallenge.NotSoSimpleCalculator;
import ca.jrvs.apps.practice.codingChallenge.NotSoSimpleCalculatorImp;
import ca.jrvs.apps.practice.codingChallenge.simpleCalculatorInterface;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;



import static org.junit.jupiter.api.Assertions.assertEquals;

@ExtendWith(MockitoExtension.class)
public class NotSoSimpleCalculatorTest {
    NotSoSimpleCalculator calc;

    @Mock
    simpleCalculatorInterface mockSimpleCalc;

    @BeforeEach
    void init() {
        calc = new NotSoSimpleCalculatorImp(mockSimpleCalc);
    }

    @Test
    void test_power() {
        int expected = 27;
        int actual = calc.power(3, 3);
        assertEquals(expected, actual);
    }

    @Test
    void test_abs() {
        //This test will currently fail
        //Consider if the provided logic in NotSoSimpleCalculatorImpl is correct
        //Consider if you need to add anything to this test case (hint: you do)
        int expected = 10;
        int actual = calc.abs(10);
        assertEquals(expected, actual);

    }

    @Test
    void test_sqrt() {
        double expected = 10;
        double actual = calc.sqrt(100);
        assertEquals(expected, actual);
    }
}
