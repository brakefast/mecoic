package com.controller;

import com.common.JqGridTablePage;
import com.model.ContactLetter;
import com.service.ContactLetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceView;


@RequestMapping("/worklink")
@Controller
public class ContactLetterController {
    @Autowired
    ContactLetterService contactLetterService;

    @RequestMapping(value = "/worklinkget",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ContactLetter findById(String receiptNum){
        ContactLetter contactLetter = contactLetterService.findById(receiptNum);
//      mv.addObject("worklink",contactLetterService.findById(receiptnum));
        return contactLetter;
    }

//    public String findById(Model model){
//        ContactLetter contactLetter = contactLetterService.findById();
//        model.addAttribute("c", contactLetter);
//        return "xx";
//    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(String receiptNum){
        //ModelAndView mv = new ModelAndView(new InternalResourceView("/queryAll.json"));
        contactLetterService.delete(receiptNum);
        //mv.addObject("msg","删除成功!");
        //return mv;
        return "success";
    }

    @RequestMapping(value="/mod",produces="application/json;charset=utf-8")
    @ResponseBody
    public String mod(ContactLetter contactLetter){
        //ModelAndView mv = new ModelAndView(new InternalResourceView("/worklinkget/"+contactLetter.getReceiptNum()));
        contactLetterService.mod(contactLetter);
        //session.setAttribute("msg","更新成功");
        return "success";
    }

    @RequestMapping("/toModWorkLink")
    public ModelAndView modWorkLink(){
        ModelAndView mv = new ModelAndView("worklinkModPage");
        return mv;
    }

    @RequestMapping("/toaddWorkLink")
    public ModelAndView addWorkLink(){
        ModelAndView mv = new ModelAndView("worklinkAddPage");
        return mv;
    }

    @RequestMapping(value="/save",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String save(ContactLetter contactLetter){

        contactLetterService.save(contactLetter);
        return "success";
    }

    @RequestMapping(value = "/queryAll.json",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public JqGridTablePage queryAll(@ModelAttribute("contactLetter") ContactLetter contactLetter,
                                 @RequestParam(name="sortOrder",required = false, defaultValue = "receiptnum") String sortName,
                                 @RequestParam(name="orderBy",required = false, defaultValue = "desc") String sortOrder,
                                 @RequestParam(name="pageSize",required = false, defaultValue = "5") int pageSize,
                                 @RequestParam(name="currPage",required = false, defaultValue = "1") int currPage){

        JqGridTablePage jqGridTablePage =  contactLetterService.findAll(contactLetter,sortName,sortOrder,pageSize,currPage);

        return jqGridTablePage;
        //return contactLetterService.findAll(contactLetter,sortName,sortOrder,pageSize,currPage);

    }
}
