
package com.sisyphus.webServer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WebServerApplication {
  public static void main(String[] args) {
    SpringApplication.run(WebServerApplication.class, args);
    System.out.println();
  }
}
