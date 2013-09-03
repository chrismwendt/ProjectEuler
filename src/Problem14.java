import java.util.HashMap;

/*
 The following iterative sequence is defined for the set of positive integers:

 n  -> n/2 (n is even)
 n  -> 3n + 1 (n is odd)

 Using the rule above and starting with 13, we generate the following sequence:

 13  40  20  10  5  16  8  4  2  1
 It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

 Which starting number, under one million, produces the longest chain?

 NOTE: Once the chain starts the terms are allowed to go above one million.
 */

public class Problem14 implements Problem {
	public void run() {
		HashMap<Long, Long> map = new HashMap<Long, Long>();
		map.put(1l, 1l);
		long longestChain = 1;
		long longestStart = 1;
		for (long start = 2; start < 1000000; start++) {
			long chain = 0, n = start;
			while (true) {
				chain++;
				if (n % 2 == 0) {
					n /= 2;
				} else {
					n = 3 * n + 1;
				}

				if (map.containsKey(n)) {
					chain += map.get(n);
					map.put(start, chain);

					if (chain > longestChain) {
						longestChain = chain;
						longestStart = start;
					}

					break;
				}
			}
		}

		System.out.println(longestStart);
	}
}
