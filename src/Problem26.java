import java.util.HashMap;

/*
A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2 =   0.5
1/3 =   0.(3)
1/4 =   0.25
1/5 =   0.2
1/6 =   0.1(6)
1/7 =   0.(142857)
1/8 =   0.125
1/9 =   0.(1)
1/10    =   0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d  1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
 */

public class Problem26 implements Problem {
    public void run() {
        int longestDenominator = 3; // 1/3 = 0.(3)
        int longestLength = 1;
        for (int d = 4; d < 1000; d++) {
            int length = getGroupLength(d);
            if (length > longestLength) {
                longestLength = length;
                longestDenominator = d;
            }
        }
        
        System.out.println(longestDenominator);
    }

    private int getGroupLength(int d) {
        HashMap<Integer, Integer> remainderDigitMap = new HashMap<Integer, Integer>();
        for (int i = 0, remainder = 1; remainder != 0;) {
            int pow10 = (int)Math.ceil(Math.log10((double)d/remainder));
            remainder *= (int)Math.pow(10, pow10);
            i += pow10;
            remainder %= d;
            if (remainderDigitMap.containsKey(remainder)) {
                return i - remainderDigitMap.get(remainder);
            } else {
                remainderDigitMap.put(remainder, i);
            }
        }
        return 0;
    }
}
