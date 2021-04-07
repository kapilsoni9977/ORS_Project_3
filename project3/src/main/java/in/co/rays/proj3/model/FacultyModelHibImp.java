package in.co.rays.proj3.model;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import in.co.rays.proj3.DTO.CollegeDTO;
import in.co.rays.proj3.DTO.CourseDTO;
import in.co.rays.proj3.DTO.FacultyDTO;
import in.co.rays.proj3.DTO.SubjectDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DatabaseException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.util.HibDataSource;

public class FacultyModelHibImp implements FacultyModelInt {

	
	public static Logger log=Logger.getLogger(FacultyModelHibImp.class);
	
	public long add(FacultyDTO dto) throws ApplicationException, DuplicateRecordException {
		 log.debug("Model add Started");
       FacultyDTO dtoExist=findByEmailId(dto.getEmailId());
       System.out.println("............EmailId in model........."+dtoExist.getEmailId());
        CollegeModelInt collegeModel=ModelFactory.getInstance().getCollegeModel();
        CourseModelInt courseModel=ModelFactory.getInstance().getCourseModel();
        SubjectModelInt subjectModel=ModelFactory.getInstance().getSubjectModel();
        
        CollegeDTO collegeDTO=collegeModel.findByPK(dto.getCollegeId());
        CourseDTO courseDTO=courseModel.findByPK(dto.getCourseId());
        SubjectDTO subjectDTO=subjectModel.findByPK(dto.getSubjectId());
        
        dto.setCollegeName(collegeDTO.getName());
        dto.setCourseName(courseDTO.getCourseName());
        dto.setSubjectName(subjectDTO.getSubjectName());
        
        System.out.println("sss"+dto.getCollegeName());
        System.out.println("sss"+dto.getCourseName());
        System.out.println("sss"+dto.getSubjectName());
        
		/*
		 * if(dtoExist!=null){ throw new
		 * DuplicateRecordException("Faculty already Exist"); }
		 */
		 long pk=0;
		 Session session=null;
		 Transaction transaction =null;
		 try{
			 session=HibDataSource.getSession();
			 transaction=session.beginTransaction();
			 session.save(dto);
			 pk=dto.getId();
		     transaction.commit();
			}catch(HibernateException e){
				log.error("Database Exception..", e);
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            throw new ApplicationException("Exception in Faculty Add "
	                    + e.getMessage());
	        } finally {
	            session.close();
	        }

	        log.debug("Model add End");
		
		return dto.getId();

		}

	public void delete(FacultyDTO dto) throws ApplicationException {
		Session session = null;
		Transaction ts = null;
		try {
			session = HibDataSource.getSession();
			ts = session.beginTransaction();
			session.delete(dto);
			ts.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			if (ts != null) {
				ts.rollback();
			}
			throw new ApplicationException("Exception in faulty delete " + e.getMessage());
		} finally {
			session.close();
		}
	}

	public void update(FacultyDTO dto) throws ApplicationException, DatabaseException {
		Session session = HibDataSource.getSession();
		Transaction ts = null;
		try {
			ts = session.beginTransaction();
			session.update(dto);
			ts.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			if (ts != null) {
				ts.rollback();
			}
			throw new ApplicationException("Exception in faculty update " + e.getMessage());
		} finally {
			session.close();
		}
	}

	public List list() throws ApplicationException {
		// TODO Auto-generated method stub
		return list(0, 0);
	}

	public List list(int pageNo, int pageSize) throws ApplicationException {
		Session session = HibDataSource.getSession();
		Transaction ts = null;
		List list = null;
		try {
			ts = session.beginTransaction();
			Criteria criteria = session.createCriteria(FacultyDTO.class);
			if (pageSize > 0) {
				pageNo = ((pageNo - 1) * pageSize) + 1;
				criteria.setFirstResult(pageNo);
				criteria.setMaxResults(pageSize);
			}
			list = criteria.list();
		} catch (HibernateException e) {
			throw new ApplicationException("Exception: Exception in Faculty List");
		} finally {
			session.close();
		}
		return list;
	}

	public List search(FacultyDTO dto) throws ApplicationException {
		return search(dto, 0, 0);
	}

	public List search(FacultyDTO dto, int pageNo, int pageSize) throws ApplicationException {

		Session session = null;
		Transaction  ts = null;
		List list = null;
		try {
			session = HibDataSource.getSession();
			ts = session.beginTransaction();
			Criteria cr = session.createCriteria(FacultyDTO.class);
			if (dto != null) {
				if (dto.getId() > 0) {
					cr.add(Restrictions.eq("id", dto.getId()));
				}
				if (dto.getFirstName() != null && dto.getFirstName().length() > 0) {
					cr.add(Restrictions.like("firstName", dto.getFirstName() + "%"));
				}
				if (dto.getLastName() != null && dto.getLastName().length() > 0) {
					cr.add(Restrictions.like("lastName", dto.getLastName() + "%"));
				}
				if (dto.getEmailId() != null && dto.getEmailId().length() > 0) {
					cr.add(Restrictions.like("emailId", dto.getEmailId() + "%"));
				}
				if (dto.getCollegeId() > 0) {
					cr.add(Restrictions.eq("collegeId", dto.getCollegeId() + "%"));
				}
				if (dto.getCourseId() > 0) {
					cr.add(Restrictions.eq("courseId", dto.getCourseId()));
				}
				if (dto.getSubjectId() > 0) {
					cr.add(Restrictions.eq("subjectId", dto.getSubjectId()));
				}
			}
			// if page size is greater than zero the apply pagination
			if (pageSize > 0) {
				cr.setFirstResult((pageNo - 1) * pageSize);
				cr.setMaxResults(pageSize);
			}
			list = cr.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new ApplicationException("Exception in course search");
		} finally {
			session.close();
		}
		return list;
	}

	public FacultyDTO findByPK(long pk) throws ApplicationException {
		Session session=null;
		FacultyDTO dto=null;
		try {
			session=HibDataSource.getSession();
			dto=(FacultyDTO) session.get(FacultyDTO.class, pk);
		}catch(HibernateException e) {
			e.printStackTrace();
			throw new ApplicationException("Exception : Exception in getting course by pk");
		}finally {
			session.close();
		}
		return dto;
	}

	public FacultyDTO findByEmailId(String emailId) throws ApplicationException {
		Session session=null;
		FacultyDTO dto=new FacultyDTO();
		try {
			session=HibDataSource.getSession();
			Criteria cr=session.createCriteria(FacultyDTO.class);
			cr.add(Restrictions.eq("emailId", emailId));
			List list=cr.list();
			if(list.size()==1) {
			dto=(FacultyDTO) list.get(0);
			}
		}catch(HibernateException e) {
			e.printStackTrace();
			throw new ApplicationException("Exception : Exception in getting course by pk");
		}
		return dto;
	}

}
