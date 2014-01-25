public class main {
    public static void main(String[] args) {
        int n = 100;
        System.out.println(Math.abs(n*(n+1)*(2*n+1)/6 - square(n*(n+1)/2)));
    }
    
    private static int square(int n) {
        return n*n;
    }
}
