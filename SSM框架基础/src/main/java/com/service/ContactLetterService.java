package com.service;

import com.common.JqGridTablePage;
import com.model.ContactLetter;
public interface ContactLetterService {


    ContactLetter findById(String receiptnum);

    void delete(String receiptnum);

    void mod(ContactLetter contactLetter);

    void save(ContactLetter contactLetter);

    JqGridTablePage findAll(ContactLetter contactLetter, String sortName, String sortOrder, Integer pageSize, Integer currPage);

}
