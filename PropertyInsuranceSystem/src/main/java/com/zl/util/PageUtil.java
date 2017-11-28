package com.zl.util;

import java.io.Serializable;

import org.springframework.stereotype.Component;


/**
 * 分页工具
 * @author 苏建华
 *
 * 2017年11月6日
 */
@Component
public class PageUtil implements Serializable{

	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private Integer currentPage;// 当前页码
	private Integer pageSize;// 每页条数
	private Integer rowSize;// 新闻总条数
	private Integer totalPage;// 总页数
	private Integer startNum;// 开始位置
	private Integer endNum;// 结束位置
	private Query query;
	
	public PageUtil() {
		if (pageSize == null) {
			pageSize = 6;
		}
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getRowSize() {
		return rowSize;
	}

	public void setRowSize(Integer rowSize) {
		this.rowSize = rowSize;
	}

	public Integer getTotalPage() {
		totalPage = rowSize / pageSize;
		if(rowSize % pageSize != 0){
			totalPage += 1;
		}
		
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getStartNum() {
		startNum = (currentPage - 1) * pageSize;
		return startNum;
	}

	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}

	public Integer getEndNum() {
		endNum = currentPage * pageSize;
		return endNum;
	}

	public void setEndNum(Integer endNum) {
		this.endNum = endNum;
	}

	public Query getQuery() {
		return query;
	}

	public void setQuery(Query query) {
		this.query = query;
	}
	

	

	@Override
	public String toString() {
		return "PageUtil [currentPage=" + currentPage + ", pageSize="
				+ pageSize + ", rowSize=" + rowSize + ", totalPage="
				+ totalPage + ", startNum=" + startNum + ", endNum=" + endNum
				+ ", query=" + query + "]";
	}

}
