package com.family.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.common.CommonUtil;
import com.family.file.service.ObjectStorageService;
import com.family.model.AnimalBoardVO;
import com.family.model.PagingVO;
import com.family.service.AnimalBoardService;
import com.member.model.MemberVO;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/comanimal")
@Log4j
public class AnimalController {
	
	@Resource(name="animalBoardServiceImpl")
	private AnimalBoardService animalBoardService;
	
	@Autowired
	private ObjectStorageService os;
	@Inject
	private CommonUtil util;
	
	@GetMapping("/comanimalwrite")
	public String animalForm() {
		
		return "comanimal/comanimalwrite";
	}
	@PostMapping("/comanimalwrite")
	public String animalInsert(Model m,@RequestParam("mfilename") MultipartFile mfilename,
			@ModelAttribute AnimalBoardVO amb,
			HttpServletRequest req,HttpSession httpSession) {
		
		ServletContext app=req.getServletContext();
		String upImg=app.getRealPath("/resources/animal_board_images");
		
		File img=new File(upImg);
		if(!img.exists()) { 
			img.mkdirs();
		}
		if(!mfilename.isEmpty()) {
			String originFname=mfilename.getOriginalFilename();
			long fsize=mfilename.getSize();
		
		
			UUID uuid=UUID.randomUUID();
			String filename=uuid.toString()+"_"+originFname;
			
			if(amb.getMode().equals("edit")&& amb.getOld_filename()!=null) {
				File delImg=new File(upImg,amb.getOld_filename());
				if(delImg.exists()) {
					boolean b=delImg.delete();
				}//if
			}//if
			try {
				mfilename.transferTo(new File(upImg,filename));
				log.info("upImg=====>"+upImg);
			}catch(Exception e) {
				log.error("????????? error"+e);
			}
			
			amb.setFilename(filename);
			amb.setOriginFilename(originFname);
			amb.setFilesize(fsize);
			
		}//if
		if(amb.getNick()==null||amb.getTitle()==null||amb.getCpass()==null||amb.getPet()==null||
				amb.getNick().trim().isEmpty()||amb.getTitle().trim().isEmpty()||
				amb.getCpass().trim().isEmpty()||amb.getPet().trim().isEmpty()) {
			return "redirect:write";
			
		}
		int n=0;
		String str="",loc="";
		if("write".equals(amb.getMode())) {
			n=this.animalBoardService.insertBoard(amb);
			str="????????? ";
		}
		
		if("edit".equals(amb.getMode())) {
			n=this.animalBoardService.updateBoard(amb);
			str="????????? ";
		}
		str+=(n>0)?"??????":"??????";
		loc=(n>0)?"animal_boardlist":"javascript:history.back()";
		log.info(m+"/"+str+"/"+loc);
		
		return util.addMsgLoc(m, str, loc);
	}
	
	 @GetMapping("/animal_boardlist")
	 public String animalBoardList(Model m, @ModelAttribute("page") PagingVO page,
			 HttpServletRequest req,@RequestHeader("user-Agent") String userAgent) {
		 String myctx=req.getContextPath();//???????????????"/multiweb"
			
		 HttpSession ses=req.getSession();
		 int totalCount=this.animalBoardService.getTotalCount(page);
		 page.setTotalCount(totalCount);
		 
		 page.setPagingBlock(5);
		 
		 page.init(ses);
		 List<AnimalBoardVO> ambArr=this.animalBoardService.selectBoardAllPaging(page);
		 
		 String loc="comanimal/animal_boardlist";
		 String pageNavi=page.getPageNavi(myctx, loc, userAgent);
		
		 m.addAttribute("pageNavi",pageNavi);
		 m.addAttribute("paging",page);
		 m.addAttribute("ambArr",ambArr);
		 
		 return "comanimal/animal_boardlist";
	 }
	 @GetMapping("/view/{cnum}")
	 public String animalBoardView(Model m,@PathVariable("cnum") int cnum,HttpSession httpSession) {
		 int n=this.animalBoardService.updateCnt(cnum);
		 AnimalBoardVO amb=this.animalBoardService.selectBoardByIdx(cnum);
		 String userid = (String) httpSession.getAttribute("userid");
		String nick = (String) httpSession.getAttribute("nick");
		 m.addAttribute("amb",amb);
		 httpSession.setAttribute("amb", amb);
		 httpSession.setAttribute("userid", userid);
		 httpSession.setAttribute("nick", nick);
		 log.info(amb+"/"+userid+"/"+nick);
		 return "comanimal/animal_board_view";
	 }
	 @PostMapping("/delete")
	 public String boardDelete(Model m,
				HttpServletRequest req,
				@RequestParam(defaultValue = "0") int cnum,
				@RequestParam(defaultValue = "") String cpass) {
			
			if(cnum==0||cpass.isEmpty()) {
				return "redirect:animal_boardlist";
			}
			//?????? ?????? db?????? ????????????
			AnimalBoardVO vo=this.animalBoardService.selectBoardByIdx(cnum);
			if(vo==null) {
				return util.addMsgBack(m, "?????? ?????? ???????????? ?????????");
			}
			//???????????? ???????????? ???????????? ???????????? ????????????
			String dbPwd=vo.getCpass();
			if(!dbPwd.equals(cpass)) {
				return util.addMsgBack(m, "??????????????? ???????????? ?????????");
			}
			//db?????? ??? ????????????
			int n=this.animalBoardService.deleteBoard(cnum);
			
			ServletContext app=req.getServletContext();
			String upDir=app.getRealPath("/resources/spring_board_images");
			//log.info("updir===>"+upDir);
			//????????? ???????????? ??????????????? ????????? ???????????? ?????? ??????
			if(n>0 && vo.getFilename()!=null) {
				File f=new File(upDir,vo.getFilename());
				if(f.exists()) {
					boolean b=f.delete();
					//log.info("???????????? ??????: "+b);
				}
			}
			String str=(n>0)?"??? ?????? ??????":"?????? ??????";
			String loc=(n>0)?"animal_boardlist":"javascript:history.back()";
			
			return util.addMsgLoc(m, str, loc);
		}
		@PostMapping("/edit")
		public String boardEditform(Model m,
				@RequestParam(defaultValue = "0") int cnum,
				@RequestParam(defaultValue = "") String cpass) {
			AnimalBoardVO vo=this.animalBoardService.selectBoardByIdx(cnum);
			//1.?????????,?????? ????????? ??????==> list redirect??????
			if(cnum==0||cpass.isEmpty()) {
				return "redirect:animal_boardlist";
			}
			
			//2. ???????????? ?????? ??? ?????????????????? ????????? "?????? ????????????"
			if(vo==null) {
				return util.addMsgBack(m, "?????? ????????????");
			}
			//3.?????? ??????->?????? ?????? ????????? "?????????"back??????
			String dbPwd=vo.getCpass();
			if(!dbPwd.equals(cpass)) {
				return util.addMsgBack(m, "??????????????? ???????????? ?????????");
			}
			//4.Model??? ?????? ??? ??????"board"
			m.addAttribute("amb",vo);
			return "comanimal/animal_board_Edit";
		}
}
