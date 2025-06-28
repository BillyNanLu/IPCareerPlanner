package com.ip.bean;

import java.time.LocalDateTime;

public class CourseOrderBean {
    private Integer id;
    private String order_no;
    private Integer course_id;
    private Integer user_id;
    private String pay_method;
    private String status;
    private LocalDateTime createdAt;
    private LocalDateTime paidAt;

    public CourseOrderBean() {
    }

    public CourseOrderBean(Integer id, String order_no, Integer course_id, Integer user_id, String pay_method, String status, LocalDateTime createdAt, LocalDateTime paidAt) {
        this.id = id;
        this.order_no = order_no;
        this.course_id = course_id;
        this.user_id = user_id;
        this.pay_method = pay_method;
        this.status = status;
        this.createdAt = createdAt;
        this.paidAt = paidAt;
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
     * @return order_no
     */
    public String getOrder_no() {
        return order_no;
    }

    /**
     * 设置
     * @param order_no
     */
    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    /**
     * 获取
     * @return course_id
     */
    public Integer getCourse_id() {
        return course_id;
    }

    /**
     * 设置
     * @param course_id
     */
    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
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
     * @return pay_method
     */
    public String getPay_method() {
        return pay_method;
    }

    /**
     * 设置
     * @param pay_method
     */
    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }

    /**
     * 获取
     * @return status
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置
     * @param status
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取
     * @return createdAt
     */
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    /**
     * 设置
     * @param createdAt
     */
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    /**
     * 获取
     * @return paidAt
     */
    public LocalDateTime getPaidAt() {
        return paidAt;
    }

    /**
     * 设置
     * @param paidAt
     */
    public void setPaidAt(LocalDateTime paidAt) {
        this.paidAt = paidAt;
    }

    public String toString() {
        return "CourseOrderBean{id = " + id + ", order_no = " + order_no + ", course_id = " + course_id + ", user_id = " + user_id + ", pay_method = " + pay_method + ", status = " + status + ", createdAt = " + createdAt + ", paidAt = " + paidAt + "}";
    }
}
