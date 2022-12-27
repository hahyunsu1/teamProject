package com.chat.service;

import java.util.List;
import java.util.Map;

import com.chat.model.chatVO;

public interface ChatService {
	
	List<chatVO> selectchatList(Map<String, Object> map);

	List<chatVO> selectFirstChatList(int roomNo);

	int insertChat(chatVO chat);
}
