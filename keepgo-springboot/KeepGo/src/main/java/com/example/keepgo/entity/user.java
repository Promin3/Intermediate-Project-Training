package com.example.keepgo.entity;

import javax.persistence.Entity;
import javax.persistence.Table;


public class user {
    private Integer user_id;
    private String username;
    private String account;

    private String password;
    private int commentLice;
    private int postLicense;
    private String persontitle;
    private String avater;
    private Integer points;
    private String description;
    private String p1;
    private String p2;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getCommentLice() {
        return commentLice;
    }

    public void setCommentLice(int commentLice) {
        this.commentLice = commentLice;
    }

    public int getPostLicense() {
        return postLicense;
    }

    public void setPostLicense(int postLicense) {
        this.postLicense = postLicense;
    }

    public String getPersontitle() {
        return persontitle;
    }

    public void setPersontitle(String persontitle) {
        this.persontitle = persontitle;
    }

    public String getAvater() {
        return avater;
    }

    public void setAvater(String avater) {
        this.avater = avater;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getP1() {
        return p1;
    }

    public void setP1(String p1) {
        this.p1 = p1;
    }

    public String getP2() {
        return p2;
    }

    public void setP2(String p2) {
        this.p2 = p2;
    }

    @Override
    public String toString() {
        return "user{" +
                "user_id=" + user_id +
                ", username='" + username + '\'' +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", commentLice=" + commentLice +
                ", postLicense=" + postLicense +
                ", persontitle='" + persontitle + '\'' +
                ", avater='" + avater + '\'' +
                ", points=" + points +
                ", description='" + description + '\'' +
                ", p1='" + p1 + '\'' +
                ", p2='" + p2 + '\'' +
                '}';
    }


}
