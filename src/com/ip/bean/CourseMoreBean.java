package com.ip.bean;

public class CourseMoreBean {
    private Integer id;
    private Integer course_id;
    private String image;
    private Double price;
    private Double discount;

    public CourseMoreBean() {
    }

    public CourseMoreBean(Integer id, Integer course_id, String image, Double price, Double discount) {
        this.id = id;
        this.course_id = course_id;
        this.image = image;
        this.price = price;
        this.discount = discount;
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
     * @return price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 设置
     * @param price
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 获取
     * @return discount
     */
    public Double getDiscount() {
        return discount;
    }

    /**
     * 设置
     * @param discount
     */
    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public String toString() {
        return "CourseMoreBean{id = " + id + ", course_id = " + course_id + ", image = " + image + ", price = " + price + ", discount = " + discount + "}";
    }
}
