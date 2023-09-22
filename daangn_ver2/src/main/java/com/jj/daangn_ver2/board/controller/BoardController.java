package com.jj.daangn_ver2.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jj.daangn_ver2.board.model.service.BoardService;
import com.jj.daangn_ver2.board.model.vo.Attachment;
import com.jj.daangn_ver2.board.model.vo.Board;
import com.jj.daangn_ver2.common.template.Pagination;
import com.jj.daangn_ver2.common.vo.PageInfo;

@Controller
public class BoardController {
	
	@Autowired
	public BoardService boardService;
	
	//게시글 페이지로
	@RequestMapping("listForm.bo")
	public ModelAndView ListForm(@RequestParam(value="category", defaultValue="1")String category,
								@RequestParam(value="currentPage", defaultValue="0")int currentPage,
								@RequestParam(value="subCategory", defaultValue="0")String subCategory,
								@RequestParam(value="search", defaultValue="0")String search, ModelAndView mv) {
		
		//축제 페이지 로드시 찜 리스트 불러오기
//		ArrayList<choice> choiceList = festivalService.choiList();
		
		//축제 페이지 로드시 축제기간이 아닌 db는 상태값 N으로 바꿔주기
//		int result = festivalService.endFes();
		//축제 페이지 로드시 축제 기간이면 상태값 y로 바꿔주기(예정 축제도 N으로 바뀌어져있기때문)
//		int result2 = festivalService.FesIng();
		
		//검색시 카테고리
//		HashMap<String, String> keyword = new HashMap<>();
//			keyword.put("date", date);
//			keyword.put("area", area);
//			keyword.put("cate", cate);
//			keyword.put("day", nowDay);
		if(category.equals("1")) {
			//중고거래 게시판
			//검색 리스트 가져가기
			HashMap<String, String> keyword = new HashMap<>();
				keyword.put("category", category);
				keyword.put("subCategory", subCategory);
			
			//게시글 총 수
			int listCount = boardService.listCount(keyword);
			
			int pageLimit = 10;
			int boardLimit = 6;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			//게시글 리스트
			ArrayList<Board> list = boardService.boardList(keyword, pi);
			
	//		mv.addAttribute("list",list);
	//		mv.addAttribute("pi",pi);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("board/fleaForm");
	//		model.addAttribute("choiceList", new Gson().toJson(choiceList));
		}else if(category.equals("2")) {
			//동네가게 게시판
			//검색 리스트 가져가기
			HashMap<String, String> keyword = new HashMap<>();
				keyword.put("category", category);
				keyword.put("subCategory", subCategory);
			
			//게시글 총 수
			int listCount = boardService.listCount(keyword);
			
			int pageLimit = 10;
			int boardLimit = 6;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			//게시글 리스트
			ArrayList<Board> list = boardService.boardList(keyword, pi);
			
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("board/storeForm");
		}else {
			//알바 게시판
			//검색 리스트 가져가기
			HashMap<String, String> keyword = new HashMap<>();
				keyword.put("category", category);
				keyword.put("subCategory", subCategory);
				keyword.put("search", search);
			
			//게시글 총 수
			int listCount = boardService.listCount(keyword);
			
			int pageLimit = 10;
			int boardLimit = 6;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			//게시글 리스트
			ArrayList<Board> list = boardService.boardList(keyword, pi);
			
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("board/jobForm");
		}
		
		return mv;
	}
	
	//게시글 상세 페이지
	@RequestMapping("boardDetail.bo")
	public ModelAndView detailBoard(Board b, ModelAndView mv) {
		
		String boardNo = String.valueOf(b.getBoardNo());
		
		HashMap<String, String> boardInfo = new HashMap<>();
			boardInfo.put("category", b.getCategory());
			boardInfo.put("boardNo", boardNo);
		
		//각 카테고리별로
		if(b.getCategory().equals("1")) {
			
			//중고거래 카테고리로 들어왔을시
			b = boardService.boardDetail(boardInfo);
//			ArrayList<Reply> r = new ReplyService().selectReply(boardNo);
			
			switch(b.getSubCategory()) {
				case "1" : b.setSubCategory("디지털기기");
						break;
				case "2" : b.setSubCategory("스포츠, 레저");
						break;
				case "3" : b.setSubCategory("생활, 가전");
						break;
				case "4" : b.setSubCategory("티켓, 교환권");
						break;
				case "5" : b.setSubCategory("기타");
						break;
			}

			//조회수도 올려주기
			boardService.countUp(b.getBoardNo());
			
//			request.setAttribute("Reply", r);
			
			//요청 페이지로 위임
			mv.addObject("b", b).setViewName("board/fleaDetailForm");
			
		}else if(b.getCategory().equals("2")) {
			
			//동네가게에서 들어왔을시
			b = boardService.boardDetail(boardInfo);
//			ArrayList<Reply> r = new ReplyService().selectReply(boardNo);

			switch(b.getSubCategory()) {
				case "1" : b.setSubCategory("식당");
						break;
				case "2" : b.setSubCategory("카페");
						break;
				case "3" : b.setSubCategory("뷰티, 미용");
						break;
				case "4" : b.setSubCategory("운동");
						break;
				case "5" : b.setSubCategory("기타");
						break;
			}

			//조회수도 올려주기
			boardService.countUp(b.getBoardNo());

			mv.addObject("b", b).setViewName("board/storeDetailForm");
			
		}else {
			
			//알바로 들어왔을시
			b = boardService.boardDetail(boardInfo);
//			ArrayList<Reply> r = new ReplyService().selectReply(boardNo);
			System.out.println(b);
			//조회수도 올려주기
			boardService.countUp(b.getBoardNo());

			mv.addObject("b", b).setViewName("board/jobDetailForm");
			
		}
		return mv;
	}
	
	//글 작성 페이지로
	@RequestMapping("insertForm.bo")
	public String insertBoardForm() {
		return "board/boardInsertForm";
	}
	
	//게시글 작성 메소드
	@RequestMapping("insert.bo")
	public ModelAndView insertBoard(@RequestParam(value="open_h", defaultValue="00")String open_h, @RequestParam(value="open_m", defaultValue="00")String open_m,
									@RequestParam(value="close_h", defaultValue="00")String close_h, @RequestParam(value="close_m", defaultValue="00")String close_m,
									Board b, MultipartFile[] upfile,  HttpSession session, ModelAndView mv) {

		//파일 이름 바꾸기
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i=0; i<upfile.length; i++) {
			
			if(!upfile[i].getOriginalFilename().equals("")) {//파일이 있으면
					
				String originName = upfile[i].getOriginalFilename();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int ranNum = (int) (Math.random()*90000+10000);
				//확장자명 추출
				String ext = originName.substring(originName.lastIndexOf("."));
				//추출한 문자열 합쳐서 changeName만들기
				String changeName = currentTime+ranNum+ext;
				//업로드하는 경로
				String filePath = session.getServletContext().getRealPath("/resources/board_img/");
				
				//경로와 수정파일명 합쳐서 파일 업로드
				try {
					upfile[i].transferTo(new File(filePath+changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Attachment at = new Attachment();
					at.setAtName(originName);
					at.setAtChange(changeName);
					at.setAtPath("resources/board_img/"+changeName);

					//파일 레벨 나누기
					if(i==0) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
				list.add(at);
			}
		}
		
		//동네가게들어왔을시 오픈시간, 클로즈시간 처리
		if(b.getCategory().equals("2")) {
			String openTime = open_h+"시 "+open_m+"분";
			String closeTime= close_h+"시 "+close_m+"분";
			b.setOpenTime(openTime);
			b.setCloseTime(closeTime);
		}
		
		int result = boardService.insertBoard(b,list);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 등록이 완료되었습니다.");
			mv.setViewName("redirect:/");
		}else {//실패시
			//파일도 지워주기
			for(int i=0; i<list.size(); i++) {
				new File(session.getServletContext().getRealPath("/"+list.get(i).getAtPath())).delete();
			}
			mv.addObject("errorMsg", "게시글 등록에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//게시글 수정 페이지로 돌려주기
	@RequestMapping("updateForm.bo")
	public ModelAndView updateForm(Board b, ModelAndView mv) {
		
		String boardNo = String.valueOf(b.getBoardNo());
		
		HashMap<String, String> boardInfo = new HashMap<>();
			boardInfo.put("category", b.getCategory());
			boardInfo.put("boardNo", boardNo);
		
		Board boardDetail = boardService.boardDetail(boardInfo);
		
		mv.addObject("b", boardDetail).setViewName("board/boardUpdateForm");
		return mv;
	}
	
	//게시글 수정
	@RequestMapping("update.bo")
	public ModelAndView updateBoard(@RequestParam(value="open_h", defaultValue="00")String open_h,
									@RequestParam(value="open_m", defaultValue="00")String open_m,
									@RequestParam(value="close_h", defaultValue="00")String close_h,
									@RequestParam(value="close_m", defaultValue="00")String close_m,
									Board b, MultipartFile[] upfile,  HttpSession session, ModelAndView mv) {
		
		//파일 이름 바꾸기
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i=0; i<upfile.length; i++) {
			
			if(!upfile[i].getOriginalFilename().equals("")) {//파일이 있으면
					
				String originName = upfile[i].getOriginalFilename();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int ranNum = (int) (Math.random()*90000+10000);
				//확장자명 추출
				String ext = originName.substring(originName.lastIndexOf("."));
				//추출한 문자열 합쳐서 changeName만들기
				String changeName = currentTime+ranNum+ext;
				//업로드하는 경로
				String filePath = session.getServletContext().getRealPath("/resources/board_img/");
				
				//경로와 수정파일명 합쳐서 파일 업로드
				try {
					upfile[i].transferTo(new File(filePath+changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Attachment at = new Attachment();
					at.setBoardNo(b.getBoardNo());
					at.setAtName(originName);
					at.setAtChange(changeName);
					at.setAtPath("resources/board_img/"+changeName);

					//파일 레벨 나누기
					if(i==0) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
				list.add(at);
			}
		}
		
		//동네가게들어왔을시 오픈시간, 클로즈시간 처리
		if(b.getCategory().equals("2")) {
			String openTime = open_h+"시 "+open_m+"분";
			String closeTime= close_h+"시 "+close_m+"분";
			b.setOpenTime(openTime);
			b.setCloseTime(closeTime);
		}
		
		int result = boardService.updateBoard(b,list);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정이 완료되었습니다.");
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	//게시글 삭제
	@RequestMapping("delete.bo")
	public ModelAndView deleteBoard(@RequestParam("atPath")String atPath, Board b, ModelAndView mv, HttpSession session) {
		
		String boardNo = String.valueOf(b.getBoardNo());
		
		HashMap<String, String> boardInfo = new HashMap<>();
			boardInfo.put("category", b.getCategory());
			boardInfo.put("boardNo", boardNo);
			
		int result = boardService.deleteBoard(boardInfo);
		
		if(result>0) {
			//삭제 성공시
			mv.setViewName("redirect:/");
			//파일도 같이 지워주기
			new File(session.getServletContext().getRealPath("/"+atPath)).delete();
		}else {
			//삭제 실패시
			mv.addObject("errorMsg", "게시글 삭제에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
}
