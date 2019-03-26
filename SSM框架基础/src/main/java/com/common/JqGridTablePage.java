package com.common;

import java.util.List;

/**
 * 分页控件
 * Created by luoty on 2016-10-02.
 */
public class JqGridTablePage {
    //总记录数
    private int total;
    //当前分页记录
    private List rows;
    //当前第几条
    private int pageIndex;
    //每页显示条数
    private int pageSize;

    //按照字段排序
    private String orderBy;
    //排序 desc asc
    private String sortOrder;
    // 总页数
    private int totalPage;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public int getPageIndex() {
        return this.pageIndex > 0 ? pageIndex : 1;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return this.pageSize > 0 ? pageSize : 10;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getRecordStart() {
        return this.pageIndex > 1?(pageIndex-1)*pageSize:0;
    }

    public int getRowNumStart() {
        return this.pageIndex > 1?(pageIndex-1)*pageSize+1:1;
    }

    public int getRowNumEnd() {
        return getRowNumStart() + pageSize -1;
    }

    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    public int getTotalPage() {
        this.totalPage = (int)Math.floor((double)this.total * 1.0D / (double)getPageSize());
        if(this.total % getPageSize() != 0) {
            ++this.totalPage;
        }
        return this.totalPage == 0?1:this.totalPage;
    }

}
