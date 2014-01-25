import java.util.HashMap;

public class main {
    public static  void main(String[] args) {
        int longestDenominator = 3; // 1/3 = 0.(3)
        int longestLength = 1;
        for (int d = 4; d < 1000; d++) {
            int length = getGroupLength(d);
            if (length > longestLength) {
                longestLength = length;
                longestDenominator = d;
            }
        }
        
        System.out.println(longestDenominator);
    }

    private static int getGroupLength(int d) {
        HashMap<Integer, Integer> remainderDigitMap = new HashMap<Integer, Integer>();
        for (int i = 0, remainder = 1; remainder != 0;) {
            int pow10 = (int)Math.ceil(Math.log10((double)d/remainder));
            remainder *= (int)Math.pow(10, pow10);
            i += pow10;
            remainder %= d;
            if (remainderDigitMap.containsKey(remainder)) {
                return i - remainderDigitMap.get(remainder);
            } else {
                remainderDigitMap.put(remainder, i);
            }
        }
        return 0;
    }
}
