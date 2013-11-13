/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
 */

public class main {
	public static void main(String[] args) {
		int number = 1, i = 0;
		outer: while (i < 10001) {
			number++;
			for (int j = 2; j <= Math.sqrt(number); j++) {
				if (number%j == 0) {
					continue outer;
				}
			}
			i++;
		}
		System.out.println(number);
	}
}