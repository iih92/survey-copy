package com.team.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReplyDTO {
	private int cNum;
	private int num; 
	private Date cDate;
	private String nick;
	private String content;
	private int depth;
	private int intent;
}	
