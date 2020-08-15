package com.techboard.controller.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Workbook;

public class ExcelConfig {
	
	/**
	 * 엑셀 Header 초기 구성 
	 * @param workbook
	 */
	public static CellStyle configHeadStyleExcel(Workbook workbook) {
		// 첫번째 로우 폰트 설정
	    Font headFont = workbook.createFont();
	    headFont.setFontHeightInPoints((short) 11);
	    headFont.setFontName("돋움");
	 
	    // 첫번째 로우 셀 스타일 설정
	    CellStyle headStyle = workbook.createCellStyle();
	    headStyle.setAlignment(CellStyle.ALIGN_CENTER);
	    headStyle.setFont(headFont);
	    headStyle.setBorderBottom(CellStyle.BORDER_THIN);
	    headStyle.setBorderLeft(CellStyle.BORDER_THIN);
	    headStyle.setBorderRight(CellStyle.BORDER_THIN);
	    headStyle.setBorderTop(CellStyle.BORDER_THIN);
	    headStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
	    headStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	    
	    return headStyle;
	}
	
	/**
	 * 엑셀 Body 초기 구성 
	 * @param workbook
	 */
	public static CellStyle configBodyStyleExcel(Workbook workbook) {
		// 바디 폰트 설정
		Font bodyFont = workbook.createFont();
		bodyFont.setFontHeightInPoints((short) 9);
		bodyFont.setFontName("돋움");
		
		// 바디 스타일 설정
		CellStyle bodyStyle = workbook.createCellStyle();
		bodyStyle.setFont(bodyFont);
		bodyStyle.setWrapText(true);
		bodyStyle.setBorderBottom(CellStyle.BORDER_THIN);
		bodyStyle.setBorderLeft(CellStyle.BORDER_THIN);
		bodyStyle.setBorderRight(CellStyle.BORDER_THIN);
		bodyStyle.setBorderTop(CellStyle.BORDER_THIN);
		bodyStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		
		return bodyStyle;
	}
	
	public static CellStyle configCenterTxtStyleExcel(Workbook workbook) {
		// 바디 폰트 설정
		Font bodyFont = workbook.createFont();
		bodyFont.setFontHeightInPoints((short) 9);
		bodyFont.setFontName("돋움");
		
		// 바디 스타일 설정
		CellStyle centerStyle = workbook.createCellStyle();
		centerStyle.setFont(bodyFont);
		centerStyle.setWrapText(true);
		centerStyle.setBorderBottom(CellStyle.BORDER_THIN);
		centerStyle.setBorderLeft(CellStyle.BORDER_THIN);
		centerStyle.setBorderRight(CellStyle.BORDER_THIN);
		centerStyle.setBorderTop(CellStyle.BORDER_THIN);

		centerStyle.setAlignment(CellStyle.ALIGN_CENTER);
		centerStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		
		return centerStyle;
	}
	
	
	/**
	 * 파일다운로드 로직 처리 
	 * @param filePath
	 * @param filename
	 * @param response
	 */
	public static void fileDownload(String filePath, String filename, HttpServletResponse response){
	    
		try {
	        File f = new File(filePath+filename);
	        if (!f.exists()) {
	            System.out.println("error"); // 존재하지 않는 파일 다운로드
	        }
	     // 오늘날짜
	        filename = new String(filename.getBytes("euc-kr"), "8859_1");
	        response.setContentType("application/octet-stream");
	        response.setHeader("Content-disposition", "attachment;filename="+ filename);
	 
	        // 파일 내용을 클라이언트에 전송
	        byte[] b = new byte[1024];
	        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
	        OutputStream os = response.getOutputStream();
	 
	        int n;
	        while ((n = bis.read(b, 0, b.length)) != -1) { // 파일을 모두 읽으면 -1리턴
	            os.write(b, 0, n);
	        }
	        os.flush();
	        os.close();
	        bis.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	/**
	 * 엑셀 생성 경로설정 및 자원종료
	 * @param workbook
	 * @param filename
	 * @return
	 */
	public static String makeFile(Workbook workbook, String filename) {
		// 오늘날짜
	    String strToday = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
	    
		// 엑셀생성 경로설정 및 자원종료
	    String filePath = "";
	    try {
	        filePath = "/static/download/excel/"+strToday+"/"; // file 생성 위치 
	        filename = "회사목록_"+strToday+".xlsx"; // 생성될 파일 이름
	        
	        // 엑셀 파일 생성
	        File fDir = new File(filePath);
	        if (!fDir.exists()) { // 디렉토리 없으면 생성
	            fDir.mkdirs(); 
	        }
	 
	        FileOutputStream fout = new FileOutputStream(filePath + filename);
	        workbook.write(fout);
	        fout.close();
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return filePath;
	}
	
}
