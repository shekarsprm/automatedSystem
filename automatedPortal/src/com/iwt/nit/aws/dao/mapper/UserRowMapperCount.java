package com.iwt.nit.aws.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserRowMapperCount implements RowMapper<Integer>{
public Integer mapRow(ResultSet rs, int arg1) throws SQLException {
	Integer count=rs.getInt("CONSECUTIVELOGINFAILURES");
     return count;
}
}
