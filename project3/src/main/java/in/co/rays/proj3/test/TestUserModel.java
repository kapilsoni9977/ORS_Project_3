package in.co.rays.proj3.test;

import in.co.rays.proj3.DTO.UserDTO;

import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.exception.RecordNotFoundException;
import in.co.rays.proj3.model.UserModelHibImpl;
import in.co.rays.proj3.model.UserModelInt;
import in.co.rays.proj3.model.UserModelJDBCImpl;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class TestUserModel {
	/**
	 * Model object to test
	 */
	public static UserModelInt model = new UserModelHibImpl();

//    public static UserModelInt model = new UserModelJDBCImpl();
	/**
	 * Main method to call test methods.
	 * 
	 * @param args
	 * @throws Exception
	 * @throws ParseException
	 */
	public static void main(String[] args) throws Exception {
         testAdd();
//		testDelete();
//		testUpdate();
//		 testFindByPK();
//		testFindByLogin();
//		testSearch();
//		 testList();
		// testGetRoles();
//		 testAuthenticate();
//		 testchangePassword();
//		testRegisterUser();
//		 testforgetPassword();
//        testresetPassword();
	}

	/**
	 * Tests add a User
	 * 
	 * @throws ParseException
	 */
	public static void testAdd() throws Exception {

		UserDTO dto = new UserDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		dto.setFirstName("Ajay");
		dto.setLastName("Meena");
		dto.setLogin("Ajay@gmail.com");
		dto.setPassword("1234");
		dto.setConfirmPassword("1234");
		dto.setDob(sdf.parse("30-05-1995"));
		dto.setMobileNo("9406653787");
		dto.setUnSuccessfullLogin(2);
		dto.setGender("male");
		dto.setRoleId(1);
		dto.setLastLogin(new Timestamp(new Date().getTime()));
		dto.setRegisteredIP("Kapil1@gmail.com");
		dto.setLoginIP("naman212@gmail.com");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		long pk = model.add(dto);
		System.out.println(pk + "data successfully insert");
	}

	public static void testUpdate() throws ParseException, ApplicationException, DuplicateRecordException {
		UserDTO dto = new UserDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		dto.setFirstName("Mayank");
		dto.setLastName("Mishra");
		dto.setLogin("Kapil@gmail.com");
		dto.setPassword("1234");
		dto.setConfirmPassword("1234");
		dto.setDob(sdf.parse("30-05-1995"));
		dto.setMobileNo("9406653787");
		dto.setUnSuccessfullLogin(2);
		dto.setGender("male");
		dto.setRoleId(1);
		dto.setLastLogin(new Timestamp(new Date().getTime()));
		dto.setRegisteredIP("Kapil1@gmail.com");
		dto.setLoginIP("naman212@gmail.com");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		dto.setId(2l);

		model.update(dto);
		System.out.println("data successfully updated");
	}

	public static void testDelete() throws ApplicationException {
		UserDTO dto = new UserDTO();
		dto.setId(4l);
		model.delete(dto);
		System.out.println("Data successfully deleted");
	}

	public static void testFindByLogin() throws ApplicationException {
		UserDTO dto = new UserDTO();
		try {
			dto = model.findByLogin("Kapil2@gmail.com");
			if (dto == null) {
				System.out.println("Test Find by Pk fail");
			}
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getLogin());
			System.out.println(dto.getPassword());
			System.out.println(dto.getConfirmPassword());
			System.out.println(dto.getDob());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getUnSuccessfullLogin());
			System.out.println(dto.getGender());
			System.out.println(dto.getRoleId());
			System.out.println(dto.getLastLogin());
			System.out.println(dto.getRegisteredIP());
			System.out.println(dto.getLoginIP());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testFindByPK() {
		UserDTO dto = new UserDTO();
		try {
			dto = model.findByPK(2l);
			if (dto == null) {
				System.out.println("Test findByPK is failed");
			}
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getLogin());
			System.out.println(dto.getPassword());
			System.out.println(dto.getConfirmPassword());
			System.out.println(dto.getDob());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getUnSuccessfullLogin());
			System.out.println(dto.getGender());
			System.out.println(dto.getRoleId());
			System.out.println(dto.getLastLogin());
			System.out.println(dto.getRegisteredIP());
			System.out.println(dto.getLoginIP());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testList() throws ApplicationException {
		UserDTO dto = new UserDTO();
		List list = new ArrayList();
		list = model.list(0, 0);
		if (list.size() < 0) {
			System.out.println("List fail");
		}
		Iterator it = list.iterator();
		while (it.hasNext()) {
			dto = (UserDTO) it.next();
			System.out.println(dto.getId());
			System.out.println(dto.getFirstName());
			System.out.println(dto.getLastName());
			System.out.println(dto.getLogin());
			System.out.println(dto.getPassword());
			System.out.println(dto.getConfirmPassword());
			System.out.println(dto.getDob());
			System.out.println(dto.getMobileNo());
			System.out.println(dto.getUnSuccessfullLogin());
			System.out.println(dto.getGender());
			System.out.println(dto.getRoleId());
			System.out.println(dto.getLastLogin());
			System.out.println(dto.getRegisteredIP());
			System.out.println(dto.getLoginIP());
			System.out.println(dto.getCreatedBy());
			System.out.println(dto.getModifiedBy());
			System.out.println(dto.getCreatedDatetime());
			System.out.println(dto.getModifiedDatetime());
		}
	}

	public static void testAuthenticate() throws ApplicationException {
		UserDTO dto = new UserDTO();
		dto = model.authenticate("Kapil2@gmail.com", "1234");
		if (dto == null) {
			System.out.println("Authentication failed");
		}
		System.out.println(dto.getId());
		System.out.println(dto.getFirstName());
		System.out.println(dto.getLastName());
		System.out.println(dto.getLogin());
		System.out.println(dto.getPassword());
		System.out.println(dto.getConfirmPassword());
		System.out.println(dto.getDob());
		System.out.println(dto.getMobileNo());
		System.out.println(dto.getUnSuccessfullLogin());
		System.out.println(dto.getGender());
		System.out.println(dto.getRoleId());
		System.out.println(dto.getLastLogin());
		System.out.println(dto.getRegisteredIP());
		System.out.println(dto.getLoginIP());
		System.out.println(dto.getCreatedBy());
		System.out.println(dto.getModifiedBy());
		System.out.println(dto.getCreatedDatetime());
		System.out.println(dto.getModifiedDatetime());
	}

	public static void testRegisterUser() throws ParseException, ApplicationException, DuplicateRecordException {
		UserDTO dto = new UserDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		dto.setFirstName("Aman");
		dto.setLastName("Sharma");
		dto.setLogin("kapilsoni9933@gmail.com");
		dto.setPassword("Aman@1234");
		dto.setConfirmPassword("Aman@1234");
		dto.setDob(sdf.parse("10-01-1911"));
		dto.setMobileNo("9098909890");
		dto.setUnSuccessfullLogin(2);
		dto.setGender("male");
		dto.setRoleId(1);
		dto.setLastLogin(new Timestamp(new Date().getTime()));
		dto.setRegisteredIP("Naveen121en@gmail.com");
		dto.setLoginIP("N212@gmail.com");
		dto.setCreatedBy("admin");
		dto.setModifiedBy("admin");
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		long pk = model.registerUser(dto);
		System.out.println(pk + "data successfully insert");

	}

	public static void testforgetPassword() throws ApplicationException, RecordNotFoundException {
		model.forgetPassword("kapilsoni9933@gmail.com");
	}

	public static void testchangePassword() throws ApplicationException, RecordNotFoundException {
		model.changePassword(1l, "Aman@1234", "Aman@123456");
	}

	public static void testSearch() throws ApplicationException, RecordNotFoundException {
		UserDTO bean = new UserDTO();
		List list = new ArrayList();
		bean.setLastName("Sharma");
//		bean.setId(1l);
		list = model.search(bean, 0, 0);

		Iterator it = list.iterator();
		while (it.hasNext()) {
			bean = (UserDTO) it.next();
			System.out.println(bean.getId());
			System.out.println(bean.getFirstName());
			System.out.println(bean.getLastName());
			System.out.println(bean.getLogin());
			System.out.println(bean.getPassword());
			System.out.println(bean.getDob());
			System.out.println(bean.getRoleId());
			System.out.println(bean.getUnSuccessfullLogin());
			System.out.println(bean.getGender());
			System.out.println(bean.getLastLogin());
		}
	}
}