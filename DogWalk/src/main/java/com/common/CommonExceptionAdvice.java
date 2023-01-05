package com.common;

<<<<<<< HEAD
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
=======
import java.sql.SQLIntegrityConstraintViolationException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
>>>>>>> 3a6178e20cf2af11fdf12aa1d08bdfcf99d6a678

import lombok.extern.log4j.Log4j;

/* 스프링의 예외 처리 방법
 * [1] @ExceptionHandler를 이용하는 방법
 * [2] @ControllerAdvice를 이용하는 방법
<<<<<<< HEAD
 * [3] @ResponseStatus 를 이용해서 HTTP상태코드 처리하는 방법
 */
=======
 * [3] @ResponseStatus를 이용해서 HTTP상태코드 처리하는 방법
 * */
>>>>>>> 3a6178e20cf2af11fdf12aa1d08bdfcf99d6a678
@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	
<<<<<<< HEAD
	
	@ExceptionHandler(NumberFormatException.class)
	public String cmmNumberException(Exception e) {
=======
	@ExceptionHandler(NumberFormatException.class)
	public String cmmNumberException(Exception e){
>>>>>>> 3a6178e20cf2af11fdf12aa1d08bdfcf99d6a678
		log.error(e);
		return "/login/errorAlert";
	}
	
<<<<<<< HEAD

=======
	@ExceptionHandler(SQLIntegrityConstraintViolationException.class)
	public String cmmSQLEception(Exception e) {
		log.error(e);
		return "/login/error";
	}
>>>>>>> 3a6178e20cf2af11fdf12aa1d08bdfcf99d6a678
}
