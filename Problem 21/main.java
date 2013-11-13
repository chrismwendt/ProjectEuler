import java.util.LinkedList;
import java.util.List;

/*
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
 */

public class Problem21 implements Problem {
	public void run() {
		int sum = 0;
		for (int i = 1; i < 10000; i++) {
			if (isAmicable(i)) {
				sum += i;
			}
		}
		System.out.println(sum);
	}
	
	private boolean isAmicable(int a) {
		int b = sum(properDivisors(a));
		if (sum(properDivisors(b)) == a && a != b) {
			return true;
		} else {
			return false;
		}
	}

	private List<Integer> properDivisors(int n) {
		List<Integer> divisors = new LinkedList<Integer>();
		for (int i = 1; i <= n/2; i++) {
			if (n%i == 0) {
				divisors.add(i);
			}
		}
		return divisors;
	}

	private int sum(List<Integer> list) {
		int sum = 0;
		for (Integer i : list) {
			sum += i;
		}
		return sum;
	}
}
