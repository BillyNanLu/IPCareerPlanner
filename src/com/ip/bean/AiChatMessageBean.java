package com.ip.bean;

import java.time.LocalDateTime;

public class AiChatMessageBean {
    private Integer id;
    private Integer userId;
    private String username;
    private String role;
    private String message;
    private LocalDateTime timestamp;


    public AiChatMessageBean() {
    }

    public AiChatMessageBean(Integer id, Integer userId, String role, String message, LocalDateTime timestamp) {
        this.id = id;
        this.userId = userId;
        this.role = role;
        this.message = message;
        this.timestamp = timestamp;
    }

    /**
     * 获取
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取
     * @return userId
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取
     * @return role
     */
    public String getRole() {
        return role;
    }

    /**
     * 设置
     * @param role
     */
    public void setRole(String role) {
        this.role = role;
    }

    /**
     * 获取
     * @return message
     */
    public String getMessage() {
        return message;
    }

    /**
     * 设置
     * @param message
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * 获取
     * @return timestamp
     */
    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    /**
     * 设置
     * @param timestamp
     */
    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() {
        return "AiChatMessageBean{" +
                "id=" + id +
                ", userId=" + userId +
                ", username='" + username + '\'' +
                ", role='" + role + '\'' +
                ", message='" + message + '\'' +
                ", timestamp=" + timestamp +
                '}';
    }
}
