import java.util.LinkedList;
import java.util.List;

public class main {
    public static void main(String[] args) {
        int sum = 0;
        for (int i = 1; i < 10000; i++) {
            if (isAmicable(i)) {
                sum += i;
            }
        }
        System.out.println(sum);
    }
    
    private static boolean isAmicable(int a) {
        int b = sum(properDivisors(a));
        if (sum(properDivisors(b)) == a && a != b) {
            return true;
        } else {
            return false;
        }
    }

    private static List<Integer> properDivisors(int n) {
        List<Integer> divisors = new LinkedList<Integer>();
        for (int i = 1; i <= n/2; i++) {
            if (n%i == 0) {
                divisors.add(i);
            }
        }
        return divisors;
    }

    private static int sum(List<Integer> list) {
        int sum = 0;
        for (Integer i : list) {
            sum += i;
        }
        return sum;
    }
}
