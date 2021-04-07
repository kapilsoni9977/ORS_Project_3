package in.co.rays.proj3.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj3.DTO.CollegeDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.model.CollegeModelHibImp;
import in.co.rays.proj3.model.CollegeModelInt;

public class TestCollegeModel {

	public static CollegeModelInt model = new CollegeModelHibImp();

	public static void main(String[] args) throws Exception {
//	testAdd();
//	testUpdate();
//	testDelete();
//		testFindByPK();
//	testList();
		testSearch();
	}

	public static void testAdd() throws Exception {

		CollegeDTO dto = new CollegeDTO();

		dto.setName("Teerath bai kalachand");
		dto.setAddress("Palsikar");
		dto.setCity("Indore");
		dto.setState("Madhya pradesh");
		dto.setPhoneNo("9696323212");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		long pk = model.add(dto);
		System.out.println(pk + "data successfully insert");
	}

	public static void testUpdate() throws ParseException, ApplicationException, DuplicateRecordException {
		CollegeDTO dto = new CollegeDTO();
		dto.setName("Teerath bai kalachand");
		dto.setAddress("Palsikar Colony");
		dto.setCity("Indore");
		dto.setState("Madhya pradesh");
		dto.setPhoneNo("9696323212");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		dto.setId(1l);

		model.update(dto);
		System.out.println("data successfully updated");
	}

	public static void testDelete() throws ApplicationException {
		CollegeDTO dto = new CollegeDTO();
		dto.setId(1l);
		model.delete(dto);
		System.out.println("Data successfully deleted");
	}

//
	public static void testFindByPK() {
		CollegeDTO dto = new CollegeDTO();
		try {
			dto = model.findByPK(1l);
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}
			System.out.println(dto.getId());
			System.out.println(dto.getName());
			System.out.println(dto.getAddress());
			System.out.println(dto.getCity());
			System.out.println(dto.getState());
			System.out.println(dto.getPhoneNo());
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
		CollegeDTO dto = new CollegeDTO();
		List list = new ArrayList();
		list = model.list(0, 0);
		if (list.size() < 0) {
			System.out.println("List fail");
		}
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (CollegeDTO) it.next();
			System.out.println(dto.getId());
			System.out.println(dto.getName());
			System.out.println(dto.getAddress());
			System.out.println(dto.getCity());
			System.out.println(dto.getState());
			System.out.println(dto.getPhoneNo());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

	public static void testSearch() throws ApplicationException, RecordNotFoundException {
		CollegeDTO dto = new CollegeDTO();
		List list = new ArrayList();
		dto.setName("Teerath bai kalachand");
//	bean.setId(1l);
		list = model.search(dto, 0, 0);

		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (CollegeDTO) it.next();
			System.out.println(dto.getId());
			System.out.println(dto.getName());
			System.out.println(dto.getAddress());
			System.out.println(dto.getCity());
			System.out.println(dto.getState());
			System.out.println(dto.getPhoneNo());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

	public static void testFindByName() {
		CollegeDTO dto = new CollegeDTO();
		try {
			dto = model.fingByName("Teerath bai kalachand");
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}
			System.out.println(dto.getId());
			System.out.println(dto.getName());
			System.out.println(dto.getAddress());
			System.out.println(dto.getCity());
			System.out.println(dto.getState());
			System.out.println(dto.getPhoneNo());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
