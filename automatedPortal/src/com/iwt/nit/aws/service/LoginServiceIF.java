package com.iwt.nit.aws.service;

import com.iwt.nit.aws.exceptions.ServiceException;
import com.iwt.nit.aws.form.UserASPVO;

public interface LoginServiceIF {
	public UserASPVO userDetails(String username)throws ServiceException;	
}
