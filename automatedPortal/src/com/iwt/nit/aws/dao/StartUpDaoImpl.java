package com.iwt.nit.aws.dao;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.iwt.nit.aws.dto.AuditDTO;
import com.iwt.nit.aws.exceptions.DaoException;
import com.iwt.nit.aws.helper.AwsPortalConstants;

@Repository("StartUpDaoImpl")	
public class StartUpDaoImpl implements StartUpDaoIF {

	private static Logger LOGGER = Logger.getLogger("AUTO_PORTAL");


	@Autowired
	private JdbcTemplate jdbcTemplate;
	
		
	public void insertAudit(AuditDTO auditDTO) throws DaoException {
		try {

			int x=jdbcTemplate.update(AwsPortalConstants.INSERT_AUDIT_QUERY, new Object[]{auditDTO.getHostname(),auditDTO.getIpAddress(),auditDTO.getViewDate(),
        		   auditDTO.getViewDateAndTime(),auditDTO.getBrowser(),auditDTO.getSystemUser(),auditDTO.getUserAgent(),auditDTO.getVistorranId(),auditDTO.getOsName()
           });
         if(x==1){
        	 LOGGER.debug("insertion completed ;insertion value=["+x+"]");
         }
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("insertion  failed " + e.getMessage());	
			throw new DaoException(e);
		}
	}

}
