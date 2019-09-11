package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();

	public void init(ServletConfig config) throws ServletException {
		String propertyConfig = config.getInitParameter("propertyConfig");

		FileInputStream fin = null;
		Properties properties = new Properties();

		try {
			fin = new FileInputStream(propertyConfig);
			properties.load(fin);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fin.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		Iterator it = properties.keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();

			String className = properties.getProperty(key);
			try {
				Class<?> classType = Class.forName(className);
				Object ob = classType.newInstance();

				map.put(key, ob);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getMethod().equals("POST")) {
			request.setCharacterEncoding("UTF-8");
		}

		String category = request.getServletPath();
		CommandProcess commandProcess = (CommandProcess) map.get(category);

		String view = null;
		try {
			view = commandProcess.requestPro(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(view);//상대번지
		dispatcher.forward(request, response);//제어권 넘기기
	}

}
