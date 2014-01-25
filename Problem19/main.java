import java.util.Calendar;
import java.util.GregorianCalendar;

public class main {
    public static void main(String[] args) {
        GregorianCalendar gc = new GregorianCalendar();
        gc.set(1901, 1, 1);
        int sundays = 0;
        while (gc.get(Calendar.YEAR) != 2001 && gc.get(Calendar.MONTH) != 12 && gc.get(Calendar.DAY_OF_MONTH) != 31) {
            if (gc.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                sundays++;
            }
            gc.add(Calendar.MONTH, 1);
        }
        System.out.println(sundays);
    }
}
