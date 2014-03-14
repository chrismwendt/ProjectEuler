public class main {
    public static void main(String[] args) {
        int largestPalindrome = 0;
        for (int a = 999; a > 100 && a*999 > largestPalindrome; a--) {
            for (int b = 999; b >= a; b--) {
                String s = String.valueOf(a*b);
                if (s.equals(new StringBuilder(s).reverse().toString())
                 && a*b > largestPalindrome) {
                        largestPalindrome = a*b;
                }
            }
        }
        System.out.println(largestPalindrome);
    }
}
