package com.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class ContactLetter {

    private String receiptNum;//单据编号
    private String receipTheme;//单据主题
    @DateTimeFormat(pattern="yyyy-MM-dd")//页面写入数据库时格式化
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date receiptDate;//单据日期
    private Integer ifOutProject;//是否外部项目
    private String project;// 工程项目
    private String pattern;//类型
    private String matterCaption;//事项说明
    private String receiptStatus;//单据状态
    private String remarks;//备注

    //这样取出ContactLetter的同时也可以访问它下面的Task任务
    //private List<ContactLetterTask> contactLetterTaskList;//把ContactLetter和ContactLetterTask的信息都查询出来
    //一个角色可以分配给多个用户，也可以只分配给一个用户

    public String getReceiptNum() {
        return receiptNum;
    }

    public void setReceiptNum(String receiptNum) {
        this.receiptNum = receiptNum;
    }

    public String getReceipTheme() {
        return receipTheme;
    }

    public void setReceipTheme(String receipTheme) {
        this.receipTheme = receipTheme;
    }

    public Date getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(Date receiptDate) {
        this.receiptDate = receiptDate;
    }


    public Integer getIfOutProject() {
        return ifOutProject;
    }

    public void setIfOutProject(Integer ifOutProject) {
        this.ifOutProject = ifOutProject;
    }

    public String getPattern() {
        return pattern;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public String getMatterCaption() {
        return matterCaption;
    }

    public void setMatterCaption(String matterCaption) {
        this.matterCaption = matterCaption;
    }

    public String getReceiptStatus() {
        return receiptStatus;
    }

    public void setReceiptStatus(String receiptStatus) {
        this.receiptStatus = receiptStatus;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

}
