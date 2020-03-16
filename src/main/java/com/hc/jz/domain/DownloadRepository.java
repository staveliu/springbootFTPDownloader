package com.hc.jz.domain;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;

public interface DownloadRepository extends JpaRepository<Download, Integer> {
    Download findByFtpUsername(String username);

    @Transactional
    @Modifying
    @Query("update Download d set d.status=?2 where d.ftpUsername=?1")
    Integer updateStatus(String username,Integer status);
}
