package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum statusCode {
    CHUA_XL("Chưa xử lí"),
    DANG_XL("Đang xử lí"),
    DA_XL("Đã xử lí");

    public final String name;
    statusCode(String name) {
        this.name = name;
    }
    public static Map<String, String> type(){
        Map<String, String> listType = new HashMap<>();
        for(statusCode item : statusCode.values()){
            listType.put(item.toString(), item.name);
        }
        return listType;
    }
}
