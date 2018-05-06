package handyman;


import org.springframework.boot.SpringApplication;

import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@SpringBootApplication
public class WebApplication extends SpringBootServletInitializer {
	private static Logger LOG = Logger.getLogger(OrderController.class.getName());
	
	@Bean
	public LocaleResolver localeResolver() {
		LOG.log(Level.INFO, "Nacitanie LocalResorvel beany");
		SessionLocaleResolver localeResolver = new SessionLocaleResolver();
		localeResolver.setDefaultLocale(Locale.US);
		return localeResolver;
	}
	
	public static void main(String[] args) throws Exception {
        SpringApplication.run(WebApplication.class, args);
    }
}