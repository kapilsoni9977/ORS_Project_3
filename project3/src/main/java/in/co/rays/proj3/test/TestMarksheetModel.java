package in.co.rays.proj3.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj3.DTO.CollegeDTO;
import in.co.rays.proj3.DTO.MarksheetDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.model.MarksheetModelHibImp;
import in.co.rays.proj3.model.MarksheetModelInt;

public class TestMarksheetModel {

	public static MarksheetModelInt model = new MarksheetModelHibImp();

	public static void main(String[] args) throws Exception {
//		testAdd();
//		testUpdate();
//	testDelete();
		testFindByPK();
//		testFindByName();
//		testList();
//		testSearch();
	}

	public static void testAdd() throws Exception {

		MarksheetDTO dto = new MarksheetDTO();
		dto.setRollNo("00EC1284");
		dto.setStudentId(3);
		dto.setName("Naman");
		dto.setPhysics(89);
		dto.setChemistry(87);
		dto.setMaths(97);
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		long pk = model.add(dto);
		System.out.println(pk + "data successfully insert");
	}

	public static void testUpdate() throws ParseException, ApplicationException, DuplicateRecordException {
		MarksheetDTO dto = new MarksheetDTO();
		dto.setRollNo("121");
		dto.setStudentId(1);
		dto.setName("");
		dto.setPhysics(60);
		dto.setChemistry(77);
		dto.setMaths(67);
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
		MarksheetDTO dto = new MarksheetDTO();
		dto.setId(2l);
		model.delete(dto);
		System.out.println("Data successfully deleted");
	}

//
////
	public static void testFindByPK() {
		MarksheetDTO dto = new MarksheetDTO();
		try {
			dto = model.fingByPK(3l);
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}
			System.out.println(dto.getRollNo());
			System.out.println(dto.getStudentId());
			System.out.println(dto.getName());
			System.out.println(dto.getPhysics());
			System.out.println(dto.getChemistry());
			System.out.println(dto.getMaths());
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
		MarksheetDTO dto = new MarksheetDTO();
		List list = new ArrayList();
		list = model.list(0, 0);
		if (list.size() < 0) {
			System.out.println("List fail");
		}
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (MarksheetDTO) it.next();
			System.out.println(dto.getRollNo());
			System.out.println(dto.getStudentId());
			System.out.println(dto.getName());
			System.out.println(dto.getPhysics());
			System.out.println(dto.getChemistry());
			System.out.println(dto.getMaths());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

//
	public static void testSearch() throws ApplicationException, RecordNotFoundException {
		MarksheetDTO dto = new MarksheetDTO();
		List list = new ArrayList();
		dto.setName("Damini Borade");
//bean.setId(1l);
		list = model.search(dto, 0, 0);

		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (MarksheetDTO) it.next();
			System.out.println(dto.getRollNo());
			System.out.println(dto.getStudentId());
			System.out.println(dto.getName());
			System.out.println(dto.getPhysics());
			System.out.println(dto.getChemistry());
			System.out.println(dto.getMaths());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

//
	public static void testFindByName() {
		MarksheetDTO dto = new MarksheetDTO();
		try {
			dto = model.findByRollNo("121");
			if (dto == null) {
				System.out.println("Test findByRollNumber is failed");
			}
			System.out.println(dto.getRollNo());
			System.out.println(dto.getStudentId());
			System.out.println(dto.getName());
			System.out.println(dto.getPhysics());
			System.out.println(dto.getChemistry());
			System.out.println(dto.getMaths());
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
