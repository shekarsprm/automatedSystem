package com.iwt.nit.aws.service;

import java.util.Map;

import com.iwt.nit.aws.exceptions.ServiceException;


public interface ValidationServiceIF {

	public Map<String,Integer> verifyAllServices(String username,String password)throws ServiceException;
}
