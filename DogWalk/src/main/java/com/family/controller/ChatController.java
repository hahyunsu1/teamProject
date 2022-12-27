package com.family.controller;

import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.chat.model.chatVO;

@Controller
public class ChatController {
	
	// 채팅 메세지 전달
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public chatVO broadcasting(chatVO chat) {
 	
        chat.setSendDate(new Date());
        
        return chatVO;
    }
}
