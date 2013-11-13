/*
The sum of the squares of the first ten natural numbers is,

1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)^2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 */

public class main {
    public static void main(String[] args) {
        int n = 100;
        System.out.println(Math.abs(n*(n+1)*(2*n+1)/6 - square(n*(n+1)/2)));
    }
    
    private static int square(int n) {
        return n*n;
    }
}