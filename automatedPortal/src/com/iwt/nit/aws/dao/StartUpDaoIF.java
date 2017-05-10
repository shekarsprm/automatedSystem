package com.iwt.nit.aws.dao;

import com.iwt.nit.aws.dto.AuditDTO;
import com.iwt.nit.aws.exceptions.DaoException;

public interface StartUpDaoIF {
	public void insertAudit(AuditDTO auditDTO) throws DaoException;
}
