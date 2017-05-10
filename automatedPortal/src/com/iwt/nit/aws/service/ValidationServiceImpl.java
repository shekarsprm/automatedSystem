package com.iwt.nit.aws.service;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.iwt.nit.aws.dao.LDAPLoginDaoIF;
import com.iwt.nit.aws.dto.UserDTO;
import com.iwt.nit.aws.exceptions.DaoException;
import com.iwt.nit.aws.exceptions.ServiceException;
import com.iwt.nit.aws.helper.AwsPortalConstants;
import com.iwt.nit.aws.helper.DaoFactory;

@Service
public class ValidationServiceImpl implements ValidationServiceIF {

	private LDAPLoginDaoIF loginDaoIF = null;

	public Map<String, Integer> verifyAllServices(String username,String password) throws ServiceException {
		
		Map<String, Integer> userService = new LinkedHashMap<String, Integer>();
		
		loginDaoIF = DaoFactory.ldapDaoFactory();
		try {
			boolean verifyLoginCreds = loginDaoIF.verifyCreds(username,password);
			if (Boolean.TRUE.equals(verifyLoginCreds)) {
				// Expire Date Checking
				Integer expireDate=loginDaoIF.expireDateVerification(username);
				if(AwsPortalConstants.DATE_CORRECT==expireDate){
					userService.put("PASSWORD_EXPIRE",AwsPortalConstants.DATE_CORRECT);
				}else if(AwsPortalConstants.DATE_EXPIRED==expireDate){
					userService.put("PASSWORD_EXPIRE",AwsPortalConstants.DATE_EXPIRED);
					return userService;
				}
				UserDTO userDTO = loginDaoIF.userInfo(username);
				if ("ACTIVE".equals(userDTO.getAccountStatus())) {
					userService.put("ACTIVE_STATUS",AwsPortalConstants.ACTIVE_STATUS);

				} else if ("INACTIVE".equals(userDTO.getAccountStatus())) {
					userService.put("ACTIVE_STATUS",AwsPortalConstants.INACTIVE_STATUS);
					return userService;
				} else if ("DISABLE".equals(userDTO.getAccountStatus())) {
					userService.put("ACTIVE_STATUS",AwsPortalConstants.DISABLE_STATUS);
					return userService;
				}
				
				Integer count = loginDaoIF.findConsetiveFailureCount(username);
				System.out.println("Count values "+count);
				if (count < 3) {
					loginDaoIF.updatenNumberOfLoginTimes(username);
					loginDaoIF.updateConsetiveFailureZero(username);
                 String role=loginDaoIF.userRole(username);
                 System.out.println("ROle OF S"+role);
                 if(Integer.parseInt(role)==5000){
                	 userService.put("USER_CREDS_VERFICATION",AwsPortalConstants.LOGIN_SUCCESS);
                	 userService.put("USER_ROLE",Integer.parseInt(role));
                	 return userService;
                 }else if(Integer.parseInt(role)==5001){
                	 userService.put("USER_CREDS_VERFICATION",AwsPortalConstants.LOGIN_SUCCESS);
                	 userService.put("USER_ROLE",Integer.parseInt(role));
                	 return userService;
                 }else if(Integer.parseInt(role)==5002){
                	 userService.put("USER_CREDS_VERFICATION",AwsPortalConstants.LOGIN_SUCCESS);
                	 userService.put("USER_ROLE",Integer.parseInt(role));
                	 return userService;
                 }else if(Integer.parseInt(role)==5003){
                	 userService.put("USER_CREDS_VERFICATION",AwsPortalConstants.LOGIN_SUCCESS);
                	 userService.put("USER_ROLE",Integer.parseInt(role));
                	 return userService;
                 }
				} else {
					userService.put("PASSWORD_DIASABLE_TODAY",AwsPortalConstants.PASSWORD_DISABLE_TODAY);
					return userService;
				}
			} else {
				int count=loginDaoIF.updateConsectiveFailures(username);
				//PASSWORD_DISABLE
				if(count==3){
					userService.put("PASSWORD_BLOCKED",AwsPortalConstants.PASSWORD_BLOCKED);
				}
				userService.put("USER_CREDS_VERFICATION",AwsPortalConstants.LOGIN_FAILED);
				return userService;
			}

		} catch (DaoException e) {
			e.printStackTrace();
		}
		return userService;
	}

}
