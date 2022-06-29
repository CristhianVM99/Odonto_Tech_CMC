package com.odontotech.utiles;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
public class DateFormat {

    private static SimpleDateFormat dtf;
    private static Calendar cal;
    private static Date d;
    private static String val;

    public DateFormat(String formato) {
        this.dtf = new SimpleDateFormat(formato);
        fecha_actual();
    }
 public DateFormat(String formato,Date fecha) {
        this.dtf = new SimpleDateFormat(formato);
        this.d=fecha;
        fecha_convert();
    }
    public static String getDateHoy() {
        return val;
    }
       public static String getDateConvert() {
        return val;
    }
 private void fecha_convert() {    
        this.val = this.dtf.format(d);
    }
    
    private void fecha_actual() {
        this.cal = cal.getInstance();
        this.d = (Date) cal.getTime();
        this.val = this.dtf.format(d);
    }

}//class
