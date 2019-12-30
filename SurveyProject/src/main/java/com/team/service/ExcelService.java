package com.team.service;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelService {
	
	public static void makeExcel(String fileName, String[] xlsResult, String[] xlsCnt, String xlsPer, String question) throws Exception{

		/*-------------엑셀 파일 생성 --------------*/
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
		List<String> answer = new ArrayList<String>(); 
		List<String> answerCnt = new ArrayList<String>(); 
		for (int i = 0; i < xlsResult.length; i++) {
			answer.add(xlsResult[i]);
			answerCnt.add(xlsCnt[i]);
		}
		
		/*--------셀 스타일 -------*/
		Sheet sheet = workbook.createSheet("설문조사 결과");
		CellStyle styleOfBoardFillFontBlackBold16 = workbook.createCellStyle();
		//정렬
		styleOfBoardFillFontBlackBold16.setAlignment(CellStyle.ALIGN_CENTER); //가운데 정렬
		styleOfBoardFillFontBlackBold16.setVerticalAlignment(CellStyle.VERTICAL_CENTER); //높이 가운데 정렬
		sheet.setColumnWidth(0, 10000);
		sheet.setColumnWidth(1, 10000);

		/*-------- 데이터 넣기 -------*/
		int rowIndex = 0;	// 열
		int colIndex1 = 0;	// 행 
		int colIndex2 = 0;	// 행 
		int excelname = 0; // 처음 고정값을 넣기 위해 사용한 변수	
		int quCnt = 0;

		for (int i = -1; i < answer.size(); i++) {
			Row row = sheet.createRow(rowIndex++);
			
			if(excelname == 0){ // 처음에 고정값 
				colIndex1++;
				Cell cell0 = row.createCell(0);
				cell0.setCellValue("질문");
				Cell cell1 = row.createCell(1);
				cell1.setCellValue("결과");
				excelname++;
			} else {
				colIndex1++;
				if(answer.get(i).toString().equals("!")) {
					colIndex2 = colIndex1;
					row = sheet.createRow(rowIndex++);
					Cell cell0 = row.createCell(0);
					cell0.setCellValue(qu1.get(quCnt++).toString());
					i++;
				}

				Cell cell1 = row.createCell(1);
				cell1.setCellValue(answer.get(i).toString());
				Cell cell2 = row.createCell(2);
				cell2.setCellValue(answerCnt.get(i).toString()+"개");

			}
		}
		Row row = sheet.createRow(rowIndex+2);
		Cell cell1 = row.createCell(0);
		cell1.setCellValue("참가인원");
		Cell cell2 = row.createCell(1);
		cell2.setCellValue(xlsPer+"명");
		
		//lets write the excel data to file now
		FileOutputStream fos = new FileOutputStream(fileName);
		workbook.write(fos);
		fos.close();
	}

}
