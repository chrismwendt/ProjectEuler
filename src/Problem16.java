import java.math.BigInteger;

/*
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
 */

public class Problem16 implements Problem {
	public void run() {
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
