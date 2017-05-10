package com.iwt.nit.aws.service;

import com.iwt.nit.aws.exceptions.ServiceException;
import com.iwt.nit.aws.form.AuditForm;

public interface StartUpServiceIF {

	public void insertAuditLog(AuditForm auditForm) throws ServiceException;
}
