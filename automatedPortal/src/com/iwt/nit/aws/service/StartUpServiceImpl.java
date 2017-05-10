package com.iwt.nit.aws.service;

import java.lang.reflect.InvocationTargetException;








import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iwt.nit.aws.dao.StartUpDaoIF;
import com.iwt.nit.aws.dto.AuditDTO;
import com.iwt.nit.aws.exceptions.DaoException;
import com.iwt.nit.aws.exceptions.ServiceException;
import com.iwt.nit.aws.form.AuditForm;
import com.iwt.nit.aws.helper.DaoFactory;

/**
 * 
 * 
 * @author Welcome
 *
 */
@Service
public class StartUpServiceImpl implements StartUpServiceIF {
	private static Logger LOGGER = Logger.getLogger("AUTO_PORTAL");
	
	@Autowired
	private StartUpDaoIF startUpDaoIF = null;

	

	public void insertAuditLog(AuditForm auditForm) throws ServiceException {
		LOGGER.info("insertAuditLog is started auditForm=["+auditForm+"]");
		AuditDTO auditDTO = new AuditDTO();
		try {
			BeanUtils.copyProperties(auditDTO, auditForm);

			try {
				startUpDaoIF.insertAudit(auditDTO);
				LOGGER.debug("transfed to DB layer ");
			} catch (DaoException e) {
				LOGGER.error("Error at the "+e.getMessage());
				e.printStackTrace();
				throw new ServiceException(e);
			}
		} catch (IllegalAccessException e) {
			LOGGER.error("Error at the "+e.getMessage()+"BeanUtils is conversion not working");
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
			LOGGER.error("Error at the "+e.getMessage()+"BeanUtils is conversion not working ");
		}
		LOGGER.info("insertAuditLog is ended auditForm=["+auditDTO+"]");
	}
}
