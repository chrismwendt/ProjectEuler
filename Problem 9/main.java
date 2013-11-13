/*
A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
 */

/*
 * c = sqrt(a^2 + b^2)
 * a + b + sqrt(a^2 + b^2) = 1000
 * ... solve for b ... woflram
 * b = 1000(a-500)/(a-1000)
 */

public class main {
	public static void main(String[] args) {
		for (int a = 1; a < 1000; a++) {
			int b = 1000 * (a-500) / (a-1000);
			int c = 1000 - b - a;
			if (a*a + b*b == c*c) {
				System.out.println(a*b*c);
				return;
			}
		}
	}
}