package in.co.rays.proj3.model;

import java.util.HashMap;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import in.co.rays.proj3.DTO.UserDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.util.EmailBuilder;
import in.co.rays.proj3.util.EmailMessage;
import in.co.rays.proj3.util.EmailUtility;
import in.co.rays.proj3.util.HibDataSource;

public class UserModelHibImpl implements UserModelInt {
	public static Logger log = Logger.getLogger(UserModelHibImpl.class);

	public long add(UserDTO dto) throws ApplicationException, DuplicateRecordException {
		long pk = 0;
		UserDTO dtoExist = findByLogin(dto.getLogin());
		if (dtoExist != null) {
			throw new DuplicateRecordException("Login Id Already Exist");
		}
		Session session = HibDataSource.getSession();
		Transaction ts = null;
		try {
			ts = session.beginTransaction();
			session.save(dto);
			pk = dto.getId();
			ts.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			if (ts != null) {
				ts.rollback();
			}
			throw new ApplicationException("Exception in User Add " + e.getMessage());
		} finally {
			session.close();
		}
		log.debug("Model Add Ended");
		return pk;
	}

	public void update(UserDTO dto) throws ApplicationException, DuplicateRecordException {
		log.debug("update of userDto started");
		Session session = HibDataSource.getSession();
		Transaction ts = null;
		try {
			ts = session.beginTransaction();
			session.saveOrUpdate(dto);
			ts.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			if (ts != null) {
				ts.rollback();
			}
			throw new ApplicationException("Exception in User update " + e.getMessage());
		} finally {
			session.close();
		}
		log.debug("userDto update ended");
	}

	public void delete(UserDTO dto) throws ApplicationException {
		Session session = HibDataSource.getSession();
		Transaction ts = null;
		try {
			ts = session.beginTransaction();
			session.delete(dto);
			ts.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			if (ts != null) {
				ts.rollback();
			}
			throw new ApplicationException("Exception in User delete" + e.getMessage());
		} finally {
			session.clear();
		}
	}

	public UserDTO findByLogin(String login) throws ApplicationException {
		log.debug("UserDTO findByLogin started");
		UserDTO dto = null;
		Session session = HibDataSource.getSession();
		try {
			Criteria cr = session.createCriteria(UserDTO.class);
			cr.add(Restrictions.eq("login", login));
			List list = cr.list();
			System.out.println(" List " + list);

			if (list.size() == 1) {
				dto = (UserDTO) list.get(0);
				System.out.println("In 'if' dto= " + dto);
			}
		} catch (HibernateException e) {
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception in getting User by Login " + e.getMessage());
		} finally {
			session.close();
		}
		log.debug("Model findByLoginId End");
		return dto;
	}

	public UserDTO findByPK(long pk) throws ApplicationException {
		log.debug("UserDTO findByPk started");
		UserDTO dto = null;
		Session session = HibDataSource.getSession();
		try {
			dto = (UserDTO) session.get(UserDTO.class, pk);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException("Exception in getting User by Login " + e.getMessage());
		} finally {
			session.close();
		}
		log.debug("Model findByPk ENd");
		return dto;
	}

	public List search(UserDTO dto) throws ApplicationException {

		return search(dto, 0, 0);
	}

	public List search(UserDTO dto, int pageNo, int pageSize) throws ApplicationException {
		log.debug("UserDTO search method started");
		Session session = null;
		List list = null;
		try {
			session = HibDataSource.getSession();
			Criteria cr = session.createCriteria(UserDTO.class);
			if (dto != null) {
				/*
				 * if (dto.getId() > 0) { cr.add(Restrictions.eq("id", dto.getId())); }
				 */
				if (dto.getFirstName() != null && dto.getFirstName().length() > 0) {
					cr.add(Restrictions.like("firstName", dto.getFirstName() + "%"));
				
				}
				if (dto.getLastName() != null && dto.getLastName().length() > 0) {
					cr.add(Restrictions.like("lastName", dto.getLastName() + "%"));
				}
				if (dto.getLogin() != null && dto.getLogin().length() > 0) {
					cr.add(Restrictions.like("login", dto.getLogin() + "%"));
				}
				if (dto.getPassword() != null && dto.getPassword().length() > 0) {
					cr.add(Restrictions.like("password", dto.getPassword() + "%"));
				}
				if (dto.getGender() != null && dto.getGender().length() > 0) {
					cr.add(Restrictions.like("gender", dto.getGender() + "%"));
				}
				if (dto.getDob() != null) {
					cr.add(Restrictions.like("dob", dto.getDob()));
				}
				if (dto.getLastLogin() != null && dto.getLastLogin().getTime() > 0) {
					cr.add(Restrictions.eq("lastLogin", dto.getLastLogin()));
				} 
				if (dto.getRoleId() > 0) {
					cr.add(Restrictions.eq("roleId", dto.getRoleId()));
				}
				if (dto.getUnSuccessfullLogin() > 0) {
					cr.add(Restrictions.eq("unSuccessfulLogin", dto.getUnSuccessfullLogin()));
				}
			}
			if (pageSize > 0) {
				cr.setFirstResult((pageNo - 1) * pageSize);
				cr.setMaxResults(pageSize);
			}

			list = cr.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			log.error("Exception in database", e);
		} finally {
			session.close();
		}
		log.debug("Model search End");
		return list;
	}

	public List list() throws ApplicationException {
		return list(0, 0);
	}

	public List list(int pageNo, int pageSize) throws ApplicationException {
		Session session = null;
		List list = null;
		try {
			session = HibDataSource.getSession();
			Criteria cr = session.createCriteria(UserDTO.class);
			if (pageSize > 0) {
				pageNo = (pageNo - 1) * pageSize;
				cr.setFirstResult(pageNo);
				cr.setMaxResults(pageSize);
			}
			list = cr.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new ApplicationException("Exception: Exception in user list");
		} finally {
			session.close();
		}
		return list;
	}

	public boolean changePassword(Long id, String oldPassword, String newPassword)
			throws RecordNotFoundException, ApplicationException {

		boolean flag = false;
		UserDTO dtoExist = null;
		dtoExist = findByPK(id);
		System.out.println("in change password method " + dtoExist.getPassword() + "jjjjjjj" + oldPassword);
		if (dtoExist != null && dtoExist.getPassword().equals(oldPassword)) {
			dtoExist.setPassword(newPassword);
			try {
				update(dtoExist);
			} catch (DuplicateRecordException e) {
				throw new ApplicationException("LoginId is already exist");
			}
			flag = true;
		} else {
			throw new RecordNotFoundException("Login not exist");
		}
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("login", dtoExist.getLogin());
		map.put("password", dtoExist.getPassword());
		map.put("firstName", dtoExist.getFirstName());
		map.put("lastName", dtoExist.getLastName());

		String message = EmailBuilder.getChangePasswordMessage(map);

		EmailMessage msg = new EmailMessage();

		msg.setTo(dtoExist.getLogin());
		msg.setSubject("Password has been changed Successfully.");
		msg.setMessage(message);
		msg.setMessageType(EmailMessage.HTML_MSG);

		EmailUtility.sendMail(msg);

		return flag;
	}

	public UserDTO authenticate(String login, String password) throws ApplicationException {
		System.out.println("Login: " + login + "  password: " + password);
		Session session = HibDataSource.getSession();
		UserDTO dto = null;
		Query q = session.createQuery("from UserDTO where login=? and password=? ");
		q.setString(0, login);
		q.setString(1, password);
		List list = q.list();
		System.out.println("List " + list);
		if (list.size() > 0) {
			dto = (UserDTO) list.get(0);
			System.out.println("In if dto= " + dto);
		} else {
			dto = null;
		}
		return dto;
	}

	public boolean lock(String login) throws RecordNotFoundException, ApplicationException {
		return false;
	}

	public List getRoles(UserDTO dto) throws ApplicationException {
		return null;
	}

	public UserDTO updateAccess(UserDTO dto) throws ApplicationException, DuplicateRecordException {
		return null;
	}

	public long registerUser(UserDTO dto) throws ApplicationException, DuplicateRecordException {
		long pk = add(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login", dto.getLogin());
		map.put("password", dto.getPassword());
		String message = EmailBuilder.getUserRegistrationMessage(map);
		EmailMessage msg = new EmailMessage();
		msg.setTo(dto.getLogin());
		msg.setSubject("Registration is successful for ORS Project RAYS Technologies");
		msg.setMessage(message);
		msg.setMessageType(EmailMessage.HTML_MSG);
		EmailUtility.sendMail(msg);
		return pk;
	}

	public boolean resetPassword(UserDTO dto) throws ApplicationException {

		return false;
	}

	public boolean forgetPassword(String login) throws ApplicationException, RecordNotFoundException {
		UserDTO dto = findByLogin(login);
		boolean flag = false;
		if (dto == null) {
			throw new RecordNotFoundException("Email Id Does not matched.");
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login", dto.getLogin());
		map.put("password", dto.getPassword());
		map.put("firstName", dto.getFirstName());
		map.put("lastName", dto.getLastName());
		String message = EmailBuilder.getForgetPasswordMessage(map);
		EmailMessage msg = new EmailMessage();
		msg.setTo(login);
		msg.setSubject("RAYS ORS Password reset");
		msg.setMessage(message);
		msg.setMessageType(EmailMessage.HTML_MSG);
		EmailUtility.sendMail(msg);
		flag = true;
		return flag;
	}
}
