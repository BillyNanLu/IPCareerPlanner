package com.ip.bean;

import java.time.LocalDateTime;

public class EnrolledCourseBean {
    private int courseId;
    private String courseName;
    private String coverImage;
    private String status;
    private String orderNo;
    private String payMethod;
    private String categoryName;
    private LocalDateTime paidAt;

    public EnrolledCourseBean() {
    }

    public EnrolledCourseBean(int courseId, String courseName, String coverImage, String status, String orderNo, String payMethod, String categoryName) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.coverImage = coverImage;
        this.status = status;
        this.orderNo = orderNo;
        this.payMethod = payMethod;
        this.categoryName = categoryName;
    }

    /**
     * 获取
     * @return courseId
     */
    public int getCourseId() {
        return courseId;
    }

    /**
     * 设置
     * @param courseId
     */
    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    /**
     * 获取
     * @return courseName
     */
    public String getCourseName() {
        return courseName;
    }

    /**
     * 设置
     * @param courseName
     */
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    /**
     * 获取
     * @return coverImage
     */
    public String getCoverImage() {
        return coverImage;
    }

    /**
     * 设置
     * @param coverImage
     */
    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
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
     * @return orderNo
     */
    public String getOrderNo() {
        return orderNo;
    }

    /**
     * 设置
     * @param orderNo
     */
    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    /**
     * 获取
     * @return payMethod
     */
    public String getPayMethod() {
        return payMethod;
    }

    /**
     * 设置
     * @param payMethod
     */
    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    /**
     * 获取
     * @return categoryName
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * 设置
     * @param categoryName
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public LocalDateTime getPaidAt() {
        return paidAt;
    }

    public void setPaidAt(LocalDateTime paidAt) {
        this.paidAt = paidAt;
    }

    @Override
    public String toString() {
        return "EnrolledCourseBean{" +
                "courseId=" + courseId +
                ", courseName='" + courseName + '\'' +
                ", coverImage='" + coverImage + '\'' +
                ", status='" + status + '\'' +
                ", orderNo='" + orderNo + '\'' +
                ", payMethod='" + payMethod + '\'' +
                ", categoryName='" + categoryName + '\'' +
                ", paidAt=" + paidAt +
                '}';
    }
}
