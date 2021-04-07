package in.co.rays.proj3.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj3.DTO.CollegeDTO;
import in.co.rays.proj3.DTO.FacultyDTO;
import in.co.rays.proj3.DTO.SubjectDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DatabaseException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.model.FacultyModelHibImp;
import in.co.rays.proj3.model.FacultyModelInt;

public class TestFacultyModel {

	public static FacultyModelInt model = new FacultyModelHibImp();

	public static void main(String[] args) throws Exception {
//		testAdd();
//		testUpdate();
//		testDelete();
//		testList();
		testSearch();
//		testFindByPK();
//		testFindByEmail();
	}

	public static void testAdd() throws Exception {

		FacultyDTO dto = new FacultyDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		dto.setId(1l);
		dto.setFirstName("Vinay");
		dto.setLastName("Sharma");
		dto.setGender("Male");
		dto.setQualification("PHD");
		dto.setMobileNo("9856236598");
		dto.setEmailId("Vinay121@gmail.com");
		dto.setDob(sdf.parse("12-01-1990"));
		dto.setCollegeId(1);
		dto.setCourseId(1);
		dto.setSubjectId(1);
		dto.setCollegeName("NSP");
		dto.setCourseName("Java");
		dto.setSubjectName("BCA");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));

		long pk = model.add(dto);
		System.out.println(pk + "data successfully insert");
	}

	public static void testUpdate()
			throws ParseException, ApplicationException, DuplicateRecordException, DatabaseException {

		FacultyDTO dto = new FacultyDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		dto.setFirstName("Kapil");
		dto.setLastName("Soni");
		dto.setGender("Male");
		dto.setQualification("D.ED");
		dto.setMobileNo("9856236598");
		dto.setEmailId("kapil@gmail.com");
		dto.setDob(sdf.parse("12-01-1990"));
		dto.setCollegeId(1);
		dto.setCourseId(1);
		dto.setSubjectId(1);
		dto.setCollegeName("NSP");
		dto.setCourseName("C++");
		dto.setSubjectName("BCA");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		dto.setId(1l);

		model.update(dto);
		System.out.println("data successfully updated");
	}

//
	public static void testDelete() throws ApplicationException {
		FacultyDTO dto = new FacultyDTO();
		dto.setId(2l);
		model.delete(dto);
		System.out.println("Data successfully deleted");
	}

//
	public static void testFindByPK() {
		FacultyDTO dto = new FacultyDTO();
		try {
			dto = model.findByPK(1l);
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getGender());
			System.out.println(dto.getQualification());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getEmailId());
			System.out.println(dto.getDob());
			System.out.println(dto.getCollegeId());
			System.out.println(dto.getCourseId());
			System.out.println(dto.getSubjectId());
			System.out.println(dto.getCollegeName());
			System.out.println(dto.getCourseName());
			System.out.println(dto.getSubjectName());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//
////
	public static void testList() throws ApplicationException {
		FacultyDTO dto = new FacultyDTO();
		List list = new ArrayList();
		list = model.list(0, 0);
		if (list.size() < 0) {
			System.out.println("List fail");
		}
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (FacultyDTO) it.next();
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getGender());
			System.out.println(dto.getQualification());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getEmailId());
			System.out.println(dto.getDob());
			System.out.println(dto.getCollegeId());
			System.out.println(dto.getCourseId());
			System.out.println(dto.getSubjectId());
			System.out.println(dto.getCollegeName());
			System.out.println(dto.getCourseName());
			System.out.println(dto.getSubjectName());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

//
	public static void testSearch() throws ApplicationException, RecordNotFoundException {
		FacultyDTO dto = new FacultyDTO();
		List list = new ArrayList();
		dto.setFirstName("Kapil");
//		dto.setCollegeName("NSP");
		dto.setId(1l);
		list = model.search(dto, 0, 0);
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (FacultyDTO) it.next();
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getGender());
			System.out.println(dto.getQualification());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getEmailId());
			System.out.println(dto.getDob());
			System.out.println(dto.getCollegeId());
			System.out.println(dto.getCourseId());
			System.out.println(dto.getSubjectId());
			System.out.println(dto.getCollegeName());
			System.out.println(dto.getCourseName());
			System.out.println(dto.getSubjectName());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

//
	public static void testFindByEmail() {
		FacultyDTO dto = new FacultyDTO();
		try {
//			dto = model.findByPK("kapil");
			dto = model.findByEmailId("Vinay@gmail.com");
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}

			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getGender());
			System.out.println(dto.getQualification());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getEmailId());
			System.out.println(dto.getDob());
			System.out.println(dto.getCollegeId());
			System.out.println(dto.getCourseId());
			System.out.println(dto.getSubjectId());
			System.out.println(dto.getCollegeName());
			System.out.println(dto.getCourseName());
			System.out.println(dto.getSubjectName());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
