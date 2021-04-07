package in.co.rays.proj3.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj3.DTO.RoleDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.model.RoleModelHibImp;
import in.co.rays.proj3.model.RoleModelInt;

public class TestRoleModel {
	public static RoleModelInt model = new RoleModelHibImp();

	public static void main(String[] args) throws Exception {
//	testAdd();
//		testUpdate();
//		testDelete();
//		testList();
//		testSearch();
//		testFindByName();
		testFindByPK();
	}

	public static void testAdd() throws Exception {

		RoleDTO dto = new RoleDTO();
		dto.setId(1l);
		dto.setName("admin");
		dto.setDescription("Admin");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		long pk = model.add(dto);
		System.out.println(pk + "data successfully insert");
	}

	public static void testUpdate() throws ParseException, ApplicationException, DuplicateRecordException {
		RoleDTO dto = new RoleDTO();
		dto.setName("Student");
		dto.setDescription("Student");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		dto.setId(1l);

		model.update(dto);
		System.out.println("data successfully updated");
	}

////
	public static void testDelete() throws ApplicationException {
		RoleDTO dto = new RoleDTO();
		dto.setId(1l);
		model.delete(dto);
		System.out.println("Data successfully deleted");
	}

	public static void testFindByPK() {
		RoleDTO dto = new RoleDTO();
		try {
			dto = model.findByPK(1l);
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}
			System.out.println(dto.getName());
			System.out.println(dto.getDescription());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testList() throws ApplicationException {
		RoleDTO dto = new RoleDTO();
		List list = new ArrayList();
		list = model.list(0, 0);
		if (list.size() < 0) {
			System.out.println("List fail");
		}
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (RoleDTO) it.next();
			System.out.println(dto.getName());
			System.out.println(dto.getDescription());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

//
////
	public static void testSearch() throws ApplicationException, RecordNotFoundException {
		RoleDTO dto = new RoleDTO();
		List list = new ArrayList();
		dto.setName("admin");
//bean.setId(1l);
		list = model.search(dto, 0, 0);

		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (RoleDTO) it.next();
			System.out.println(dto.getName());
			System.out.println(dto.getDescription());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

//
////
	public static void testFindByName() {
		RoleDTO dto = new RoleDTO();
		try {
			dto = model.findByName("admin");
			if (dto == null) {
				System.out.println("Test findByName is failed");
			}
			System.out.println(dto.getName());
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

}
