/**

 * 
 */
package com.iwt.nit.aws.service;

import org.springframework.stereotype.Service;

import com.iwt.nit.aws.exceptions.ServiceException;
import com.iwt.nit.aws.form.User;
	


/**
 * @author m1012679
 *
 */
@Service
public class AuthenticationServiceImpl implements AuthenticationService {
	
	
	@Override
	public User login(User user) throws ServiceException {
		try {
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("Invalid Username/Password");
		}
	}
}
