import java.util.HashMap;

public class main {
    public static void main(String[] args) {
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
