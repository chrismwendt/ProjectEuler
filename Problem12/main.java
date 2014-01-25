public class main {
    public static void main(String[] args) {
        for (int i = 1; ; i++) {
            int count;
            if (i%2 == 0) {
                count = count(i/2)*count(i+1);
            } else {
                count = count(i)*count((i+1)/2);
            }
            if (count > 500) {
                System.out.println(i*(i+1)/2);
                return;
            }
        }
    }
    
    private static int count(int number) {
        int divisors = 0;
        for (int j = 1; j*j <= number; j++) {
            if (number%j == 0) {
                if (j*j != number) {
                    divisors += 2;
                } else {
                    divisors++;
                }
            }
        }
        return divisors;
    }
}
