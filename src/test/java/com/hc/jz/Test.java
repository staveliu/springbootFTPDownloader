package com.hc.jz;

import com.hc.jz.domain.Download;
import com.hc.jz.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

@SpringBootTest
public class Test {
    @Autowired
    private HomeService homeService;

    @org.junit.jupiter.api.Test
    public void test1(){
        Download download=homeService.getDownloader("stave");
        System.out.println(download.getStatus());
    }
}
