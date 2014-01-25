import java.util.HashMap;
import java.util.HashSet;
import java.util.Map.Entry;
import java.util.Set;

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
