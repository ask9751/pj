package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int vno;
	private double score;
	private String comment;
	private String mid;
	private String imgLink;
	private Date regdate;
}
