import java.util.Calendar;
import java.util.GregorianCalendar;

/*
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
 */

public class Problem19 {
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
