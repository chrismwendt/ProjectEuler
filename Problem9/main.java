/*
 * c = sqrt(a^2 + b^2)
 * a + b + sqrt(a^2 + b^2) = 1000
 * ... solve for b ... woflram
 * b = 1000(a-500)/(a-1000)
 */

public class main {
    public static void main(String[] args) {
        for (int a = 1; a < 1000; a++) {
            int b = 1000 * (a-500) / (a-1000);
            int c = 1000 - b - a;
            if (a*a + b*b == c*c) {
                System.out.println(a*b*c);
                return;
            }
        }
    }
}
