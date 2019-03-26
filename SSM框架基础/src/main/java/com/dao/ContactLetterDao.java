package com.dao;

import com.model.ContactLetter;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContactLetterDao {
    /*
    * 查询通过ID
    * */
    ContactLetter findById(@Param("receiptnum") String receiptnum);

    void delete(List<String> receiptnumList);

    void update(ContactLetter contactLetter);

    void save(ContactLetter contactLetter);

    List<ContactLetter> findAll(@Param("contactLetter") ContactLetter contactLetter, @Param("sortOrder")String sortName, @Param("orderBy")String sortOrder, @Param("start")Integer  start, @Param("limit")Integer  limit);

    int getTotal(@Param("contactLetter") ContactLetter contadctLetter);

}
