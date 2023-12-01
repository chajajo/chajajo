package org.chajajo.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
    private String keyword;
	private int pageNum;
	private int amount;

	public Criteria() {
		this(1, 12);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getOffset() {
		return (pageNum - 1) * amount;
	}

}
