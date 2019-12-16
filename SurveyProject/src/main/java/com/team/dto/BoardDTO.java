package com.team.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class BoardDTO {

	private int num;
	private int hit;
	private int point;
	private String title;
	private String code;
	private String hashtag;
	private String nick;
	private Date deadline;
	private Date createDate;
	
}
