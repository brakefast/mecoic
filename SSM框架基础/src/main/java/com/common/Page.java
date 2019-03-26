package com.common;

import java.util.List;

public class Page<G> {
    private int pageSize = 5;
    private int total;
    private int allPage;
    private int currPage = 1;
    private int privPage;
    private int nextPage;
    private List<G> list;

    public int getPageSize(){
        return pageSize;
    }

    /**
     * 1.设置每页显示多少条记录
     * @param pageSize
     * */
    public void setPageSize(int pageSize){
        this.pageSize = pageSize;
    }

    public int getTotal(){
        return total;
    }

    /**
     * 2.设置总记录条数
     * @param total
     */
    public void setTotal(int total){
        this.total = total;
        this.allPage = (this.total + this.pageSize - 1)/this.pageSize;
    }

    public int getAllPage(){
        return allPage;
    }

    public int getCurrPage(){
        return currPage;
    }

    /**
     * 3.设置当前页
     * @param currPage
     */
    public void setCurrPage(int currPage){
        if(this.allPage <= 1){
            this.privPage = 1;
            this.currPage = 1;
            this.nextPage = 1;
        }else if(currPage <= 1){
            this.privPage = 1;
            this.currPage = 1;
            this.nextPage =2;
        }else if(currPage >= this.allPage){
            this.privPage = this.allPage - 1;
            this.currPage = this.allPage;
            this.nextPage = this.allPage;
        }else{
            this.privPage = currPage - 1;
            this.currPage = currPage;
            this.nextPage = currPage + 1;
        }
    }

    public int getPrivPage() {
        return privPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public List<G> getList() {
        return list;
    }

    /**
     * 4.设置页面上要显示的集合数据
     * @param list
     */
    public void setList(List<G> list){
        this.list = list;
    }
}
