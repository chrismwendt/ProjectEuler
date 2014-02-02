import java.util.*;
import java.math.BigInteger;

public class main {
    public static void main(String[] args) {
        HashMap<String, List<BigInteger>> map = new HashMap<String, List<BigInteger>>();

        for (int i = 0; ; i++) {
            BigInteger c = BigInteger.valueOf(i).pow(3);
            String s = sortedDigits(c);
            if (!map.containsKey(s)) {
                map.put(s, new ArrayList<BigInteger>());
            }
            List<BigInteger> list = map.get(s);
            list.add(c);
            if (list.size() == 5) {
                System.out.println(list.get(0));
                return;
            }
        }
    }

    private static String sortedDigits(BigInteger i) {
        char[] a = i.toString().toCharArray();
        Arrays.sort(a);
        return new String(a);
    }
}
