package com.ip.bean;

import java.time.LocalDateTime;

public class AppointInformationBean {
    private Integer id;
    private String appointmentId;
    private String name;
    private String phone;
    private String time;
    private String city;
    private String industry;
    private String experience;
    private String paidConsult;
    private String description;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Integer status;

    public AppointInformationBean() {
    }

    public AppointInformationBean(Integer id, String appointmentId, String name, String phone, String time,
                                  String city, String industry, String experience, String paidConsult,
                                  String description, LocalDateTime createdAt, LocalDateTime updatedAt, Integer status) {
        this.id = id;
        this.appointmentId = appointmentId;
        this.name = name;
        this.phone = phone;
        this.time = time;
        this.city = city;
        this.industry = industry;
        this.experience = experience;
        this.paidConsult = paidConsult;
        this.description = description;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getPaidConsult() {
        return paidConsult;
    }

    public void setPaidConsult(String paidConsult) {
        this.paidConsult = paidConsult;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "AppointInformationBean{" +
                "id=" + id +
                ", appointmentId='" + appointmentId + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", time='" + time + '\'' +
                ", city='" + city + '\'' +
                ", industry='" + industry + '\'' +
                ", experience='" + experience + '\'' +
                ", paidConsult='" + paidConsult + '\'' +
                ", description='" + description + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", status=" + status +
                '}';
    }
}