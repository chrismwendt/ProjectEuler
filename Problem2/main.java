public class main {
    public static void main(String[] args) {
        int a = 0;
        int b = 1;
        int sum = 0;
        while (b <= 4000000) {
            int temp = b;
            b = a + b;
            a = temp;
            if (b%2 == 0) {
                sum += b;
            }
        }
        
        System.out.println(sum);
    }
}
