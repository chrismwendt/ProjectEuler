import java.math.BigInteger;

/*
The Fibonacci sequence is defined by the recurrence relation:

Fn = Fn-1 + Fn-2, where F1 = 1 and F2 = 1.
Hence the first 12 terms will be:

F1 = 1
F2 = 1
F3 = 2
F4 = 3
F5 = 5
F6 = 8
F7 = 13
F8 = 21
F9 = 34
F10 = 55
F11 = 89
F12 = 144
The 12th term, F12, is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?
 */

public class main {
    public static static void main(String[] args) {
        BigInteger a = new BigInteger("0");
        BigInteger b = new BigInteger("1");
        int term;
        for (term = 1; b.toString().length() < 1000; term++) {
            BigInteger temp = new BigInteger(b.toString());
            b = b.add(a);
            a = temp;
        }
        System.out.println(term);
    }
}
