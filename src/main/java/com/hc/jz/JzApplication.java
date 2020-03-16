package com.hc.jz;

import com.hc.jz.service.DownloadThread;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

@SpringBootApplication
@Import(DownloadThread.class)
public class JzApplication {
    static ExecutorService executorService;

    public static ExecutorService getExecutorService() {
        return executorService;
    }

    public static void main(String[] args) {
        executorService = Executors.newFixedThreadPool(3);
        SpringApplication.run(JzApplication.class, args);
    }

}
