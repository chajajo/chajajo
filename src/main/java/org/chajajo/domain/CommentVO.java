package org.chajajo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private Long no;
	private Long bno;
	
	private String writer;
	private String content;
	private Date regDate;
	private Date updateDate;
}
