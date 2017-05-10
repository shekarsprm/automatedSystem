package com.iwt.nit.aws.dao;

import com.iwt.nit.aws.dto.UserDTO;
import com.iwt.nit.aws.exceptions.DaoException;

public interface LDAPLoginDaoIF {
	public boolean verifyCreds(String username,String password)throws DaoException;
	public UserDTO userInfo(String username)throws DaoException;
	public int countLoginTimes(String username)throws DaoException;
	public void updatenNumberOfLoginTimes(String username)throws DaoException;
	public void updatLastLoginTime(String username)throws DaoException;
	public Integer updateConsectiveFailures(String username)throws DaoException;
	public Integer findConsetiveFailureCount(String username)throws DaoException;
	public Integer expireDateVerification(String username)throws DaoException;
	public void updateConsetiveFailureZero(String username)throws DaoException;
	public String userRole(String username)throws DaoException;
}
