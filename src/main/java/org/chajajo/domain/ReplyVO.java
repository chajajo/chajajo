package org.chajajo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long no;
	private Long cno;// Comment의no
	private String writer;
	private String content;
	private Date regDate;
	private Date updateDate;
}
