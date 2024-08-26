package com.javahelena.hello.api;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class HelloController {

    @Value("${HELLO_MESSAGE:Hello World from the javaclass again!}")
    private String message;

    @GetMapping("/hello")
    public String sayHello() {
        log.info("Saying hello");
        return message;
    }
}
