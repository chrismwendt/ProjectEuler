import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Scanner;

public class main {
    public static void main(String[] args) {
        Scanner sc = null;
        try {
            sc = new Scanner(new File("names.txt"));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        String s[] = sc.next().replaceAll("\"", "").split(",");
        Arrays.sort(s);
        
        int sum = 0;
        for (int i = 0; i < s.length; i++) {
            sum += (i+1) * score(s[i]);
        }
        
        System.out.println(sum);
    }
    
    private static int score(String name) {
        int sum = 0;
        for (int i = 0; i < name.length(); i++) {
            sum += name.charAt(i) - 'A' + 1;
        }
        return sum;
    }
}
