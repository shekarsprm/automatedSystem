package com.iwt.nit.aws.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iwt.nit.aws.exceptions.ServiceException;
import com.iwt.nit.aws.form.User;
import com.iwt.nit.aws.form.UserASPVO;
import com.iwt.nit.aws.helper.AwsPortalConstants;
import com.iwt.nit.aws.helper.PasswordEncoder;
import com.iwt.nit.aws.service.AuthenticationService;
import com.iwt.nit.aws.service.LoginServiceIF;
import com.iwt.nit.aws.service.ValidationServiceIF;

@Controller
public class LoginController {

	
	@Autowired
	private ValidationServiceIF validateServiceIF;
	
	@Autowired
    private LoginServiceIF loginServiceIF;
	
	
	
	@Autowired
	AuthenticationService authenticationService;

	@RequestMapping(method = RequestMethod.POST, value = "/Login.action")
	public String processSubmit(@ModelAttribute("user") User user,
			BindingResult errors, Model model,HttpServletRequest request) {
		String target = "testTakerHome";

		try {
			User user2 = authenticationService.login(user);
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user2.getUsername());
			session.setAttribute("userId", user2.getUserId());
			if (user2.getIsAdmin()) {
				target = "adminHome";
			} else {
				target = "testTakerHome";
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			target = "login";
			model.addAttribute("message", e.getMessage());
		}
		return target;
	}


	@RequestMapping(method = RequestMethod.GET, value = "/Login.action")
	public String initForm(ModelMap model) {
		User user = new User();
		user.setIsAdmin(true);
		model.addAttribute("user", user);
		return "login";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/Logout.action")
	public String logout() {
		return "logout";
	}
	
	@RequestMapping(value = "loginVerification.action")
	public String loginVerification(HttpServletRequest request) {
		String target = "login";
        String message="";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username!=null || password!=null){
		List<Integer> listOfConditions=new ArrayList<Integer>();
		try {
			Map<String, Integer> loginVerficationDetails = validateServiceIF.verifyAllServices(username,PasswordEncoder.encodePassword(password));
			
			Set set = loginVerficationDetails.entrySet();
			for (Iterator it = set.iterator(); it.hasNext();) {
				Map.Entry mapEntry = (Map.Entry) it.next();
                Integer keyValue=(Integer)mapEntry.getValue();
                listOfConditions.add(keyValue);
			}
			
			if(listOfConditions.contains(AwsPortalConstants.PASSWORD_DISABLE_TODAY)){
				request.setAttribute("message", "Your password is blocked try after 24 hours");
				return target;
			}
			if(listOfConditions.contains(AwsPortalConstants.PASSWORD_BLOCKED)){
				request.setAttribute("message", "Your password is blocked try after 24 hours");
				return target;
			}
			
			if(listOfConditions.contains(AwsPortalConstants.DATE_CORRECT)){
				 if(listOfConditions.contains(AwsPortalConstants.ACTIVE_STATUS)){
            		 if(listOfConditions.contains(AwsPortalConstants.LOGIN_SUCCESS)){
            			 request.getSession().setAttribute("username", username);
            			    if(listOfConditions.contains(AwsPortalConstants.ADMIN_ROLE_ID)){
            			    	    UserASPVO userVO=new UserASPVO();
            			    		userVO=loginServiceIF.userDetails(username);
            			    		request.getSession().setAttribute("userVO",userVO);
            			    		target="adminHome";            			 	
            			    	}else{
            			    		target="testTakerHome";            			 
            			    	}
            		 }else{
            			 request.setAttribute("message", "Your not active user ,please contact (admin@iwinner.com)");
            			 return target;
            		 }
            	 }
			}else if(listOfConditions.contains(AwsPortalConstants.DATE_EXPIRED)){
				 request.setAttribute("message", "Your password date is expired,please contact (admin@iwinner.com)");
    			 return target;
			}
			if(listOfConditions.contains(AwsPortalConstants.LOGIN_FAILED)){
				request.setAttribute("message", "Invalid cred's,Please enter valid creds");
				return target;
			}
			
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		}else{
			return target;
		}
		return target;
	}
}
