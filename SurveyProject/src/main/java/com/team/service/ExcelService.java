package com.team.service;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelService {
	
	public static void makeExcel(String fileName, String[] result, String question) throws Exception{
		
		Workbook workbook = null;
		if(fileName.endsWith("xlsx")) workbook = new XSSFWorkbook();
		else if(fileName.endsWith("xls")) workbook = new HSSFWorkbook();
		else throw new Exception("invalid file name, should be xls or xlsx");
		
		/*-----------문항 가져오기-------------*/
		String[] qu = question.split(",");
		List<String> qu1 = new ArrayList<String>(); 
		for (int i = 0; i < qu.length; i++) {
			if(qu[i].substring(0,1).equals("q")) {
				qu1.add((qu[i].split(":"))[1]);
			}
		}
		
		/*--------------답변 가져오기 ------------*/
		List<String> re = new ArrayList<String>(); 

	
		for(String r1 : result) {
			String[] r2 = r1.split(":");
			try {
				re.add(r2[1]);	// 결과 값 저장
			} catch(Exception e){
				re.add(r2[0]);	// 참가 인원수 저장
			}
		}
		
		/*--------셀 스타일 -------*/
		Sheet sheet = workbook.createSheet("설문조사 결과");
		sheet.setColumnWidth(0, 10000);
		sheet.setColumnWidth(1, 10000);

		int rowIndex = 0;
		int excelname=0; // 처음 고정값을 넣기 위해 사용한 변수	
		
		for (int i = -1; i < re.size()-1; i++) {
			Row row = sheet.createRow(rowIndex++);
			if(excelname == 0){ // 처음에 고정값 
				Cell cell0 = row.createCell(0);
				cell0.setCellValue("질문");
				Cell cell1 = row.createCell(1);
				cell1.setCellValue("결과");
				excelname++;
			}
			else {
				Cell cell0 = row.createCell(0);
				cell0.setCellValue(qu1.get(i).toString());				
				Cell cell1 = row.createCell(1);
				cell1.setCellValue(re.get(i).toString());
			}
		}
		Row row = sheet.createRow(rowIndex++);
		Cell cell0 = row.createCell(0);
		cell0.setCellValue("총 참가 인원");				
		Cell cell1 = row.createCell(1);
		cell1.setCellValue(re.get(re.size()-1).toString());

		//lets write the excel data to file now
		FileOutputStream fos = new FileOutputStream(fileName);
		workbook.write(fos);
		fos.close();
	}

}
