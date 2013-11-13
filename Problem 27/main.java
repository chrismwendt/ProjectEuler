/*
 Euler published the remarkable quadratic formula:

 n² + n + 41

 It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

 Using computers, the incredible formula  n²  79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, 79 and 1601, is 126479.

 Considering quadratics of the form:

 n² + an + b, where |a|  1000 and |b|  1000

 where |n| is the modulus/absolute value of n
 e.g. |11| = 11 and |4| = 4
 Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
 */

public class Problem27 {
    public static void main(String[] args) {
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
                    System.out.println(a + " " + b + ": " + count);
                }
            }
        }

        System.out.println(maximumProduct);
    }

    private boolean isPrime(int n) {
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

    private int countPrimes(int a, int b) {
        for (int n = 0;; n++) {
            if (!isPrime(n * n + a * n + b)) {
                return n;
            }
        }
    }
}