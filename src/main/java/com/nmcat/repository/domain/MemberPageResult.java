package com.nmcat.repository.domain;

public class MemberPageResult {
	private int count;
	private int lastPage;
	private int pageNo;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int pageLineNo; // line div 돌리는 횟수
	private int pageCount; // 마지막페이지에 있는 멤버 수..
	
	/**
	 * @param count : 게시물 전체 갯수
	 */
	public MemberPageResult(int pageNo, int count) {
		this(pageNo, count, 12, 5);
	}
	
	public MemberPageResult(int pageNo, int count, int listSize, int tabSize) {
		this.pageNo = pageNo;
		this.count = count;
		lastPage = (int)Math.ceil(count / (double)listSize);
		//System.out.println("lastPage :" + lastPage);
		if(lastPage == pageNo) {
			if(lastPage == 1) {
				pageCount = count;
			} else {
				pageCount = count % (12 * (lastPage-1));				
			}
			pageLineNo = (int)Math.ceil(pageCount / (double)4);
		} else {
			pageCount = 12;
			pageLineNo = 3;
		}
		
		int currTab = (pageNo - 1) / tabSize + 1;
		beginPage = (currTab - 1) * tabSize + 1;
		endPage = (currTab * tabSize < lastPage) ? currTab * tabSize
				: lastPage;
		prev = pageNo != 1;
		next = pageNo != lastPage;
	}

	public int getPageCount() {
		return pageCount;
	}
	public int getPageLineNo() {
		return pageLineNo;
	}
	
	public int getCount()     { return count; }
	public int getLastPage()  { return lastPage; }
	public int getPageNo()    { return pageNo; }
	public int getBeginPage() { return beginPage; }
	public int getEndPage()   { return endPage; }
	public boolean isPrev()   { return prev; }
	public boolean isNext()   { return next; }
	
}
