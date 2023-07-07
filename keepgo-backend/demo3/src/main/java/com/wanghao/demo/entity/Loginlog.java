package com.wanghao.demo.entity;


import com.baomidou.mybatisplus.annotation.TableId;

public class Loginlog {

  @TableId
  private Integer id;
  private Integer uid;
  private String ip;
  private String os;
  private String browser;
  private java.sql.Date time;


  public long getLogId() {
    return id;
  }

  public void setLogId(Integer id) {
    this.id = id;
  }


  public long getUid() {
    return uid;
  }

  public void setUid(Integer uid) {
    this.uid = uid;
  }


  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }


  public String getOs() {
    return os;
  }

  public void setOs(String os) {
    this.os = os;
  }


  public String getBrowser() {
    return browser;
  }

  public void setBrowser(String browser) {
    this.browser = browser;
  }


  public java.sql.Date getLoginTime() {
    return time;
  }

  public void setLoginTime(java.sql.Date loginTime) {
    this.time = time;
  }

}
