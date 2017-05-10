/**
 * 
 */
package com.iwt.nit.aws.service;

import com.iwt.nit.aws.exceptions.ServiceException;
import com.iwt.nit.aws.form.User;

/**
 * @author m1012679
 *
 */
public interface AuthenticationService {
	public User login(User user) throws ServiceException;
}
