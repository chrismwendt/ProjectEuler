import java.util.LinkedList;
import java.util.List;

public class Main {
	public static void main(String[] args) {
		List<Problem> problems = new LinkedList<Problem>();
		problems.add(new Problem31());
		for (Problem problem : problems) {
			problem.run();
		}
		/*
		 * 
		StdDraw.setCanvasSize();
		StdDraw.setPenRadius(0.006);
		StdDraw.show();

		Stopwatch s = new Stopwatch();
		int limit = 10000000;
		for (int i = 10; i < limit; i *= 1.2) {
			s.restart();
			run1(i);
			double time1 = s.seconds();
			StdDraw.setPenColor(StdDraw.BLACK);
			StdDraw.point((double)i / limit, time1 / 10);
			
			s.restart();
			run2(i);
			double time2 = s.seconds();
			StdDraw.setPenColor(StdDraw.RED);
			StdDraw.point((double)i / limit, time2 / 10);
			StdDraw.setPenColor(StdDraw.BLUE);
			StdDraw.point((double)i / limit, time1 / time2);
		}
		 */
	}
}
