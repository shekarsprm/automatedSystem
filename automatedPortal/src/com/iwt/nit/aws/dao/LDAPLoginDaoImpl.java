package com.iwt.nit.aws.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;

import com.iwt.nit.aws.dao.mapper.UserMapper;
import com.iwt.nit.aws.dao.mapper.UserRowMapperCount;
import com.iwt.nit.aws.dto.UserDTO;
import com.iwt.nit.aws.exceptions.DaoException;
import com.iwt.nit.aws.helper.AwsPortalConstants;

public class LDAPLoginDaoImpl implements LDAPLoginDaoIF {
	
	private static Logger LOGGER = Logger.getLogger(LDAPLoginDaoImpl.class);

	private static DataSource dataSource=null;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public boolean verifyCreds(String username, String password)
			throws DaoException {
		LOGGER.info("$$$verifyCreds() $$$$");
		boolean verifyCreds=false;
		try {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			int count=jdbcTemplate.queryForInt(AwsPortalConstants.SELECT_USER_VERIFY,new Object[]{username,password});
			if(count==1){
				verifyCreds=true;
			}else{
				verifyCreds=false;
			}
		} catch (Exception e) {
			LOGGER.error("Error into the verifyCreds(String username, String password) "+e.getMessage());
			e.printStackTrace();
			throw new DaoException();
		}
		return verifyCreds;
	}

	public UserDTO userInfo(String username) throws DaoException {
		UserDTO userDTO=new UserDTO();
		try {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			userDTO=(UserDTO)jdbcTemplate.queryForObject(AwsPortalConstants.SELECT_USER_DETAILS, new Object[]{username}, new UserMapper());
		} catch (Exception e) {
			LOGGER.error("Error into the  userInfo(String username)"+e.getMessage());
			e.printStackTrace();
			throw new DaoException();
		}
		return userDTO;
	}
	public void updatenNumberOfLoginTimes(String username)throws DaoException{
		try {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			int countIncrement=countLoginTimes(username);
			jdbcTemplate.update(AwsPortalConstants.UPDATE_LOGIN_COUNT, new Object[]{countIncrement+AwsPortalConstants.COUNT_PLUS,username});
		} catch (Exception e) {
			LOGGER.error("Error into the  updatenNumberOfLoginTimes(String username)"+e.getMessage());
			e.printStackTrace();
			throw new DaoException();
		}
		}
		public int countLoginTimes(String username)throws DaoException{
			Integer count=0;
			try {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
				 count=jdbcTemplate.queryForInt(AwsPortalConstants.SELECT_LAST_HITS_COUNT,new Object[]{username});
			} catch (Exception e) {
				LOGGER.error("Error into the countLoginTimes(String username) "+e.getMessage());
				e.printStackTrace();
				throw new DaoException();
			}		
			return count;
		}
	
  public void updatLastLoginTime(String username)throws DaoException{
	  
		try {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			Timestamp currentTimestamp=new Timestamp(new Date().getTime());
			Date currentDate=new Date();
			jdbcTemplate.update(AwsPortalConstants.UPDATE_LAST_LOGIN_TIMES, new Object[]{currentTimestamp,currentDate,currentTimestamp,username});
		} catch (Exception e) {
			LOGGER.error("Error into the updatLastLoginTime(String username)"+e.getMessage());
			e.printStackTrace();
			throw new DaoException();
		}		
  }
  public Integer updateConsetiveSuccess(String username)throws DaoException{
	  Integer updateConstetiveSuccess=0;
			try {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
				Timestamp currentTimestamp=new Timestamp(new Date().getTime());
				Date currentDate=new Date();
                updateConstetiveSuccess=jdbcTemplate.update(AwsPortalConstants.UPDATE_CONSERTIVE_SUCCESS, new Object[]{AwsPortalConstants.COUNT_ZERO,
                		 currentTimestamp,currentDate,currentTimestamp,username});
			} catch (Exception e) {
				LOGGER.error("Error into the findConsetiveFailureCount(String username) "+e.getMessage());
				e.printStackTrace();
				throw new DaoException();
			}		
			return updateConstetiveSuccess;
  }
  public Integer updateConsectiveFailures(String username)throws DaoException{
	  int consetiveFailureCount=0;
	  try {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			 consetiveFailureCount=findConsetiveFailureCount(username);
			if(consetiveFailureCount==0){
				jdbcTemplate.update(AwsPortalConstants.UPDATE_CONSERTIVE_FAILUR, new Object[]{AwsPortalConstants.COUNT_PLUS,username});	
				return findConsetiveFailureCount(username);
			}
			  if(consetiveFailureCount<3){
				jdbcTemplate.update(AwsPortalConstants.UPDATE_CONSERTIVE_FAILUR, new Object[]{consetiveFailureCount+AwsPortalConstants.COUNT_PLUS,username});
				consetiveFailureCount=findConsetiveFailureCount(username);
			  }else{
				  return consetiveFailureCount;
			  }
		} catch (Exception e) {
			LOGGER.error("Error into the  updateConsectiveFailures(String username)"+e.getMessage());
			e.printStackTrace();
			throw new DaoException();
		}
	  return consetiveFailureCount;
  }
  public Integer findConsetiveFailureCount(String username)throws DaoException{
	  Integer count=0;
		try {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			List<Integer> listCount=(List<Integer>)jdbcTemplate.query(AwsPortalConstants.SELECT_CONSERTIVE_FAILURE_COUNT,new Object[]{username}, new UserRowMapperCount());
           for(Integer countV:listCount){
        	   count=countV;
           }
		} catch (Exception e) {
			LOGGER.error("Error into the findConsetiveFailureCount(String username) "+e.getMessage());
			e.printStackTrace();
			throw new DaoException();
		}		
		return count;
  }
  public void updateConsetiveFailureZero(String username)throws DaoException{
	  try {
		  JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		  jdbcTemplate.update(AwsPortalConstants.UPDATE_CONSERTIVE_FAILURE_ZERO, new Object[]{username});
	} catch (Exception e) {
		LOGGER.error("Error into the updateConsetiveFailureZero(String username) "+e.getMessage());
		e.printStackTrace();
		throw new DaoException();
	}
  }
  public Integer expireDateVerification(String username)throws DaoException{
	  Integer returnExpireDateValue=0;
	  try{
	  UserDTO userDTO=userInfo(username);
	  Date expireDate=userDTO.getExpirePasswordDate();
	  Date currentDate=new Date();
      if(currentDate.before(expireDate)){
    	  returnExpireDateValue=AwsPortalConstants.DATE_CORRECT;
      }else if(currentDate.after(expireDate)){
    	  returnExpireDateValue=AwsPortalConstants.DATE_EXPIRED;
      }else if(currentDate.equals(expireDate)) {
    	  returnExpireDateValue=AwsPortalConstants.DATE_EQUAL;
      }
	  }catch(Exception e){
		  LOGGER.error("Error into the expireDateVerification()"+e.getMessage());
			e.printStackTrace();
			throw new DaoException();
	  }
	  return returnExpireDateValue;
  }
  
  public Integer userChecking(String username)throws DaoException{
	  Integer userChecking=0;
	  try {
		  UserDTO userDTO=userInfo(username);
		  String userStatus=userDTO.getAccountStatus();
		  if("ACTIVE".equals(userStatus)){
			  userChecking=AwsPortalConstants.ACTIVE_STATUS;
		  }else if("INACTIVE".equals(userStatus)){
			  userChecking=AwsPortalConstants.INACTIVE_STATUS;
		  }else if("DISABLE".equals(userStatus)){
			  userChecking=AwsPortalConstants.DISABLE_STATUS;
		  }
	} catch (Exception e) {
		LOGGER.error("Error into the userChecking "+e.getMessage());
		e.printStackTrace();
		throw new DaoException();
	}
	  return userChecking;
  }
  public String userRole(String username)throws DaoException{
	  String userRole="";
	  try {
		  UserDTO userDTO=userInfo(username);
		  userRole=userDTO.getRole();
		  if("ADMIN".equals(userRole)){
			  userRole=AwsPortalConstants.ADMIN_ROLE_ID.toString();
		  } else if("NORMAL".equals(userRole)){
			  userRole=AwsPortalConstants.NORMA_USER_ID.toString();
		  }else if("DEV".equals(userRole)){
			  userRole=AwsPortalConstants.HR_USER_ID.toString();
		  }else if("CUSTOMER".equals(userRole)){
			  userRole=AwsPortalConstants.CUSTOMER_USER_ID.toString();
		  }
	} catch (Exception e) {
		LOGGER.error("Error into the userChecking "+e.getMessage());
		e.printStackTrace();
		throw new DaoException();
	}
	  return userRole;
  }
}
