/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.User.Note;
import com.User.UserDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ahmed
 */
public class NoteDAO {
    
    Connection conn;
    
    public NoteDAO(Connection conn){
        this.conn = conn;
    }
    
    
    public boolean addNote(String title, String desc, int uid){
        boolean f= false;
        
        try {
            
            String query = "insert into notes(title, content, uid) values(?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setInt(3, uid);
            int i = ps.executeUpdate();
            
            if(i==1){
                f = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public List<Note> getNotes(int id){
        List<Note> list = new ArrayList<>();
        Note note = null;
        try {
            String query = "select * from notes where uid=? order by id DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                note = new Note();
                note.setId(rs.getInt(1));
                note.setTitle(rs.getString(2));
                note.setDesc(rs.getString(3));
                note.setDate(rs.getTimestamp(4));
                list.add(note);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public Note getNoteById(int noteId){
        Note note = null;
        
        try {
            String query = "select * from notes where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, noteId);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                note = new Note();
                note.setId(rs.getInt(1));
                note.setTitle(rs.getString(2));
                note.setDesc(rs.getString(3));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return note;
    }
    
        
    public boolean deleteNote(int noteId){
        boolean f = false;
        
        try {
            String query = "delete from notes where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, noteId);
            int i = ps.executeUpdate();
            if(i == 1){
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
        
    public boolean updateNote(int noteId, String title, String desc){
        boolean f = false;
        
        try {
            String query = "update notes set title=?, content=? where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setInt(3, noteId);
            
            int i = ps.executeUpdate();
            
            if(i==1){
                f = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
}
