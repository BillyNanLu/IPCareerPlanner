package com.ip.bean;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class CourseBean {
    private int id;
    private int categoryId;
    private String name;
    private String tags;
    private String intro;
    private String targetUser;
    private String recommendation;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

    private String image;
    private BigDecimal price;
    private BigDecimal discount;

    private String fullCategoryPath;
    private List<String> teachers;

    private List<Integer> teacherIds;

    private String categoryName;

    public CourseBean() {
    }

    public CourseBean(int id, int categoryId, String name, String tags, String intro, String targetUser, String recommendation, LocalDateTime createTime, LocalDateTime updateTime) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.tags = tags;
        this.intro = intro;
        this.targetUser = targetUser;
        this.recommendation = recommendation;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    /**
     * 获取
     * @return id
     */
    public int getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * 获取
     * @return categoryId
     */
    public int getCategoryId() {
        return categoryId;
    }

    /**
     * 设置
     * @param categoryId
     */
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * 获取
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     * @return tags
     */
    public String getTags() {
        return tags;
    }

    /**
     * 设置
     * @param tags
     */
    public void setTags(String tags) {
        this.tags = tags;
    }

    /**
     * 获取
     * @return intro
     */
    public String getIntro() {
        return intro;
    }

    /**
     * 设置
     * @param intro
     */
    public void setIntro(String intro) {
        this.intro = intro;
    }

    /**
     * 获取
     * @return targetUser
     */
    public String getTargetUser() {
        return targetUser;
    }

    /**
     * 设置
     * @param targetUser
     */
    public void setTargetUser(String targetUser) {
        this.targetUser = targetUser;
    }

    /**
     * 获取
     * @return recommendation
     */
    public String getRecommendation() {
        return recommendation;
    }

    /**
     * 设置
     * @param recommendation
     */
    public void setRecommendation(String recommendation) {
        this.recommendation = recommendation;
    }

    /**
     * 获取
     * @return createTime
     */
    public LocalDateTime getCreateTime() {
        return createTime;
    }

    /**
     * 设置
     * @param createTime
     */
    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取
     * @return updateTime
     */
    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置
     * @param updateTime
     */
    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public String getFullCategoryPath() {
        return fullCategoryPath;
    }

    public void setFullCategoryPath(String fullCategoryPath) {
        this.fullCategoryPath = fullCategoryPath;
    }

    public List<String> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<String> teachers) {
        this.teachers = teachers;
    }

    public List<Integer> getTeacherIds() {
        return teacherIds;
    }

    public void setTeacherIds(List<Integer> teacherIds) {
        this.teacherIds = teacherIds;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "CourseBean{" +
                "id=" + id +
                ", categoryId=" + categoryId +
                ", name='" + name + '\'' +
                ", tags='" + tags + '\'' +
                ", intro='" + intro + '\'' +
                ", targetUser='" + targetUser + '\'' +
                ", recommendation='" + recommendation + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                ", fullCategoryPath='" + fullCategoryPath + '\'' +
                ", teachers=" + teachers +
                ", teacherIds=" + teacherIds +
                ", categoryName='" + categoryName + '\'' +
                '}';
    }
}
