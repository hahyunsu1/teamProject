package com.chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chat.model.chatVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatService cs;
	@Override
	public List<chatVO> selectchatList(Map<String, Object> map) {
		List<chatVO> list = cs.selectchatList(map);
//		log.info("daoList={}",list);
		return list;
	}

	@Override
	public List<chatVO> selectFirstChatList(int roomNo) {
		
		return cs.selectFirstChatList(roomNo);
	}

	@Override
	public int insertChat(chatVO chat) {
		
		return cs.insertChat(chat);
	}

}
