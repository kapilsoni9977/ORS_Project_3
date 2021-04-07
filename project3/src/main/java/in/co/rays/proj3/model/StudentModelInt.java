package in.co.rays.proj3.model;

import java.util.List;

import in.co.rays.proj3.DTO.StudentDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;

/**
 * Interface of Student model
 * 
 * @author Kapil Soni
 *
 */
public interface StudentModelInt {
	public long add(StudentDTO dto) throws ApplicationException, DuplicateRecordException;

	public void delete(StudentDTO dto) throws ApplicationException;

	public void update(StudentDTO dto) throws ApplicationException, DuplicateRecordException;

	public List list() throws ApplicationException;

	public List list(int pageNo, int pageSize) throws ApplicationException;

	public List search(StudentDTO dto) throws ApplicationException;

	public List search(StudentDTO dto, int pageNo, int pageSize) throws ApplicationException;

	public StudentDTO findByPK(long pk) throws ApplicationException;

	public StudentDTO findByEmailId(String emailId) throws ApplicationException;
}
