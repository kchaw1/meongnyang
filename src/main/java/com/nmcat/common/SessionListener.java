package com.nmcat.common;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.mapper.LoginHistoryMapper;

public class SessionListener implements HttpSessionListener{
	
	//세션 생성 감지
    public void sessionCreated(HttpSessionEvent se) {
      HttpSession session = se.getSession();
      
      Member member = (Member)session.getAttribute("user");
      
      System.out.println("Session Created :: " + session.getId());
    }

    //세션 생성 감지
    public void sessionDestroyed(HttpSessionEvent se) {
    	HttpSession session = se.getSession();
    
      WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
    	
      LoginHistoryMapper st = (LoginHistoryMapper)wac.getBean("loginHistoryMapper");
      
      System.out.println(st);
      
      Member member = (Member)session.getAttribute("user");
      
      st.updateHistory(member.getId());
      
      System.out.println("Session Destroyed :: " + session.getId());
    }
}
