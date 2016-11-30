package com.fxb.breakfast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ReflectionUtil;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.action.Uploadable;
import com.fxb.breakfast.util.CommonUtil;
/**
 * ǰ�˿�����(����ģʽ[�ṩ�û����������])
 * 
 *
 */
@WebServlet(urlPatterns = { "*.do" }, loadOnStartup = 0, 
		initParams = { 
			@WebInitParam(name = "packagePrefix", value = "com.fxb.breakfast.action."),
			@WebInitParam(name = "jspPrefix", value = ""),
			@WebInitParam(name = "actionSuffix", value = "Action")
		}
)
@MultipartConfig
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String DEFAULT_PACKAGE_NAME = "com.fxb.breakfast.action.";
	private static final String DEFAULT_PACKAGE_HOME="com.fxb.breakfast.homeAction.";
	private static final String DEFAULT_JSP_PATH = "";
	private static final String DEFAULT_ACTION_NAME = "Action";
	private String packagePrefix = null;		// ������ǰ׺
	private String jspPrefix = null;			// JSPҳ��·����ǰ׺
	private String actionSuffix = null;			// Action�����ĺ�׺

	@Override
	public void init(ServletConfig config) throws ServletException {
		String initParam = config.getInitParameter("packagePrefix");
		packagePrefix = initParam != null ? initParam :  DEFAULT_PACKAGE_NAME;
		initParam = config.getInitParameter("jspPrefix");
		jspPrefix = initParam != null ? initParam : DEFAULT_JSP_PATH;
		initParam = config.getInitParameter("actionSuffix");
		actionSuffix = initParam != null ? initParam : DEFAULT_ACTION_NAME;
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		String contextPath = req.getContextPath() + "/";
		String servletPath = req.getServletPath();
		System.out.println("========>>>"+servletPath);
		System.out.println("==========������������"+getFullActionName(servletPath));
		try {
			Action action = (Action) Class.forName(getFullActionName(servletPath)).newInstance();
			try {
				injectProperties(action, req);
			} catch (Exception e) {
			}
			if(action instanceof Uploadable) {	// ͨ���ӿ���ʵ���˽ӿڵ���ע������(�ӿ�ע��)
				List<Part> fileparts = new ArrayList<>();
				List<String> filenames = new ArrayList<>();
				for(Part part : req.getParts()) {
					String cd = part.getHeader("Content-Disposition");
					if(cd.indexOf("filename") >= 0) {
						fileparts.add(part);
						filenames.add(cd.substring(cd.lastIndexOf("=") + 1).replaceAll("\\\"", ""));
					}
				}
				((Uploadable) action).setParts(fileparts.toArray(new Part[fileparts.size()]));
				((Uploadable) action).setFilenames(filenames.toArray(new String[filenames.size()]));
			}
			ActionResult actionResult = action.execute(req, resp);
			if(actionResult != null) {
				
				ResultContent resultContent = actionResult.getResultContent();
				ResultType resultType = actionResult.getResultType();
				switch(resultType) {
				case Redirect:
					resp.sendRedirect(contextPath + resultContent.getUrl());
					break;
				case Forward:
					System.out.println("====="+resultContent.getUrl());
					req.getRequestDispatcher(resultContent.getUrl()).forward(req, resp);
					break;
				case Ajax:
					PrintWriter pw = resp.getWriter();
					pw.println(resultContent.getJson());
					pw.close();
					break;
				case Chain:
					req.getRequestDispatcher(contextPath + resultContent.getUrl()).forward(req, resp);
					break;
				case RedirectChain:
					resp.sendRedirect(contextPath + resultContent.getUrl());
					break;
				default:
				}
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error.html");
		}
	}
	
	// ���������С����·����ö�Ӧ��Action�������
	private String getFullActionName(String servletPath) {
		int start = servletPath.lastIndexOf("/") + 1;
		int end = servletPath.lastIndexOf(".do");
        if(getSubPackage(servletPath).equals("home.")){
        	return DEFAULT_PACKAGE_HOME  + CommonUtil.capitalize(servletPath.substring(start, end)) + actionSuffix;
		}
		return packagePrefix  + CommonUtil.capitalize(servletPath.substring(start, end)) + actionSuffix;
	}
	
	// ���������С����·����ö�Ӧ��������JSPҳ��·��
	private String getFullJspPath(String servletPath) {
		return jspPrefix + getSubJspPath(servletPath);
	}
	
	// ���������С����·������Ӽ�����
	private String getSubPackage(String servletPath) {
		return getSubJspPath(servletPath).replaceAll("\\/", ".");
	}
	
	// ���������С����·�����JSPҳ����Ӽ�·��
	private String getSubJspPath(String servletPath) {
		int start = 1;
		int end = servletPath.lastIndexOf("/");
		return end > start ? servletPath.substring(start, end > 0 ? end + 1 : 0) : "";
	}

	// ��Action������ע������
	private void injectProperties(Action action, HttpServletRequest req) throws Exception {
		Enumeration<String> paramNamesEnum =  req.getParameterNames();
		while(paramNamesEnum.hasMoreElements()) {
			String paramName = paramNamesEnum.nextElement();
			Class<?> fieldType = ReflectionUtil.getFieldType(action, paramName.replaceAll("\\[|\\]", ""));
			if(fieldType != null) {
				Object paramValue = null;
				if(fieldType.isArray()) {	// �����������������
					Class<?> elemType = fieldType.getComponentType();	// �������Ԫ������
					String[] values = req.getParameterValues(paramName);
					paramValue = Array.newInstance(elemType, values.length);	// ͨ�����䴴���������
					for(int i = 0; i < values.length; i++) {
						Object tempObj = CommonUtil.changeStringToObject(elemType, values[i]);
						Array.set(paramValue, i, tempObj);
					}
				}
				else {	// ���������͵�����
					paramValue = CommonUtil.changeStringToObject(fieldType, req.getParameter(paramName));
				}
				ReflectionUtil.setValue(action, paramName.replaceAll("\\[|\\]", ""), paramValue);
			}
		}
	}
}
