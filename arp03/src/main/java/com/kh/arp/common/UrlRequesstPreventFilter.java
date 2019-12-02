package com.kh.arp.common;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class UrlRequesstPreventFilter
 */
@WebFilter("/*")
public class UrlRequesstPreventFilter implements Filter {

    /**
     * Default constructor. 
     */
    public UrlRequesstPreventFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest hreq=(HttpServletRequest)request;
		HttpServletResponse hres=(HttpServletResponse)response;
		HttpSession session=hreq.getSession();
		
		String requestURI = hreq.getRequestURI();
		if(!requestURI.equals("/arp/count/websocket") &&
				!requestURI.equals("/arp/Echo") &&
				!requestURI.equals("/arp/websocket") &&
				!requestURI.equals("/arp/") &&
				requestURI.indexOf("/arp/resources/")==-1) {
			String referer=hreq.getHeader("Referer");
			if(referer==null) {
				hreq.getRequestDispatcher("WEB-INF/views/common/error.jsp").forward(request, response);
			}else {
				if(!referer.substring(referer.lastIndexOf("/")).equals("/login.me")){
					session.setAttribute("referer", referer.substring(referer.lastIndexOf("/")));
				}
			}
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
