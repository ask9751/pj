package org.zerock.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class ReviewVO {
	

	private int vno;
	private String mid;
	private String title;
	private String comment;
	private float rating;
	private String imgLink;
	private int code;
	private int mno;
	private Date regdate;
}
