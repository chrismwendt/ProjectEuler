/*
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 */

public class main {
	public static void main(String[] args) {
		long smallest = 2;
		for (int a = 3; a <= 20; a++) {
			System.out.println(String.format("lcm(%d, %d) %d", smallest, a, lcm(smallest, a)));
			smallest = lcm(smallest, a);
		}
		System.out.println(smallest);
	}
	
	private long lcm(long a, long b) {
		return a * b / gcd(a, b);
	}

	private long gcd(long a, long b) {
		if (b == 0) {
			return a;
		} else {
			return gcd(b, a%b);
		}
	}
}
