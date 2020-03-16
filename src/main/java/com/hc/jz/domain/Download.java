package com.hc.jz.domain;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
public class Download {
    private int id;
    private String ftpUsername;
    private String ftpPassword;
    private Timestamp startTime;
    private int status;
    private Timestamp finishedTime;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "ftp_username", nullable = false, length = 255)
    public String getFtpUsername() {
        return ftpUsername;
    }

    public void setFtpUsername(String ftpUsername) {
        this.ftpUsername = ftpUsername;
    }

    @Basic
    @Column(name = "ftp_password", nullable = false, length = 255)
    public String getFtpPassword() {
        return ftpPassword;
    }

    public void setFtpPassword(String ftpPassword) {
        this.ftpPassword = ftpPassword;
    }

    @Basic
    @Column(name = "start_time", nullable = false)
    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    @Basic
    @Column(name = "status", nullable = false)
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Basic
    @Column(name = "finished_time", nullable = true)
    public Timestamp getFinishedTime() {
        return finishedTime;
    }

    public void setFinishedTime(Timestamp finishedTime) {
        this.finishedTime = finishedTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Download download = (Download) o;
        return id == download.id &&
                status == download.status &&
                Objects.equals(ftpUsername, download.ftpUsername) &&
                Objects.equals(ftpPassword, download.ftpPassword) &&
                Objects.equals(startTime, download.startTime) &&
                Objects.equals(finishedTime, download.finishedTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, ftpUsername, ftpPassword, startTime, status, finishedTime);
    }
}
