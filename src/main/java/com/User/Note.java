/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.User;

import java.util.Date;

/**
 *
 * @author Ahmed
 */
public class Note {
    
    private int id;
    private String title;
    private String content;
    private Date date;
    private UserDetails user;
    
    
    public Note(){
        super();
    }

    public Note(int id, String title, String desc, Date date, UserDetails user) {
        super();
        this.id = id;
        this.title = title;
        this.content = desc;
        this.date = date;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return content;
    }

    public void setDesc(String desc) {
        this.content = desc;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public UserDetails getUser() {
        return user;
    }

    public void setUser(UserDetails user) {
        this.user = user;
    }
    
    
    
    
}
