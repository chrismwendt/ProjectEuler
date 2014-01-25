public class main {    
    public static void main(String[] args) {
        int length = 2000000;
        boolean sieve[] = new boolean[length];
        sieve[0] = false;
        sieve[1] = false;
        for (int i = 2; i < length; i++) {
            sieve[i] = true;
        }

        long sum = 0;

        for (int i = 2; i < length; i++) {
            if (!sieve[i]) {
                continue;
            } else {
                for (int j = 2*i; j < length; j += i) {
                    sieve[j] = false;
                }
            }
        }

        for (int i = 2; i < length; i++) {
            if (sieve[i]) {
                sum += i;
            }
        }

        System.out.println(sum);
    }
}
