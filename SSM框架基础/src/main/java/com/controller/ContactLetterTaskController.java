package com.controller;

import com.common.JqGridTablePage;
import com.model.ContactLetterTask;
import com.service.ContactLetterTaskService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@RequestMapping("/worklinkTask")
@Controller
public class ContactLetterTaskController {
    @Resource
    private ContactLetterTaskService contactLetterTaskService;

    @RequestMapping(value = "/querySubList.json",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public JqGridTablePage queryAll(@ModelAttribute("contactLetterTask")ContactLetterTask contactLetterTask,
                                    @RequestParam(name="sortOrder",required = false, defaultValue = "taskid") String sortName,
                                    @RequestParam(name="orderBy",required = false, defaultValue = "desc") String sortOrder,
                                    @RequestParam(name="pageSize",required = false, defaultValue = "5") int pageSize,
                                    @RequestParam(name="currPage",required = false, defaultValue = "1") int currPage){
        JqGridTablePage jqGridTablePage = contactLetterTaskService.listQuery(contactLetterTask,sortName,sortOrder,pageSize,currPage);
        return jqGridTablePage;
    }

}
