package com.common;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class CommonUtil {
<<<<<<< HEAD
	
	public String addMsgLoc(Model m,String msg,String loc) {
		m.addAttribute("message",msg);
		m.addAttribute("loc",loc);
		return "msg";
	}
	public String addMsgBack(Model m, String msg) {
		m.addAttribute("message",msg);
		m.addAttribute("loc","javascript:history.back()");
		return "msg";
		
=======
	public String addMsgLoc(Model m, String msg, String loc) {
		m.addAttribute("message", msg);
		m.addAttribute("loc", loc);
		return "msg";
	}
	
	public String addMsgBack(Model m, String msg) {
		m.addAttribute("message", msg);
		m.addAttribute("loc", "javascript:history.back()");
		return "msg";
>>>>>>> 3a6178e20cf2af11fdf12aa1d08bdfcf99d6a678
	}
}
