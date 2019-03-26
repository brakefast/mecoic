package com.ciocem.dao;

import com.common.CommonUtil;
import com.common.JqGridTablePage;
import com.dao.ContactLetterDao;
import com.dao.ContactLetterTaskDao;
import com.model.ContactLetter;
import com.model.ContactLetterTask;
import com.service.ContactLetterTaskService;
import com.service.impl.ContactLetterServiceImpl;
import com.service.impl.ContactLetterTaskServiceImpl;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * 单元测试文件
 */
public class DaoTest {
    private ContactLetterTaskDao cltdaoBean;
    private ContactLetterDao cldaoBean;
    private ContactLetterTask contactLetterTask = new ContactLetterTask();
    @Before
    public void setUp(){
        //获取Spring容器
        ApplicationContext ac = new ClassPathXmlApplicationContext(
                "classpath:spring/spring-mybatis.xml"
        );
        //获取Dao
        cltdaoBean = ac.getBean(ContactLetterTaskDao.class);
        cldaoBean = ac.getBean(ContactLetterDao.class);

    }
    //@After

    @Test
    public void testDaoAdd(){
        contactLetterTask.setTaskId(CommonUtil.getTimeStamp());
        contactLetterTask.setBrokerage("网五卅");
        ContactLetter contactLetter = cldaoBean.findById("ciocem01");
//        contactLetterTask.setReceiptNum(contactLetter);
        //调用方法测试
//        System.out.println(bean.add(contactLetterTask1));
        cltdaoBean.insert(contactLetterTask);
    }

    @Test
    public void testDaoQuery(){
//        List<ContactLetterTask> cltList = cltdaoBean.query();
//        for(ContactLetterTask clt : cltList){
//            System.out.println(clt);
//        }
        Integer limit=0,start=10;
        String sortOrder="taskid",orderBy="desc";
        //JqGridTablePage ctlSerList = cltserBean.query(null,sortOrder,orderBy,limit,start);
        //for(int i=0;i<ctlSerList.getRows().size();i++){
          //  System.out.println(ctlSerList.getRows().get(i));
        //}
//        List<ContactLetterTask> cltList = cltdaoBean.findByAll(null,sortOrder,orderBy,limit,start);
//        for(ContactLetterTask clt:cltList){
//            System.out.println(clt);
//        }
        System.out.println("Total:" + cltdaoBean.getTotal(contactLetterTask));
    }

    @Test
    public void testDaoFindByReceiptNum(){
        ContactLetterTask contactLetterTask = new ContactLetterTask();
        contactLetterTask.setReceiptNum("ciocem12");
        System.out.println(contactLetterTask.getReceiptNum());
        List<ContactLetterTask> list = cltdaoBean.listForLetterTask(contactLetterTask,null,null,null,null);
        for(ContactLetterTask clt:list){
            System.out.println("{receiptNum:" + clt.getReceiptNum() + ",brokerage:" + clt.getBrokerage() + "}");
        }
    }

    @Test
    public void testDaoMod() {
        contactLetterTask.setTaskId("2019-03-20 00:36:01:00348");
        contactLetterTask.setBrokerage("MrLawrence");
//        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cc = Calendar.getInstance();
        cc.set(1999,07,31);
//        contactLetterTask.setTaskCreateTime(df.parse("2019-03-32 00:36:05"));
        contactLetterTask.setTaskCreateTime(cc.getTime());
        ContactLetter contactLetter = cldaoBean.findById("ciocem02");
//        contactLetterTask.setReceiptNum(contactLetter);
        //调用方法测试
        System.out.println(contactLetterTask.getTaskCreateTime());
        cltdaoBean.update(contactLetterTask);
    }

    @Test
    public void testDaoFindById(){
        String taskid = "2019-03-19 16:33:05:00600";
        contactLetterTask = cltdaoBean.getById(taskid);
        System.out.println(contactLetterTask);
    }

    @Test
    public void testDaoDelete(){
        List<String> cList=new ArrayList<>();
        cList.add("2019-03-19 17:38:38:00042");
        cltdaoBean.deleteByReceiptNum(cList);
    }
}
