package in.co.rays.proj3.model;

import java.util.List;

import in.co.rays.proj3.DTO.CourseDTO;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.ApplicationException;

/**
 * Interface of Course model
 * 
 * @author kapil Soni
 *
 */
public interface CourseModelInt {
	public long add(CourseDTO dto) throws ApplicationException, DuplicateRecordException;

	public void delete(CourseDTO dto) throws ApplicationException;

	public void update(CourseDTO dto) throws ApplicationException, DuplicateRecordException;

	public List list() throws ApplicationException;

	public List list(int pageNo, int pageSize) throws ApplicationException;

	public List search(CourseDTO dto) throws ApplicationException;

	public List search(CourseDTO dto, int pageNo, int pageSize) throws ApplicationException;

	public CourseDTO findByPK(long pk) throws ApplicationException;

	public CourseDTO findByName(String name) throws ApplicationException;
}
