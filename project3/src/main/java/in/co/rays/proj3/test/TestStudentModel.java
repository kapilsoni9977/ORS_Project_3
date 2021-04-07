package in.co.rays.proj3.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj3.DTO.StudentDTO;
import in.co.rays.proj3.DTO.UserDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.model.StudentModelHibImp;
import in.co.rays.proj3.model.StudentModelInt;
import in.co.rays.proj3.model.UserModelHibImpl;
import in.co.rays.proj3.model.UserModelInt;

public class TestStudentModel {

	public static StudentModelInt model = new StudentModelHibImp();

	public static void main(String[] args)
			throws ParseException, ApplicationException, DuplicateRecordException, RecordNotFoundException {
		testAdd();
//		testDelete();
//		testUpdate();
//		testFindByPK();
//		testFindByLogin();
//		testList();
//		testSearch();
	}

	public static void testAdd() throws ParseException, ApplicationException, DuplicateRecordException {
		StudentDTO dto = new StudentDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		dto.setId(5l);
		dto.setFirstName("Tarak");
		dto.setLastName("Mehta");
		dto.setEmailId("Tarak@gmail.com");
		dto.setMobileNo("9789456512");
		dto.setCollegeId(2);
		dto.setDob(sdf.parse("12-01-2020"));
		dto.setCollegeName("Rays technologies");
		model.add(dto);
		System.out.println("Done yr");
	}

	public static void testDelete() throws ApplicationException {
		StudentDTO dto = new StudentDTO();
		dto.setId(1l);
		model.delete(dto);
		System.out.println("Data successfully deleted");
	}

	public static void testUpdate() throws ParseException, ApplicationException, DuplicateRecordException {
		StudentDTO dto = new StudentDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		dto.setFirstName("Damini");
		dto.setLastName("Borade");
		dto.setEmailId("damini@gmail.com");
		dto.setMobileNo("9789456512");
		dto.setCollegeId(2);
		dto.setDob(sdf.parse("12-01-2020"));
		dto.setCollegeName("Rays technologies");
		dto.setId(1l);
		model.update(dto);
		System.out.println("data successfully updated");
	}

	public static void testFindByPK() {
		StudentDTO dto = new StudentDTO();
		try {
			dto = model.findByPK(1l);
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getEmailId());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getCollegeId());
			System.out.println(dto.getDob());
			System.out.println(dto.getCollegeName());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testFindByLogin() throws ApplicationException {
		StudentDTO dto = new StudentDTO();
		try {
			dto = model.findByEmailId("damini@gmail.com");
			if (dto == null) {
				System.out.println("Test Find by Pk fail");
			}
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getEmailId());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getCollegeId());
			System.out.println(dto.getDob());
			System.out.println(dto.getCollegeName());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testList() throws ApplicationException {
		StudentDTO dto = new StudentDTO();
		List list = new ArrayList();
		list = model.list();
		if (list.size() < 0) {
			System.out.println("List fail");
		}
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (StudentDTO) it.next();
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getEmailId());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getCollegeId());
			System.out.println(dto.getDob());
			System.out.println(dto.getCollegeName());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

	public static void testSearch() throws ApplicationException, RecordNotFoundException {
		StudentDTO dto = new StudentDTO();
		List list = new ArrayList();
		dto.setLastName("borade");
//		dto.setId(1l);
		list = model.search(dto, 0, 0);
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (StudentDTO) it.next();
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getEmailId());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getCollegeId());
			System.out.println(dto.getDob());
			System.out.println(dto.getCollegeName());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

}
