/*
A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
 */

/*
 * solved by hand:
 * 2*9! + 6*8! + 6*7! + 2*6! + 5*5! + 1*4! + 2*3! + 1*2! + 1*1! + 0*0! + 1 = 1000000
 * initial |0123456789
 * 2       2|013456789
 * 6       27|01345689
 * 6       278|0134569
 * 2       2783|014569
 * 5       27839|01456
 * 1       278391|0456
 * 2       2783915|046
 * 1       27839154|06
 * 1       278391546|0
 * 0       2783915460|
 */

public class main {
    public static static void main(String[] args) {
        System.out.println("2783915460");
    }
}
