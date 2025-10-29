package com.dudu.jenkinstest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller  // 注意：这里用的是 @Controller，不是 @RestController
public class WebController {

    @GetMapping("/index")
    public String index() {
        // 返回 templates 目录下的 index.html
        return "index";
    }
}
