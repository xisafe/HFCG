package com.xt.cfp.core.constants;

import com.xt.cfp.core.enums.EnumsCanDescribed;

/**
 * Created by lenovo on 2015/6/18.
 */
public enum UserStatus implements EnumsCanDescribed {
    NORMAL("0","正常"),
    FREEZE("1","冻结"),
    DISABLED("2","禁用"),
    ;


    private final String value;
    private final String desc;

    private UserStatus(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    @Override
    public String getDesc() {
        return desc;
    }

    @Override
    public String getValue() {
        return value;
    }
}
