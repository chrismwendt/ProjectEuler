import java.math.BigInteger;

public class main {
    public static void main(String[] args) {
        BigInteger n = new BigInteger("100");
        n = factorial(n);
        String s = n.toString();
        int sum = 0;
        for (int i = 0; i < s.length(); i++) {
            sum += Integer.parseInt(String.valueOf(s.charAt(i)));
        }
        System.out.println(sum);
    }
    
    private static BigInteger factorial(BigInteger n) {
        if (n.compareTo(new BigInteger("1")) == 0) {
            return n;
        }
        return n.multiply(factorial(n.subtract(new BigInteger("1"))));
    }
}
