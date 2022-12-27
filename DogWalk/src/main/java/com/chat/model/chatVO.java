package com.chat.model;

import lombok.Data;

@Data
public class chatVO {
	private String nname;
    private String content;
    private String datetime;
    private String profile;

    @Override
    public String toString() {
        return "ChatMessage [nname=" + nname + ", content=" + content + ", datetime=" + datetime + ", profile="
                + profile + "]";
    }
}
