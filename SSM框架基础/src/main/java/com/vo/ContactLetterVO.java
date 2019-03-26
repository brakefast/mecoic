package com.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.model.ContactLetter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class ContactLetterVO extends ContactLetter {

    private String projectName;

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

}
