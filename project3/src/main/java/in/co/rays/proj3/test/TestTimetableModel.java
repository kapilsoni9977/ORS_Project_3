package in.co.rays.proj3.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj3.DTO.StudentDTO;
import in.co.rays.proj3.DTO.TimetableDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.model.TimetableModelHibImp;
import in.co.rays.proj3.model.TimetableModelInt;

public class TestTimetableModel {

	public static TimetableModelInt model = new TimetableModelHibImp();

	public static void main(String[] args) throws ParseException, ApplicationException, DuplicateRecordException {
//		testAdd();
		testCourseName();
	}

	public static void testAdd() throws ParseException, ApplicationException, DuplicateRecordException {
		TimetableDTO dto = new TimetableDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		dto.setId(1l);
		dto.setSubjectId(1);
		dto.setCourseId(1);
		dto.setSubjectName("");
		dto.setCourseName("");
		dto.setDescription("Nice");
		dto.setExamDate(sdf.parse("12-12-2012"));
		dto.setSemester("3rd");
		dto.setExamTime("8 am to 11 am");

		model.add(dto);
		System.out.println("Done yr");
	}

//	public static void testDelete() throws ApplicationException {
//		StudentDTO dto = new StudentDTO();
//		dto.setId(1l);
//		model.delete(dto);
//		System.out.println("Data successfully deleted");
//	}
//
//	public static void testUpdate() throws ParseException, ApplicationException, DuplicateRecordException {
//		StudentDTO dto = new StudentDTO();
//		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
//
//		dto.setFirstName("Damini");
//		dto.setLastName("Borade");
//		dto.setEmailId("damini@gmail.com");
//		dto.setMobileNo("9789456512");
//		dto.setCollegeId(2);
//		dto.setDob(sdf.parse("12-01-2020"));
//		dto.setCollegeName("Rays technologies");
//		dto.setId(1l);
//		model.update(dto);
//		System.out.println("data successfully updated");
//	}
//
//	public static void testFindByPK() {
//		StudentDTO dto = new StudentDTO();
//		try {
//			dto = model.findByPK(1l);
//			if (dto == null) {
//				System.out.println("Test findByPK is failed");
//			}
//			System.out.println(dto.getId());
//			System.out.println(dto.getFirstName());
//			System.out.println(dto.getLastName());
//			System.out.println(dto.getEmailId());
//			System.out.println(dto.getMobileNo());
//			System.out.println(dto.getCollegeId());
//			System.out.println(dto.getDob());
//			System.out.println(dto.getCollegeName());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void testFindByLogin() throws ApplicationException {
//		StudentDTO dto = new StudentDTO();
//		try {
//			dto = model.findByEmailId("damini@gmail.com");
//			if (dto == null) {
//				System.out.println("Test Find by Pk fail");
//			}
//			System.out.println(dto.getId());
//			System.out.println(dto.getFirstName());
//			System.out.println(dto.getLastName());
//			System.out.println(dto.getEmailId());
//			System.out.println(dto.getMobileNo());
//			System.out.println(dto.getCollegeId());
//			System.out.println(dto.getDob());
//			System.out.println(dto.getCollegeName());
//			System.out.println(dto.getCreatedBy());
//			System.out.println(dto.getModifiedBy());
//			System.out.println(dto.getCreatedDatetime());
//			System.out.println(dto.getModifiedDatetime());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void testList() throws ApplicationException {
//		StudentDTO dto = new StudentDTO();
//		List list = new ArrayList();
//		list = model.list(0, 0);
//		if (list.size() < 0) {
//			System.out.println("List fail");
//		}
//		Iterator it = list.iterator();
//		while (it.hasNext()) {
//			dto = (StudentDTO) it.next();
//			System.out.println(dto.getId());
//			System.out.println(dto.getFirstName());
//			System.out.println(dto.getLastName());
//			System.out.println(dto.getEmailId());
//			System.out.println(dto.getMobileNo());
//			System.out.println(dto.getCollegeId());
//			System.out.println(dto.getDob());
//			System.out.println(dto.getCollegeName());
//			System.out.println(dto.getCreatedBy());
//			System.out.println(dto.getModifiedBy());
//			System.out.println(dto.getCreatedDatetime());
//			System.out.println(dto.getModifiedDatetime());
//		}
//	}
//
//	public static void testSearch() throws ApplicationException, RecordNotFoundException {
//		StudentDTO dto = new StudentDTO();
//		List list = new ArrayList();
//		dto.setLastName("borade");
////		dto.setId(1l);
//		list = model.search(dto, 0, 0);
//		Iterator it = list.iterator();
//		while (it.hasNext()) {
//			dto = (StudentDTO) it.next();
//			System.out.println(dto.getId());
//			System.out.println(dto.getFirstName());
//			System.out.println(dto.getLastName());
//			System.out.println(dto.getEmailId());
//			System.out.println(dto.getMobileNo());
//			System.out.println(dto.getCollegeId());
//			System.out.println(dto.getDob());
//			System.out.println(dto.getCollegeName());
//			System.out.println(dto.getCreatedBy());
//			System.out.println(dto.getModifiedBy());
//			System.out.println(dto.getCreatedDatetime());
//			System.out.println(dto.getModifiedDatetime());
//		}
//	}

	public static void testCourseName() throws ParseException, ApplicationException, DuplicateRecordException {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		TimetableDTO dto = new TimetableDTO();
//			dto.setCourseId(1);
		dto = model.checkByCourseName(1, sdf.parse("2012-12-12"));
		System.out.println(dto.getId());
		System.out.println(dto.getCourseId());
		System.out.println(dto.getSubjectId());
		System.out.println(dto.getSubjectName());
		System.out.println(dto.getCourseName());
		System.out.println(dto.getDescription());
		System.out.println(dto.getExamTime());
		System.out.println(dto.getExamDate());
	}
}
