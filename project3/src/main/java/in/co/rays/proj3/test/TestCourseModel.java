package in.co.rays.proj3.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj3.DTO.CourseDTO;
import in.co.rays.proj3.DTO.RoleDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.model.CourseModelHibImp;
import in.co.rays.proj3.model.CourseModelInt;

public class TestCourseModel {
	public static CourseModelInt model = new CourseModelHibImp();

	public static void main(String[] args) throws Exception {
//	testAdd();
//	testUpdate();
//	testDelete();
//		testFindByPK();
//		testFindByName();
//		testSearch();
		testList();
	}

	public static void testAdd() throws Exception {

		CourseDTO dto = new CourseDTO();
		dto.setId(1l);
		dto.setCourseName("C++");
		dto.setDescription("It is oop langauge");
		dto.setDuration("3 months");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		long pk = model.add(dto);
		System.out.println(pk + "data successfully insert");
	}

	public static void testUpdate() throws ParseException, ApplicationException, DuplicateRecordException {
		CourseDTO dto = new CourseDTO();
		dto.setCourseName("C++");
		dto.setDescription("It is oop langauge");
		dto.setDuration("3 months");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		dto.setId(1l);

		model.update(dto);
		System.out.println("data successfully updated");
	}

	public static void testDelete() throws ApplicationException {
		CourseDTO dto = new CourseDTO();
		dto.setId(1l);
		model.delete(dto);
		System.out.println("Data successfully deleted");
	}

//
	public static void testFindByPK() {
		CourseDTO dto = new CourseDTO();
		try {
			dto = model.findByPK(1l);
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}
			System.out.println(dto.getCourseName());
			System.out.println(dto.getDuration());
			System.out.println(dto.getDescription());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//
	public static void testList() throws ApplicationException {
		CourseDTO dto = new CourseDTO();
		List list = new ArrayList();
		list = model.list(0, 0);
		if (list.size() < 0) {
			System.out.println("List fail");
		}
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (CourseDTO) it.next();
			System.out.println(dto.getCourseName());
			System.out.println(dto.getDescription());
			System.out.println(dto.getDuration());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

//
////
//////
	public static void testSearch() throws ApplicationException, RecordNotFoundException {
		CourseDTO dto = new CourseDTO();
		List list = new ArrayList();
		dto.setCourseName("C++");
//bean.setId(1l);
		list = model.search(dto, 0, 0);

		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (CourseDTO) it.next();
			System.out.println(dto.getCourseName());
			System.out.println(dto.getDescription());
			System.out.println(dto.getDuration());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

//
////
//////
	public static void testFindByName() {
		CourseDTO dto = new CourseDTO();
		try {
			dto = model.findByName("C++");
			if (dto == null) {
				System.out.println("Test findByName is failed");
			}
			System.out.println(dto.getCourseName());
			System.out.println(dto.getDescription());
			System.out.println(dto.getDuration());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//

}
