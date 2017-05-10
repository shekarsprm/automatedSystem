package com.iwt.nit.aws.service;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.iwt.nit.aws.dao.LoginDaoIF;
import com.iwt.nit.aws.dto.UserASPDTO;
import com.iwt.nit.aws.exceptions.DaoException;
import com.iwt.nit.aws.exceptions.ServiceException;
import com.iwt.nit.aws.form.UserASPVO;
import com.iwt.nit.aws.helper.DaoFactory;

@Service
public class LoginServiceImpl implements LoginServiceIF {
	private static Logger LOGGER = Logger.getLogger(LoginServiceImpl.class);
   private LoginDaoIF loginDaoIF=null;
	public UserASPVO userDetails(String username) throws ServiceException {
		
		UserASPVO userInfo=null;
		
		
		try {
			UserASPDTO userDTO= loginDaoIF.userDetails(username);
			
			// USer Exists or NOT
			
			// ACTIVE
			
			// EXPIRE
			
			// FOR THIS active or NOT
			
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// One either we can connecto LDAP Server
		
		
		// We can to our DB for ALL Validation
		return userInfo; 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*
		UserASPVO userVO = new UserASPVO();
		loginDaoIF=DaoFactory.loginDaoFactory();
		try {
			UserASPDTO userASP=loginDaoIF.userDetails(username);
			try {
				BeanUtils.copyProperties(userVO, userASP);
			} catch (IllegalAccessException e) {
				LOGGER.error("Error into the userDetails BeanUtils issue "+e.getMessage());
			} catch (InvocationTargetException e) {
			}
		} catch (DaoException e) {
			LOGGER.error("Error into the userDetails BeanUtils issue "+e.getMessage());
		}
		return userVO;
	*/}
}
