public class main {
    public static  void main(String[] args) {
        int sum = 1;
        int k = 1001;
        for (int i = 1; i <= (k-1)/2; i++) {
            sum += 4*(4*i*i + i + 1);
        }
        
        System.out.println(sum);
    }
}
