package topseller.models;

import java.util.Calendar;
import java.util.Date;

public abstract class Utilities {
    public static String getToday(){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        String today = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
        return today;
    }
}
