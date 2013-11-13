import java.math.BigInteger;

/*
n! means n  (n  1)  ...  3  2  1

For example, 10! = 10  9  ...  3  2  1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
 */

public class Problem20 {
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
	
	private BigInteger factorial(BigInteger n) {
		if (n.compareTo(new BigInteger("1")) == 0) {
			return n;
		}
		return n.multiply(factorial(n.subtract(new BigInteger("1"))));
	}
}
