package com.ip.bean;

import java.time.LocalDateTime;

public class UsersBean {
    private Integer user_id;
    private String username;
    private String gender;
    private String phone;
    private String password;
    private String email;
    private String avatar;
    private Integer status;
    private Integer role_id;
    private LocalDateTime last_login;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;

    public UsersBean() {
    }

    /**
     * 获取
     * @return user_id
     */
    public Integer getUser_id() {
        return user_id;
    }

    /**
     * 设置
     * @param user_id
     */
    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    /**
     * 获取
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取
     * @return gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * 设置
     * @param gender
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * 获取
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取
     * @return avatar
     */
    public String getAvatar() {
        return avatar;
    }

    /**
     * 设置
     * @param avatar
     */
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    /**
     * 获取
     * @return status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取
     * @return role_id
     */
    public Integer getRole_id() {
        return role_id;
    }

    /**
     * 设置
     * @param role_id
     */
    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    /**
     * 获取
     * @return last_login
     */
    public LocalDateTime getLast_login() {
        return last_login;
    }

    /**
     * 设置
     * @param last_login
     */
    public void setLast_login(LocalDateTime last_login) {
        this.last_login = last_login;
    }

    /**
     * 获取
     * @return created_at
     */
    public LocalDateTime getCreated_at() {
        return created_at;
    }

    /**
     * 设置
     * @param created_at
     */
    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    /**
     * 获取
     * @return updated_at
     */
    public LocalDateTime getUpdated_at() {
        return updated_at;
    }

    /**
     * 设置
     * @param updated_at
     */
    public void setUpdated_at(LocalDateTime updated_at) {
        this.updated_at = updated_at;
    }

    public String toString() {
        return "UsersBean{user_id = " + user_id + ", username = " + username + ", gender = " + gender + ", phone = " + phone + ", password = " + password + ", email = " + email + ", avatar = " + avatar + ", status = " + status + ", role_id = " + role_id + ", last_login = " + last_login + ", created_at = " + created_at + ", updated_at = " + updated_at + "}";
    }
}
