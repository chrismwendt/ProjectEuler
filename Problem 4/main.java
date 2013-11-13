/*
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91*99.

Find the largest palindrome made from the product of two 3-digit numbers.
 */

/*
 * 100*100
 * 100*101
 * 100*102...
 * 101*101
 * 101*102...
 * 102*102...
 * 
 * 998*998
 * 998*999
 * 999*999
 */

public class Problem4 {
	public static void main(String[] args) {
		int largestPalindrome = 0;
		for (int a = 999; a > 100 && a*999 > largestPalindrome; a--) {
			for (int b = 999; b >= a; b--) {
				String s = String.valueOf(a*b);
				if (s.equals(new StringBuilder(s).reverse().toString())
				 && a*b > largestPalindrome) {
						largestPalindrome = a*b;
				}
			}
		}
		System.out.println(largestPalindrome);
	}
}
