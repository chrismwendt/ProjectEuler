public class main {
    public static void main(String[] args) {
        assert letters(1) == "one".length();
        assert letters(9) == "nine".length();
        assert letters(11) == "eleven".length();
        assert letters(19) == "nineteen".length();
        assert letters(20) == "twenty".length();
        assert letters(21) == "twentyone".length();
        assert letters(29) == "twentynine".length();
        assert letters(101) == "onehundredandone".length();
        assert letters(144) == "onehundredandfortyfour".length();
        assert letters(24) == "twentyfour".length();
        assert letters(990) == "ninehundredandninety".length();
        assert letters(7) == "seven".length();
        assert letters(19) == "nineteen".length();
        assert letters(85) == "eightyfive".length();
        assert letters(200) == "twohundred".length();
        assert letters(1000) == "onethousand".length();
        int sum = 0;
        for (int i = 1; i <= 1000; i++) {
            sum += letters(i);
        }
        System.out.println(sum);
    }

    private static int letters(int i) {
        String ones[] = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };
        String tens[] = { "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" };
        String decs[] = { "", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety" };
        
        if (i == 0) {
            return 0;
        } else if (i < 10) {
            return ones[i - 1].length();
        } else if (i < 20) {
            return tens[i - 10].length();
        } else if (i < 100) {
            return decs[i/10].length() + letters(i - i/10*10);
        } else if (i < 1000) {
            int count = letters(i/100) + "hundred".length();
            if (i%100 == 0) {
                return count;
            }
            return count + "and".length() + letters(i - i/100*100);
        } else {
            return "onethousand".length();
        }
    }
}
