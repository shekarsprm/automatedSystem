package com.iwt.nit.aws.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.iwt.nit.aws.dto.UserASPDTO;

public class UserASPMapper implements RowMapper<UserASPDTO> {
public UserASPDTO mapRow(ResultSet rs, int arg1) throws SQLException {
	UserASPDTO userDTO=new UserASPDTO();
	userDTO.setUsername(rs.getString("USERNAME"));
	userDTO.setUserId(rs.getInt("USER_ID"));
	userDTO.setIpAddress(rs.getString("IPADDRESS"));
	userDTO.setAdmin(rs.getBoolean("IS_ADMIN"));
	return userDTO;
}
}
