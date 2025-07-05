package com.ip.bean;

public class CourseOrderViewBean {
    private int courseId;
    private String courseName;
    private String coverImage;  // /uploads/course/xxx.jpg
    private String status; // “已支付” 或 “未支付”

    public CourseOrderViewBean() {
    }

    public CourseOrderViewBean(int courseId, String courseName, String coverImage, String status) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.coverImage = coverImage;
        this.status = status;
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

    public String toString() {
        return "CourseOrderViewBean{courseId = " + courseId + ", courseName = " + courseName + ", coverImage = " + coverImage + ", status = " + status + "}";
    }
}
