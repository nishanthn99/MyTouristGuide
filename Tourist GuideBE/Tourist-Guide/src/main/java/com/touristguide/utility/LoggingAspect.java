package com.touristguide.utility;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class LoggingAspect {
	private Logger logger=LogManager.getLogger(this.getClass());
	
	@AfterThrowing(pointcut = "exection(* *(..))",throwing = "exception")
	public void applicationServiceLog() {
		
	}

}
