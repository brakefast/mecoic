package com.common;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public final class CommonUtil {
    private CommonUtil(){}

    public static final String getTimeStamp(){
        StringBuilder uuid = new StringBuilder();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSSSS");
        Date date = new Date();
        uuid.append(df.format(date));
        return uuid.toString();
    }

}
