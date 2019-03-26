package com.service;

import com.common.JqGridTablePage;
import com.model.ContactLetterTask;

public interface ContactLetterTaskService {

    void insertTask(ContactLetterTask contactLetterTask);

    void deleteTask(String taskId);

    void updateTask(ContactLetterTask contactLetterTask);

//    ContactLetterTask get(String receiptNum);

    JqGridTablePage listQuery(ContactLetterTask contactLetterTask,String sortName, String sortOrder, Integer pageSize, Integer currPage);

}
