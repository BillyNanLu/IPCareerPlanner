package com.ip.bean;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class CourseViewBean {
    private int id;
    private String name;
    private String tags;
    private String image;
    private String categoryName;
    private String fullCategoryPath;
    private List<String> teachers;
    private BigDecimal price;
    private BigDecimal discount;
    private LocalDateTime createdAt;

    public CourseViewBean() {
    }

    public CourseViewBean(int id, String name, String tags, String image, String categoryName, String fullCategoryPath, List<String> teachers, BigDecimal price, BigDecimal discount, LocalDateTime createdAt) {
        this.id = id;
        this.name = name;
        this.tags = tags;
        this.image = image;
        this.categoryName = categoryName;
        this.fullCategoryPath = fullCategoryPath;
        this.teachers = teachers;
        this.price = price;
        this.discount = discount;
        this.createdAt = createdAt;
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
     * @return image
     */
    public String getImage() {
        return image;
    }

    /**
     * 设置
     * @param image
     */
    public void setImage(String image) {
        this.image = image;
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

    /**
     * 获取
     * @return fullCategoryPath
     */
    public String getFullCategoryPath() {
        return fullCategoryPath;
    }

    /**
     * 设置
     * @param fullCategoryPath
     */
    public void setFullCategoryPath(String fullCategoryPath) {
        this.fullCategoryPath = fullCategoryPath;
    }

    /**
     * 获取
     * @return teachers
     */
    public List<String> getTeachers() {
        return teachers;
    }

    /**
     * 设置
     * @param teachers
     */
    public void setTeachers(List<String> teachers) {
        this.teachers = teachers;
    }

    /**
     * 获取
     * @return price
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * 设置
     * @param price
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * 获取
     * @return discount
     */
    public BigDecimal getDiscount() {
        return discount;
    }

    /**
     * 设置
     * @param discount
     */
    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
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

    public String toString() {
        return "CourseViewBean{id = " + id + ", name = " + name + ", tags = " + tags + ", image = " + image + ", categoryName = " + categoryName + ", fullCategoryPath = " + fullCategoryPath + ", teachers = " + teachers + ", price = " + price + ", discount = " + discount + ", createdAt = " + createdAt + "}";
    }
}
