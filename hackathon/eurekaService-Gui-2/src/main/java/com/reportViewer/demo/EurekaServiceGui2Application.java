package com.reportViewer.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
@EnableDiscoveryClient
@SpringBootApplication
public class EurekaServiceGui2Application {

	public static void main(String[] args) {
		SpringApplication.run(EurekaServiceGui2Application.class, args );
	}

}
