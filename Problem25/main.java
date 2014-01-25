import java.math.BigInteger;

public class main {
    public static  void main(String[] args) {
        BigInteger a = new BigInteger("0");
        BigInteger b = new BigInteger("1");
        int term;
        for (term = 1; b.toString().length() < 1000; term++) {
            BigInteger temp = new BigInteger(b.toString());
            b = b.add(a);
            a = temp;
        }
        System.out.println(term);
    }
}
