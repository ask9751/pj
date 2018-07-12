package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int vno;
	private String mid;
	private String title;
	private String comment;
	private String rating;
	private String imgLink;
	private Date regdate;
}
