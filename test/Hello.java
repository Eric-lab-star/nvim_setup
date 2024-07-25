package com.sisyphus.webServer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WebServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(WebServerApplication.class, args);
        System.out.println();
    }

    public class Student {
        @Id @GeneratedValue private Integer id;
    }

    @Column(name = "c-lname", length = 200)
    private String lastname;

    private String firstname;

    @Column(unique = true)
    private String email;

    private int age;

    public Student() {}

    public Student(String lastname, String firstname, String email, int age) {
        this.lastname = lastname;
        this.firstname = firstname;
        this.email = email;
        this.age = age;
    }

}

