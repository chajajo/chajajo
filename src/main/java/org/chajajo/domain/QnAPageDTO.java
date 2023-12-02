package org.chajajo.domain;

import lombok.Data;

@Data
public class QnAPageDTO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int totalPage;
	private int total;

	private QnACriteria cri;

	public QnAPageDTO(QnACriteria cri, int total) {
		this.cri = cri;
		this.total = total;// 전체데이터건수
		
		int amount = cri.getAmount();
		int page = cri.getPageNum();
		
		totalPage = (int) (Math.ceil((float) total / amount));
		endPage = (int) (Math.ceil(page / (double) amount)) * amount;
		startPage = endPage - (amount - 1);
		
		int realEnd = (int) (Math.ceil((total * 1.0) / amount));
		if (realEnd < this.endPage) {
			endPage = realEnd;
		}
		
		prev = startPage > 1;
		next = endPage < realEnd;
	}
}
