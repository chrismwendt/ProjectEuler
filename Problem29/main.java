import java.util.HashMap;
import java.util.HashSet;
import java.util.Map.Entry;
import java.util.Set;

public class main {
    public static  void main(String[] args) {
        HashSet<Set<Entry<Integer, Integer>>> distinctTerms = new HashSet<Set<Entry<Integer, Integer>>>();
        for (int a = 2; a <= 100; a++) {
            for (int b = 2; b <= 100; b++) {
                int size = distinctTerms.size();
                distinctTerms.add(primeFactorizationOfPower(a, b));
            }
        }
        
        System.out.println(distinctTerms.size());
    }

    private static Set<Entry<Integer, Integer>> primeFactorizationOfPower(int a, int b) {
        HashMap<Integer, Integer> factorization = new HashMap<Integer, Integer>();
        for (int i = 2; i <= a;) {
            if (a%i == 0) {
                a /= i;
                if (factorization.containsKey(i)) {
                    factorization.put(i, factorization.get(i) + b);
                } else {
                    factorization.put(i, b);
                }
                i = 2;
            } else {
                i++;
            }
        }
        return factorization.entrySet();
    }
}
