import java.math.BigInteger;

public class main {
    public static void main(String[] args) {
        BigInteger n = new BigInteger("2");
        n = n.pow(1000);
        String s = n.toString();
        int sum = 0;
        for (int i = 0; i < s.length(); i++) {
            sum += Integer.parseInt(String.valueOf(s.charAt(i)));
        }
        System.out.println(sum);
    }
}
