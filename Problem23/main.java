import java.util.HashSet;
import java.util.TreeMap;

public class main {
    public static void main(String[] args) {
        HashSet<Integer> abundantNumbers = new HashSet<Integer>();
        int sum = 0;
        for (int i = 1; i < 28123; i++) {
            if (isAbundant(i)) {
                abundantNumbers.add(i);
            }
            
            boolean isSumOfTwoAbundantNumbers = false;
            for (Integer j : abundantNumbers) {
                if (abundantNumbers.contains(i - j)) {
                    isSumOfTwoAbundantNumbers = true;
                }
            }
            
            if (!isSumOfTwoAbundantNumbers) {
                sum += i;
            }
        }
        
        System.out.println(sum);
    }

    private static boolean isAbundant(int n) {
        int sum = 1;
        for (int i = 2; i*i <= n; i++) {
            if (n%i == 0) {
                if (i*i != n) {
                    sum += i + n/i;
                } else {
                    sum += i;
                }
            }
        }
        
        return sum > n;
    }
}
