import java.util.TreeSet;

public class main {
    public static  void main(String[] args) {
        TreeSet<Integer> denominations = new TreeSet<Integer>();
        int[] denominationInts = new int[] {1, 2, 5, 10, 20, 50, 100, 200};
        for (int denomination : denominationInts) {
            denominations.add(denomination);
        }
        System.out.println(ways(denominations, 200, denominations.last()));
    }

    private static int ways(TreeSet<Integer> denominations, int total, int max) {
        if (total == 0) {
            return 0;
        }
        
        int ways = 0;
        while (total > 0) {
            ways += (denominations, denominations.floor(total))
        }
        
        return ways;
    }
}
