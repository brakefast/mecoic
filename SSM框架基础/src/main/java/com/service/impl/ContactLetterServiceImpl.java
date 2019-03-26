package com.service.impl;

import com.common.JqGridTablePage;
import com.dao.ContactLetterDao;
import com.dao.ContactLetterTaskDao;
import com.model.ContactLetter;
import com.model.ContactLetterTask;
import com.service.ContactLetterService;
import com.vo.ContactLetterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class ContactLetterServiceImpl implements ContactLetterService {
    @Autowired
    ContactLetterDao contactLetterDao;
    @Resource
    ContactLetterTaskDao contactLetterTaskDao;
    @Override
    public ContactLetter findById(String receiptnum) {
        ContactLetter contactLetter = contactLetterDao.findById(receiptnum);
        return contactLetter;
    }

    @Override
    public void delete(String receiptNum) {
        List<String> deleteNumList = Arrays.asList(receiptNum.split(","));
//        List<String> taskId = contactLetterTaskDao.findTaskIdByReceiptNum(deleteNumList);
//        contactLetterTaskDao.del(taskId);
        contactLetterDao.delete(deleteNumList);
    }

    @Override
    public void mod(ContactLetter contactLetter) {
        contactLetterDao.update(contactLetter);
    }

    @Override
    public void save(ContactLetter contactLetter) {
        //ContactLetter contactLetter1 = contactLetterDao.findById(contactLetter.getReceiptNum());
        //if( contactLetter1 != null && "".equals(contactLetter1)){
            //contactLetterDao.update(contactLetter);
        //}else{
//            contactLetter.setReceiptNum(CommonUtil.getUUID());
            contactLetterDao.save(contactLetter);
        //}
    }

    @Override
    public JqGridTablePage findAll(ContactLetter contactLetter, String sortName, String sortOrder, Integer pageSize, Integer currPage) {
        JqGridTablePage jqGridTablePage = new JqGridTablePage();
        List<ContactLetter> contactLetterList = new ArrayList<ContactLetter>();
        jqGridTablePage.setTotal( contactLetterDao.getTotal(contactLetter));
//      1.设置每页显示多少条记录
        jqGridTablePage.setPageSize(pageSize);
//      3.设置当前页
        jqGridTablePage.setPageIndex(currPage);
        int start = (jqGridTablePage.getPageIndex()-1)*jqGridTablePage.getPageSize();
        //int end =  currPage*pageSize+1;
        contactLetterList = contactLetterDao.findAll(contactLetter,sortName,sortOrder,start,pageSize);
        for(ContactLetter c:contactLetterList){
            if("pro1".equals(c.getProject())){
                c.setProject("工程1");
            }else if(("pro2").equals(c.getProject())){
                c.setProject("工程2");
            }else{
                c.setProject("工程3");
            }

            if(("zcqr").equals(c.getPattern())){
                c.setPattern("驻场确认");
            }else if(("wlqr").equals(c.getProject())){
                c.setPattern("网络确认");
            }
        }
//      4.设置页面上要显示的集合数据
        jqGridTablePage.setRows(contactLetterList);
        return jqGridTablePage;
    }

}