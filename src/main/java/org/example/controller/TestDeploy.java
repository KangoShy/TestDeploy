package org.example.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: RuiBin.Zhou
 * @Date: 2024/3/5 10:38
 * @Description:
 */
@RestController
@RequestMapping("")
public class TestDeploy {

    /**
     * 探针，监测服务活性
     *
     * @return java.lang.String
     */
    @GetMapping("pong")
    public String pong() {
        return "up";
    }

}
