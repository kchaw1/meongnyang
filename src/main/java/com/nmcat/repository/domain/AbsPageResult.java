package com.nmcat.repository.domain;

public class AbsPageResult {
	private int count;
	private int lastPage;
	private int pageNo;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	/**
	 * @param count : 게시물 전체 갯수
	 */
	public AbsPageResult(int pageNo, int count) {
		this(pageNo, count, 10, 10);
	}
	
	public AbsPageResult(int pageNo, int count, int listSize, int tabSize) {
		this.pageNo = pageNo;
		this.count = count;
		
		lastPage = (int)Math.ceil(count / (double)listSize);		
		int currTab = (pageNo - 1) / tabSize + 1;
		
		// 블럭에 해당하는 시작페이지와 끝페이지 계산하기
		beginPage = (currTab - 1) * tabSize + 1;
		//화면에 출력할 마지막페이지는 실제 개수를 가져와서 비교처리해줘야함
		endPage = (currTab * tabSize < lastPage) ? currTab * tabSize: lastPage;
		 prev = beginPage != 1;
		 next = endPage != lastPage;
	}

	
	public int getCount()     { return count; }
	public int getLastPage()  { return lastPage; }
	public int getPageNo()    { return pageNo; }
	public int getBeginPage() { return beginPage; }
	public int getEndPage()   { return endPage; }
	public boolean isPrev()   { return prev; }
	public boolean isNext()   { return next; }
}
