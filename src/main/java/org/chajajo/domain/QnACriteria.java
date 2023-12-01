package org.chajajo.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class QnACriteria {

	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
	private String userId;

	public QnACriteria() {
		this(1, 10);
	}

	public QnACriteria(int pageNum) {
		this(pageNum, 10);
	}

	public QnACriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getOffset() {

		return (pageNum - 1) * amount;
	}

	public String[] getTypeArr() {
		return type == null ? 
						new String[] {} : 	// 빈 배열 리턴
						type.split("");		// 한글자 단위로 분리된 배열 리턴
	
   }
	
	
	public String getLink() {
		return getLink("", pageNum);
	}

	public String getLink(int pageNum) {
		return getLink("", pageNum);
	}

	public String getLink(String base) {
		return getLink(base, pageNum);
	}


	public String getLink(String base, int pageNum) {

		UriComponentsBuilder builder = 
			UriComponentsBuilder.fromPath(base)
				.queryParam("pageNum", pageNum)
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);

		return builder.toUriString();
	}

	public String getLinkWithBno(String base, Long bno) {
		return getLink(base, pageNum) + "&bno=" + bno;
	}
}