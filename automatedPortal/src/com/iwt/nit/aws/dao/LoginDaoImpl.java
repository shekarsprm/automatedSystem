package com.iwt.nit.aws.dao;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;

import com.iwt.nit.aws.dao.mapper.UserASPMapper;
import com.iwt.nit.aws.dto.UserASPDTO;
import com.iwt.nit.aws.exceptions.DaoException;
import com.iwt.nit.aws.helper.AwsPortalConstants;

public class LoginDaoImpl implements LoginDaoIF{
	private static Logger LOGGER = Logger.getLogger(StartUpDaoImpl.class);

	private static DataSource dataSource=null;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	public UserASPDTO userDetails(String username) throws DaoException {
		LOGGER.info("$$$userDetails() $$$$+:::username=["+username+"]");
		UserASPDTO userDTO=new UserASPDTO();
		try {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			userDTO=(UserASPDTO)jdbcTemplate.queryForObject(AwsPortalConstants.SELECT_USERASP_QUERY, new Object[]{username}, new UserASPMapper());
		} catch (Exception e) {
			LOGGER.error("Error into the userDetails(String username) "+e.getMessage());
		}
		return userDTO;
	}
}
