package com.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class Paginator {

	
	
	

	// 默认的页面范围大小
	public static final int DEFAULT_PAGE_RANGE_SIZE = 2;
//	 默认的页面大小
		public static final int DEFAULT_PAGE_SIZE =15;
		/** 集合属性 */
		private Collection items = new ArrayList();
		/** 集合属性 */
		private Map<Date, Integer> items2 = new TreeMap<Date, Integer>();
		/** 集合属性 */
		private Collection items3 ;
		/** 集合属性 */
		private Map itemsMap ;
		/** 总行数 */
		private int totalRowsAmount=0;

		/** 每页行数 */
		private int pageSize = DEFAULT_PAGE_SIZE;

		/** 当前页码 */
		private int currentPage = 1;
		private int go;

		/** 总页数 */
		private int totalPages;

		/** 偏移标志，计算该页起始行 */
		private int offset;
		private String javascript;
		private int colum;
		private int total;
		private int total1;
		private int total2;
		/* 页面范围控制 : 例如 < < < 1,2,3,4,5,6,7 >>> */

		// 区域大小
		private int pageRangeSize = DEFAULT_PAGE_RANGE_SIZE;

		// 区域总数
		private int totalPageRanges;
        
		// 当前区域所包含的页码
		private int[] currentRangePages;

		/** 新查询页 */
		private int nev;
		
		public String toString() {
			StringBuffer sb = new StringBuffer();
			sb.append("totalRows:").append(this.getTotalRowsAmount())
			  .append("\n totalPages:").append(this.getTotalPages())
			  .append("\n currentPages:").append(this.getCurrentPage());
			return  sb.toString();
		}

		/**
		 * 默认构造函数
		 */
		public Paginator() {
			setPageSize(DEFAULT_PAGE_SIZE);
			setPageRangeSize(DEFAULT_PAGE_RANGE_SIZE);
		}
		public Paginator(int pagesize) {
			setPageSize(pagesize);
			setPageRangeSize(DEFAULT_PAGE_RANGE_SIZE);
		}

		
		/**
		 * 获取任一页第一条数据在数据库中的位置

		 */
		protected static int getStartOfPage(int pageNo, int pageSize) {
			int startIndex = (pageNo - 1) * pageSize;
			return startIndex;
		}
/**
 * 
 * @param pagesize 每页显示的数量
 * @param total 总记录数
 */
		public void setTotalRowsAmount(int total,	Collection collection) {
			totalRowsAmount = total;
			this.setItems(collection);
			if (total > 0&&collection!=null&&collection.size()>0) {
				// 计算页码
				totalPages = totalRowsAmount % pageSize == 0 ? totalRowsAmount/pageSize:totalRowsAmount/pageSize + 1;
				// 设置当前页
				currentPage = currentPage > 1 && currentPage > totalPages ? totalPages:currentPage;
				offset = getStartOfPage(currentPage, pageSize);
				
			}
		}

	public void setData(int total,Collection collection){
		totalRowsAmount = total;
		this.setItems(collection);
		if (total > 0&&collection!=null&&collection.size()>0) {
			// 计算页码
			totalPages = totalRowsAmount % pageSize == 0 ? totalRowsAmount/pageSize:totalRowsAmount/pageSize + 1;
			// 设置当前页
			currentPage = currentPage > 1 && currentPage > totalPages ? totalPages:currentPage;
			offset = getStartOfPage(currentPage, pageSize);
			
		}
		
	}	
		
	public void setTotalRowsAmount(int i) {
		totalRowsAmount = i;
		if (i > 0) {
			// 计算页码
			totalPages = totalRowsAmount % pageSize == 0 ? totalRowsAmount/pageSize:totalRowsAmount/pageSize + 1;
			// 设置当前页
			currentPage = currentPage > 1 && currentPage > totalPages ? totalPages:currentPage;
		}
	}
	
	
		/**
		 * 设置当前页
		 */
		public void setCurrentPage(int currentPageNumber) {
			if(currentPageNumber>0){
			currentPage = currentPageNumber;
			offset = getStartOfPage(currentPage, pageSize);
			}
		}

		
		
		
		
			
		public int getCurrentPage() {
			return currentPage;
		}

		public boolean isHasNext() {
			return currentPage < totalPages;
		}

		public boolean isHasPrevious() {
			return totalPages > 1;
		}

		public int getNextPage() {
			return currentPage + 1;
		}

		public int getPageSize() {
			return pageSize;
		}

		public int getPreviousPage() {
			return currentPage - 1;
		}

		public int getTotalPages() {
			return totalPages;
		}

		public int getTotalRowsAmount() {
			return totalRowsAmount;
		}

		public void setPageSize(int i) {
			pageSize = i;
		}

		public void setTotalPages(int i) {
			totalPages = i;
		}

		public int getOffset() {
			return offset;
		}

		public int[] getCurrentRangePages() {
			return currentRangePages;
		}

		public int getPageRangeSize() {
			return pageRangeSize;
		}

		public void setCurrentRangePages(int[] i) {
			currentRangePages = i;
		}

		public void setPageRangeSize(int i) {
			pageRangeSize = i;
		}

		public int getTotalPageRanges() {
			return totalPageRanges;
		}

		public void setTotalPageRanges(int i) {
			totalPageRanges = i;
		}

		public String getDescription() {
			return null;
		}

		public Collection getItems() {
			nev--;
			return items;
		}

		public void setItems(Collection collection) {
			this.items = collection;
			HttpServletRequest request=ServletActionContext.getRequest();
			request.setAttribute("items", collection);
			nev++;
		}
		
		public boolean isNew() {return nev>0;}

		public void setOffset(int offset) {
			this.offset = offset;
		}

		public String getJavascript() {
			return javascript;
		}

		public void setJavascript(String javascript) {
			this.javascript = javascript;
		}

		public Map<Date, Integer> getItems2() {
			return items2;
		}

		public void setItems2(Map<Date, Integer> items2) {
			this.items2 = items2;
		}

		public Collection getItems3() {
			return items3;
		}

		public void setItems3(Collection items3) {
			this.items3 = items3;
		}

		public int getColum() {
			return colum;
		}

		public void setColum(int colum) {
			this.colum = colum;
		}

		public int getTotal2() {
			return total2;
		}

		public void setTotal2(int total2) {
			this.total2 = total2;
		}

		public int getTotal1() {
			return total1;
		}

		public void setTotal1(int total1) {
			this.total1 = total1;
		}

		public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		public Map getItemsMap() {
			return itemsMap;
		}

		public void setItemsMap(Map itemsMap) {
			this.itemsMap = itemsMap;
		}

		public int getGo() {
			return go;
		}

		public void setGo(int go) {
			if(go>0){
			this.go = go;
			this.setCurrentPage(go);
			}
			
		}

}
