import java.math.BigInteger;

/*
Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.


How many routes are there through a 20x20 grid?
 */

public class main {
    public static void main(String[] args) {
        BigInteger n = new BigInteger("40");
        BigInteger k = new BigInteger("20");
        System.out.println(nChooseK(n, k));
    }
    
    private static BigInteger nChooseK(BigInteger n, BigInteger k) {
        // n choose k = n! / k!(n-k)!
        return factorial(n).divide(factorial(k).multiply(factorial(n.subtract(k))));
    }
    
    private static BigInteger factorial(BigInteger n) {
        if (n.compareTo(new BigInteger("1")) == 0) {
            return n;
        }
        return n.multiply(factorial(n.subtract(new BigInteger("1"))));
    }
}
