public class main {
    public static  void main(String[] args) {
        int maximumPrimes = 0, maximumProduct = 0;
        for (int b = 2; b < 1000; b++) {
            if (!isPrime(b)) {
                continue;
            }

            for (int a = -b; a < 1000; a++) {
                int count = countPrimes(a, b);
                if (count > maximumPrimes) {
                    maximumPrimes = count;
                    maximumProduct = a * b;
                }
            }
        }

        System.out.println(maximumProduct);
    }

    private static boolean isPrime(int n) {
        if (n < 2 || n % 2 == 0) {
            return false;
        }

        for (int i = 3; i * i <= n; i += 2) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }

    private static int countPrimes(int a, int b) {
        for (int n = 0;; n++) {
            if (!isPrime(n * n + a * n + b)) {
                return n;
            }
        }
    }
}
