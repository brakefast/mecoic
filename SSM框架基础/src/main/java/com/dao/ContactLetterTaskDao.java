package com.dao;

import com.model.ContactLetterTask;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContactLetterTaskDao {
    /**
     * 增
     *
     */
    void insert(ContactLetterTask contactLetterTask);

    /**
     * 删
     */
    void deleteByReceiptNum(List<String> receiptNum);

    /**
     * 改
     */
    void update(ContactLetterTask contactLetterTask);

    /**
     * 查
     */
    ContactLetterTask getById(@Param("taskId") String taskId);

    List<ContactLetterTask> listForLetterTask(@Param("contactLetterTask") ContactLetterTask contactLetterTask,@Param("sortOrder")String sortName, @Param("orderBy")String sortOrder, @Param("start")Integer  start, @Param("limit")Integer  limit);

    //List<ContactLetterTask> query();
    /**
     * 总记录数
     * @param contactLetterTask
     * @return
     */
    int getTotal(@Param("contactLetterTask") ContactLetterTask contactLetterTask);

}
