import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Scanner;

/*
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.

What is the total of all the name scores in the file?
 */

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
