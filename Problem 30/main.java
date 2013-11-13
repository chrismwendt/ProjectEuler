import java.util.HashMap;
import java.util.HashSet;
import java.util.Map.Entry;
import java.util.Set;

/*
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
 */

public class main {
    public static  void main(String[] args) {
        int sum = 0;
        for (int i = 10; i < 1000000; i++) {
            if (sumOfFifths(i) == i) {
                sum += i;
            }
        }
        
        System.out.println(sum);
    }

    private static int sumOfFourths(int n) {
        int sum = 0;
        while (n >= 1) {
            sum += Math.pow(n%10, 4);
            n /= 10;
        }
        return sum;
    }

    private static int sumOfFifths(int n) {
        int sum = 0;
        while (n >= 1) {
            sum += Math.pow(n%10, 5);
            n /= 10;
        }
        return sum;
    }
}