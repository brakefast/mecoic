package com.service.impl;

import com.common.JqGridTablePage;
import com.dao.ContactLetterTaskDao;
import com.model.ContactLetter;
import com.model.ContactLetterTask;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class ContactLetterTaskServiceImpl implements com.service.ContactLetterTaskService {
    @Autowired
    private ContactLetterTaskDao contactLetterTaskDao;

    @Test
    @Override
    public void insertTask(ContactLetterTask contactLetterTask) {
        contactLetterTaskDao.insert(contactLetterTask);
    }

    @Override
    public void deleteTask(String receiptNum) {
        List<String> delIdList=Arrays.asList(receiptNum.split(","));
        contactLetterTaskDao.deleteByReceiptNum(delIdList);
    }

    @Override
    public void updateTask(ContactLetterTask contactLetterTask) {
        contactLetterTaskDao.update(contactLetterTask);
    }

    @Override
    public JqGridTablePage listQuery(ContactLetterTask contactLetterTask,String sortName, String sortOrder, Integer pageSize, Integer currPage) {
        System.out.println(contactLetterTask.getReceiptNum());
        JqGridTablePage jqGridTablePage = new JqGridTablePage();
        List<ContactLetterTask> contactLetterTaskList;
        //当前页面
        jqGridTablePage.setPageIndex(currPage);
        //页面大小
        jqGridTablePage.setPageSize(pageSize);
        //总条数
        jqGridTablePage.setTotal(contactLetterTaskDao.getTotal(contactLetterTask));
        //limit
        Integer start = (jqGridTablePage.getPageIndex() -1)*jqGridTablePage.getPageSize();
        contactLetterTaskList = contactLetterTaskDao.listForLetterTask(contactLetterTask,sortName, sortOrder, start, pageSize);
        //设置页面上要显示的集合数据
        jqGridTablePage.setRows(contactLetterTaskList);
        return jqGridTablePage;
    }

}
