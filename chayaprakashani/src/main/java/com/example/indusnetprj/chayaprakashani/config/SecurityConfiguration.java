package com.example.indusnetprj.chayaprakashani.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.indusnetprj.chayaprakashani.dao.StudentDAO;
import com.example.indusnetprj.chayaprakashani.service.CustomUserDetailsService;

@EnableGlobalMethodSecurity(prePostEnabled = true)  
@EnableWebSecurity
@EnableJpaRepositories(basePackageClasses = StudentDAO.class)
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{

		@Autowired
	    private CustomUserDetailsService userDetailsService;
		
		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(userDetailsService);   
		}

		@Override
	    protected void configure(HttpSecurity http) throws Exception {

	        http.csrf().disable();
	        http.authorizeRequests()
	                .antMatchers("/admin").authenticated()
	                .antMatchers("/showstudents/{userId}").authenticated()
	                .antMatchers("/courses").permitAll()
	                .and()
	                .httpBasic();
	    }
	
		@Bean
		public PasswordEncoder getPasswordEncoder() {
			
			return NoOpPasswordEncoder.getInstance();
		}
}
