/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
 */

public class main {
    public static void main(String[] args) {
        int[] primes = new int[10001];
        primes[0] = 2;
        int ind = 0;

        int number = 2;
        outer: for (int i = 1; i < 10001;) {
            number++;
            if (number%2 == 0) {
                continue outer;
            }
            for (int j = 0; primes[j] <= Math.sqrt(number); j++) {
                if (number%primes[j] == 0) {
                    continue outer;
                }
            }
            primes[ind++] = number;
            i++;
        }
        System.out.println(number);
    }
}
