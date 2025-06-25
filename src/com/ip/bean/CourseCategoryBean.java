package com.ip.bean;

import java.util.ArrayList;
import java.util.List;

public class CourseCategoryBean {
    private int id;
    private int parentId;
    private String name;
    private String type;
    private List<CourseCategoryBean> children = new ArrayList<>();

    public CourseCategoryBean() {
    }

    public CourseCategoryBean(int id, int parentId, String name, String type) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
        this.type = type;
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
     * @return parentId
     */
    public int getParentId() {
        return parentId;
    }

    /**
     * 设置
     * @param parentId
     */
    public void setParentId(int parentId) {
        this.parentId = parentId;
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
     * @return type
     */
    public String getType() {
        return type;
    }

    /**
     * 设置
     * @param type
     */
    public void setType(String type) {
        this.type = type;
    }

    public String toString() {
        return "CourseCategoryBean{id = " + id + ", parentId = " + parentId + ", name = " + name + ", type = " + type + "}";
    }

    public List<CourseCategoryBean> getChildren() {
        return children;
    }

    public void setChildren(List<CourseCategoryBean> children) {
        this.children = children;
    }
}
