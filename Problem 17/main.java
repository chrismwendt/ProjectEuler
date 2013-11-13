/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
 */

public class main {
	public static void main(String[] args) {
		assert letters(1) == "one".length();
		assert letters(9) == "nine".length();
		assert letters(11) == "eleven".length();
		assert letters(19) == "nineteen".length();
		assert letters(20) == "twenty".length();
		assert letters(21) == "twentyone".length();
		assert letters(29) == "twentynine".length();
		assert letters(101) == "onehundredandone".length();
		assert letters(144) == "onehundredandfortyfour".length();
		assert letters(24) == "twentyfour".length();
		assert letters(990) == "ninehundredandninety".length();
		assert letters(7) == "seven".length();
		assert letters(19) == "nineteen".length();
		assert letters(85) == "eightyfive".length();
		assert letters(200) == "twohundred".length();
		assert letters(1000) == "onethousand".length();
		int sum = 0;
		for (int i = 1; i <= 1000; i++) {
			sum += letters(i);
		}
		System.out.println(sum);
	}

	private int letters(int i) {
		String ones[] = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };
		String tens[] = { "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" };
		String decs[] = { "", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety" };
		
		if (i == 0) {
			return 0;
		} else if (i < 10) {
			return ones[i - 1].length();
		} else if (i < 20) {
			return tens[i - 10].length();
		} else if (i < 100) {
			return decs[i/10].length() + letters(i - i/10*10);
		} else if (i < 1000) {
			int count = letters(i/100) + "hundred".length();
			if (i%100 == 0) {
				return count;
			}
			return count + "and".length() + letters(i - i/100*100);
		} else {
			return "onethousand".length();
		}
	}
}
