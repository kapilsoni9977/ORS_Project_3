package in.co.rays.proj3.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj3.DTO.StudentDTO;
import in.co.rays.proj3.DTO.SubjectDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.model.SubjectModelHibImp;
import in.co.rays.proj3.model.SubjectModelInt;

public class TestSubjectModel {

	public static SubjectModelInt model = new SubjectModelHibImp();

	public static void main(String[] args)
			throws ParseException, ApplicationException, DuplicateRecordException, RecordNotFoundException {
//		testAdd();
//		testUpdate();
//		testDelete();
//		testList();
//		testSearch();
//		testFindByName();
		testFindByPK();
	}

	public static void testAdd() throws ParseException, ApplicationException, DuplicateRecordException {
		SubjectDTO dto = new SubjectDTO();
		dto.setId(1l);
		dto.setSubjectId(1);
		dto.setCourseId(1);
		dto.setSubjectName("");
		dto.setCourseName("");
		dto.setDescription("ffufufufu");
		model.add(dto);
		System.out.println("Done yr");
	}

	public static void testDelete() throws ApplicationException {
		SubjectDTO dto = new SubjectDTO();
		dto.setId(1l);
		model.delete(dto);
		System.out.println("Data successfully deleted");
	}

//
	public static void testUpdate() throws ParseException, ApplicationException, DuplicateRecordException {
		SubjectDTO dto = new SubjectDTO();

		dto.setSubjectId(1);
		dto.setCourseId(1);
		dto.setSubjectName("J++P--");
		dto.setCourseName("BCA");
		dto.setDescription("ffufufufu");
		dto.setId(1l);
		model.update(dto);
		System.out.println("data successfully updated");
	}

//
	public static void testFindByPK() {
		SubjectDTO dto = new SubjectDTO();
		try {
			dto = model.findByPK(1l);
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}
			System.out.println(dto.getId());
			System.out.println(dto.getCourseId());
			System.out.println(dto.getCourseName());
			System.out.println(dto.getSubjectId());
			System.out.println(dto.getSubjectName());
			System.out.println(dto.getDescription());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//
	public static void testFindByName() throws ApplicationException {
		SubjectDTO dto = new SubjectDTO();
		try {
			dto = model.findByName("J++P--");
			if (dto == null) {
				System.out.println("Test Find by Pk fail");
			}
			System.out.println(dto.getId());
			System.out.println(dto.getCourseId());
			System.out.println(dto.getCourseName());
			System.out.println(dto.getSubjectId());
			System.out.println(dto.getSubjectName());
			System.out.println(dto.getDescription());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//
	public static void testList() throws ApplicationException {
		SubjectDTO dto = new SubjectDTO();
		List list = new ArrayList();
		list = model.list(0, 0);
		if (list.size() < 0) {
			System.out.println("List fail");
		}
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (SubjectDTO) it.next();
			System.out.println(dto.getId());
			System.out.println(dto.getCourseId());
			System.out.println(dto.getCourseName());
			System.out.println(dto.getSubjectId());
			System.out.println(dto.getSubjectName());
			System.out.println(dto.getDescription());
		}
	}

//
	public static void testSearch() throws ApplicationException, RecordNotFoundException {
		SubjectDTO dto = new SubjectDTO();
		List list = new ArrayList();
		dto.setCourseId(1);
//		dto.setId(1l);
		list = model.search(dto, 0, 0);
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (SubjectDTO) it.next();
			System.out.println(dto.getId());
			System.out.println(dto.getCourseId());
			System.out.println(dto.getCourseName());
			System.out.println(dto.getSubjectId());
			System.out.println(dto.getSubjectName());
			System.out.println(dto.getDescription());
		}
	}

}
