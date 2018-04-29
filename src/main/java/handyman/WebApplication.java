package handyman;


import org.springframework.boot.SpringApplication;
import org.hibernate.cfg.*;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.fasterxml.classmate.AnnotationConfiguration;

import handyman.models.User;

@SpringBootApplication
public class WebApplication extends SpringBootServletInitializer {
 public static void main(String[] args) throws Exception {
        SpringApplication.run(WebApplication.class, args);
    }
}