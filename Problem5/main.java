public class main {
    public static void main(String[] args) {
        long smallest = 2;
        for (int a = 3; a <= 20; a++) {
            smallest = lcm(smallest, a);
        }
        System.out.println(smallest);
    }
    
    private static long lcm(long a, long b) {
        return a * b / gcd(a, b);
    }

    private static long gcd(long a, long b) {
        if (b == 0) {
            return a;
        } else {
            return gcd(b, a%b);
        }
    }
}
