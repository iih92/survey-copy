package com.team.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class BoardDTO {

	private int num;
	private String title;
	private String code;
	private String hashtag;
	private Date deadline;
	
}
