package com.techboard.controller.cmpInfo;

import java.awt.Label;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techboard.controller.common.ExcelUtil;
import com.techboard.service.itfc.cmpInfo.CmpInfoService;
import com.techboard.vo.cmpInfo.CmpInfoVO;
import com.techboard.vo.common.Pagination;
/**
 * 이종훈 CmpInfoController
 * 회사 정보 처리 관련 Controller
 * @author JONGHOON
 *
 */
@Controller(value= "cmpInfoController")
@RequestMapping(value = "/cmp/info")
public class CmpInfoController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(CmpInfoController.class);

	@Autowired
	private CmpInfoService cmpInfoService;

	/**
	 * 회사 정보 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoList")
	public ModelAndView cmpInfoList(CmpInfoVO cmpInfoVo, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize, 
			@ModelAttribute("searchKeyword") String searchKeyword, 
			@ModelAttribute("searchContent") String searchContent ) {
		
		ModelAndView mv = new ModelAndView();
		LOGGER.info("CmpInfoList Start>>>>>>>>>>>");
		
		// 검색어 처리 
		if(null != searchContent || !("".equals(searchContent)) ) {
			
			cmpInfoVo = this.checkSearchFnc(mv, cmpInfoVo, searchKeyword, searchContent);		// 검색어 처리 Method
			
			// 회사명 || 회사위치 일 경우만 값을 유지
			if ( "cmpTitle".equals(searchKeyword) || "cmpLocation".equals(searchKeyword) ) {
				mv.addObject("searchKeyword", searchKeyword);
			}
		}
		
		try {
			CmpInfoVO cmpInfoListCnt = cmpInfoService.selectCmpInfoListCnt(cmpInfoVo);
			mv.addObject("cmpInfoListCnt", cmpInfoListCnt);
			
			int cmpInfoCnt = cmpInfoListCnt.getCmpInfoCnt();
			
			Pagination pagination = new Pagination(cmpInfoCnt, curPage);
	        
	        cmpInfoVo.setStartIndex(pagination.getStartIndex());
	        cmpInfoVo.setCntPerPage(pageSize);
			
			List<CmpInfoVO> list = cmpInfoService.selectCmpInfoList(cmpInfoVo);
			mv.addObject("cmpInfoList", list);
			
			mv.addObject("pagination", pagination);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("cmp/info/cmpInfoList");
		return mv;
	}
	
	/**
	 * 게시물 등록 화면
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoInsertPage")
	public ModelAndView cmpInfoInsertPage(Model model) {
		LOGGER.info("Jonghoon cmpInfoInsertPage Start>>>>>>>>>>>");
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("cmp/info/cmpInfoInsert");
		
		return mv;
	}
	
	/**
	 * 게시물 등록 
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoInsert", method = RequestMethod.POST)
	public ModelAndView cmpInfoInsert(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoInsert");
		ModelAndView mv = new ModelAndView();
		
		try {
			cmpInfoService.cmpInfoInsert(cmpInfoVo);
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 게시판 메인 페이지로 이동
		return mv;
	}
	
	/**
	 * 회사정보 상세 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoDetail", method = RequestMethod.POST)
	public ModelAndView cmpInfoDetail(CmpInfoVO cmpInfoVo) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("cmpInfoController >> cmpInfoDetail");
		LOGGER.info("Jonghoon cmpInfoDetail Start>>>>>>>>>>>");
		LOGGER.info("cmpInfoVo>>>>>>>>>>>"+cmpInfoVo);
		try {
			mv.addObject("cmpPageFlag", cmpInfoVo.getCmpPageFlag());		// 화면 뒤로가기 일때 각 상황에 따른 처리를 위해 추가
			CmpInfoVO cmpInfoDetail = cmpInfoService.selectCmpInfoDetail(cmpInfoVo);
			mv.addObject("cmpInfoDetail", cmpInfoDetail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("cmp/info/cmpInfoDetail");
		return mv;
	}
	
	/**
	 * 회사정보 수정 페이지
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdatePage")
	public ModelAndView cmpInfoUpdatePage(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("Jonghoon cmpInfoUpdatePage Start>>>>>>>>>>>");
		
		ModelAndView mv = new ModelAndView();
		
		try {
			CmpInfoVO cmpInfoItem = cmpInfoService.selectCmpInfoDetail(cmpInfoVo);
			mv.addObject("cmpInfoItem", cmpInfoItem);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("cmp/info/cmpInfoUpdate");
		
		return mv;
	}
	
	/**
	 * 회사정보 수정
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdate", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdate(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdate");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdate(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		return mv;
	}
	
	/**
	 * 회사정보 삭제
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoDelete", method = RequestMethod.POST)
	public ModelAndView cmpInfoDelete(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("BoardController >> cmpInfoDelete");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		try {
			result = cmpInfoService.cmpInfoDelete(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		
		return mv;
	}
	
	/**
	 * 한줄평 입력 기능
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateEtc", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateEtc(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateEtc");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateEtc(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		
		return mv;
	}
	
	/**
	 * 회사 지원하기 기능
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateApplyYn", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateApplyYn(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateApplyYn");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateApplyYn(cmpInfoVo);		// 지원 상태 변경
			cmpInfoService.cmpApplyInfoInsert(cmpInfoVo);				// 회사_지원 테이블 데이터 적재
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		
		return mv;
	}
	
	/**
	 * '즐겨찾기' 기능 수정
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateFavoritesYn", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateFavoritesYn(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateFavoritesYn");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateFavoritesYn(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		
		return null;
	}
	
	/**
	 * [기타] 회사 정보 수정 기능 - 회사 이메일 회신여부
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateReplyYn", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateReplyYn(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateReplyYn");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateReplyYn(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		
		return mv;
	}
	
	/**
	 * '즐겨찾기' 기능 수정
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateGoodYn", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateGoodYn(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateGoodYn");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateGoodYn(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		
		return null;
	}
	/**
	 * 회사 정보 목록 전체 다운로드
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoListTotalDownload")
	public void downloadCustomerInfo(CmpInfoVO cmpInfoVo, HttpServletResponse response) {
        
		// 오늘날짜
	    String strToday = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
	    
	    // Sheet 생성
	    XSSFWorkbook workbook = new XSSFWorkbook();
	    XSSFSheet sheet = workbook.createSheet("회사목록_"+strToday);
	    XSSFRow row = null;
	    XSSFCell cell = null;
	    int rowCount = 0;
	    int cellCount = 0;
	 
	    
	    // Header / Body 초기 구성 + body 중앙정렬
	    CellStyle headStyle = ExcelUtil.configHeadStyleExcel(workbook);
	    CellStyle bodyStyle = ExcelUtil.configBodyStyleExcel(workbook);
	    CellStyle centerBodyStyle = ExcelUtil.configCenterTxtStyleExcel(workbook);
	   
	    
	    // 헤더 생성
	    row = sheet.createRow(rowCount++);
	    String[] headers = {"번호", "회사명(회사위치)", "공고 제목", "공고 유형", "회사규모", "입사율/퇴사율", "지원상태", "마감일자"};
	    
	    for(int i=0; i<headers.length; i++){
	        cell = row.createCell(cellCount++);
	        cell.setCellStyle(headStyle);
	        cell.setCellValue(headers[i]);
	    }
	    
	    
	    // 데이터 조회
		try {
			 List<CmpInfoVO> cmpInfoList = cmpInfoService.selectCmpInfoListTotalDownLoad(cmpInfoVo);
			
			// 데이터 생성
		    for (CmpInfoVO list : cmpInfoList) {
		        row = sheet.createRow(rowCount++);
		        cellCount = 0;
		        
		        // 바디 셀에 데이터 입력, 스타일 적용
		        // 1 Sell: 번호
		        cell = row.createCell(cellCount++);
		        cell.setCellStyle(centerBodyStyle);
		        cell.setCellValue(list.getRownum());   // 번호
		        
		        // 2 Sell: 회사명(회사위치)
		        cell = row.createCell(cellCount++);
		        cell.setCellStyle(centerBodyStyle);
		        cell.setCellValue(list.getCmpTitle()+"\n ("+list.getCmpLocation()+")");  // 회사명(회사위치)

		        // 3 Sell: 공고제목
		        cell = row.createCell(cellCount++);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(list.getCmpJobPosition());  //  공고제목
		        
		        // 3 Sell: 공고유형
		        switch (list.getCmpRecuritKind()) {
				case "1":
					list.setCmpRecuritKind("사람인");
					break;
				case "2":
					list.setCmpRecuritKind("잡코리아");
					break;
				case "3":
					list.setCmpRecuritKind("헤드헌터");
					break;
				case "4":
					list.setCmpRecuritKind("인사담당자");
					break;
				default:
					break;
				}
		        cell = row.createCell(cellCount++);
		        cell.setCellStyle(centerBodyStyle);
		        cell.setCellValue(list.getCmpRecuritKind());  // 공고 유형
		        
		        // 4 Sell: 공고 유형
		        switch (list.getCmpKind()) {
				case "1":
					list.setCmpRecuritKind("중소기업");
					break;
				case "2":
					list.setCmpRecuritKind("중견기업");
					break;
				case "3":
					list.setCmpRecuritKind("대기업");
					break;
				case "4":
					list.setCmpRecuritKind("외국계 기업");
					break;
				case "5":
					list.setCmpRecuritKind("공공 기업");
					break;
				default:
					list.setCmpRecuritKind("미지정 기업");
					break;
				}
		        
		        // 5 Sell: 회사 규모
		        String cmpScale = list.getFoundedYear() + "년차 /"+ list.getCmpEmpCnt() +"명 / \n" +list.getCmpKind()+ list.getCmpTouch()+"억 / "+list.getCmpRecuritKind();
		        cell = row.createCell(cellCount++);
		        cell.setCellStyle(centerBodyStyle);
		        cell.setCellValue(cmpScale);    // 회사 규모
		        
		        // 6 Sell: 입사율/퇴사율
		        String cmpState = list.getCmpIncedenceRate() +"% / "+ list.getCmpResignationRate()+"%";
		        cell = row.createCell(cellCount++);
		        cell.setCellStyle(centerBodyStyle);
		        cell.setCellValue(cmpState);    // 회사 규모
		        
		        // 7 Sell: 지원상태
		        if ("Y".equals(list.getCmpApplyYn())) {
					list.setCmpApplyYn("지원");
				} else if("N".equals(list.getCmpApplyYn())) {
					list.setCmpApplyYn("미 지원");
				}
		        cell = row.createCell(cellCount++);
		        cell.setCellStyle(centerBodyStyle);
		        cell.setCellValue(list.getCmpApplyYn());  // 지원상태
		        
		        
		        // 8 Sell: 마감일자
		        if( 0 == Integer.parseInt(list.getDeadlineDay()) ) {
		        	list.setDeadlineDay("(오늘마감)");
		        } else if (0 > Integer.parseInt(list.getDeadlineDay())) {
		        	list.setDeadlineDay("(공고마감)");
		        } else if( 0 < Integer.parseInt(list.getDeadlineDay())) {
		        	list.setDeadlineDay("("+list.getDeadlineDay() + ")일 전");
		        }
		        String deadlineDttm = "~ "+list.getCmpDeadlineDttm()+"\n" + list.getDeadlineDay(); 
		        cell = row.createCell(cellCount++);
		        cell.setCellStyle(centerBodyStyle);
		        cell.setCellValue(deadlineDttm);  // 마감일자
		    }
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    
	    // 셀 와이드 설정
	    for (int i=0; i< headers.length; i++){
	        sheet.autoSizeColumn(i, true);
	        if(i == 11){ // 컬럼별 넓이정의
	            sheet.setColumnWidth(i, 7000);
	        }
	    }
	    
	    String filename = "회사 목록_"+strToday+".xlsx";
	    String filePath = ExcelUtil.makeFile(workbook, filename);
	    
	    ExcelUtil.fileDownload(filePath, filename, response);
	}
	
	
		
	private CellRangeAddress CellRangeAddress(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 검색어 처리 Method
	 * 차후 공용 Method로 변경 예정
	 * @param boardVo
	 * @return
	 */
	public CmpInfoVO checkSearchFnc(ModelAndView mv, CmpInfoVO cmpInfoVo, String keyword, String content) {
		
		switch (keyword) {
		
		// 회사명
		case "cmpTitle":
			cmpInfoVo.setCmpTitle(content);
			mv.addObject("searchContent", content);
			break;
		
		// 회사 위치
		case "cmpLocation":
			cmpInfoVo.setCmpLocation(content);
			mv.addObject("searchContent", content);
			break;
		
		// 공고 유형
		case "cmpRecuritKind":
			cmpInfoVo.setCmpRecuritKind(content);
			break;	
			
		// 지원 여부
		case "cmpApplyYn":
			cmpInfoVo.setCmpApplyYn(content);
			break;	
			
		// 좋아요 여부
		case "cmpGoodYn":
			cmpInfoVo.setCmpGoodYn(content);
			break;
			
		default:
			break;
		}
		
		return cmpInfoVo;
	}
	
	
	
}