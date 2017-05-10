package com.iwt.nit.aws.helper;

import com.iwt.nit.aws.dao.LDAPLoginDaoIF;
import com.iwt.nit.aws.dao.LDAPLoginDaoImpl;
import com.iwt.nit.aws.dao.LoginDaoIF;
import com.iwt.nit.aws.dao.LoginDaoImpl;
import com.iwt.nit.aws.dao.StartUpDaoIF;
import com.iwt.nit.aws.dao.StartUpDaoImpl;

public class DaoFactory {

	private static StartUpDaoIF startUpDaoIF = null;
	private static LDAPLoginDaoIF ldapDaoIF = null;
	private static LoginDaoIF loginDaoIF=null;
    
	static {
		startUpDaoIF = new StartUpDaoImpl();
		ldapDaoIF=new LDAPLoginDaoImpl();
		loginDaoIF=new LoginDaoImpl();
	}

	public static StartUpDaoIF startUpDaoFactory() {
		return startUpDaoIF;
	}
	public static LDAPLoginDaoIF ldapDaoFactory(){
		return ldapDaoIF;
	}
	public static LoginDaoIF loginDaoFactory(){
		return loginDaoIF;
	}
	
}
