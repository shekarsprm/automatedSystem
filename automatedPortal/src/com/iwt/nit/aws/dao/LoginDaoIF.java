package com.iwt.nit.aws.dao;

import com.iwt.nit.aws.dto.UserASPDTO;
import com.iwt.nit.aws.exceptions.DaoException;

public interface LoginDaoIF {

public UserASPDTO userDetails(String username)throws DaoException;	
}
