package in.co.rays.proj3.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.proj3.DTO.BaseDTO;
import in.co.rays.proj3.DTO.TimetableDTO;
import in.co.rays.proj3.exception.ApplicationException;
import in.co.rays.proj3.exception.DatabaseException;
import in.co.rays.proj3.exception.DuplicateRecordException;
import in.co.rays.proj3.model.CourseModelInt;
import in.co.rays.proj3.model.ModelFactory;
import in.co.rays.proj3.model.SubjectModelInt;
import in.co.rays.proj3.model.TimetableModelHibImp;
import in.co.rays.proj3.model.TimetableModelInt;
import in.co.rays.proj3.util.DataUtility;
import in.co.rays.proj3.util.DataValidator;
import in.co.rays.proj3.util.ServletUtility;

// TODO: Auto-generated Javadoc
/**
 * The Class TimeTableCtl.
 */
@WebServlet(name = "TimeTableCtl", urlPatterns = { "/ctl/TimeTableCtl" })
public class TimeTableCtl extends BaseCtl {

	/** The log. */
	private static Logger log = Logger.getLogger(TimeTableCtl.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * in.co.rays.controller.BaseCtl#preload(javax.servlet.http.HttpServletRequest)
	 */
	@Override
	protected void preload(HttpServletRequest request) {

		CourseModelInt courseModel = ModelFactory.getInstance().getCourseModel();
		SubjectModelInt subjectModel = ModelFactory.getInstance().getSubjectModel();

		try {
			List courseList = courseModel.list();
			List sujectList = subjectModel.list();

			request.setAttribute("courseList", courseList);
			request.setAttribute("sujectList", sujectList);

		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * in.co.rays.controller.BaseCtl#validate(javax.servlet.http.HttpServletRequest)
	 */
	@Override
	protected boolean validate(HttpServletRequest request) {
		System.out.println("in timetable validate");

		boolean pass = true;

		String courseId = request.getParameter("course");
		String subjectId = request.getParameter("subject");
		String semester = request.getParameter("semester");
		String Exdate = request.getParameter("examdate");
		String examTime = request.getParameter("examTime");
		String description = request.getParameter("description");

		if (DataValidator.isNull(courseId)) {
			request.setAttribute("course", "Please Select Course");
			pass = false;
		}
		if (DataValidator.isNull(subjectId)) {
			request.setAttribute("subject", "Please Select Subject");
			pass = false;
		}
		if (DataValidator.isNull(semester)) {
			request.setAttribute("semester", "Please Select Semester");
			pass = false;
		}
		if (DataValidator.isNull(Exdate)) {
			request.setAttribute("examdate", "Please Select Exam Date");
			pass = false;
		}
		if (DataValidator.isNull(examTime)) {
			request.setAttribute("examTime", "Please Select Exam Time");
			pass = false;
		}
		if (DataValidator.isNull(description)) {
			request.setAttribute("description", "Please Select desciption");
			pass = false;
		}

		return pass;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.co.rays.controller.BaseCtl#populateDTO(javax.servlet.http.
	 * HttpServletRequest)
	 */
	@Override
	protected BaseDTO populateDTO(HttpServletRequest request) {
		System.out.println("in timetable populate");
		TimetableDTO dto = new TimetableDTO();

		String courseId = request.getParameter("course");
		String subjectId = request.getParameter("subject");
		String semester = request.getParameter("semester");
		String Exdate = request.getParameter("examdate");
		String examTime = request.getParameter("examTime");
		String description = request.getParameter("description");

		dto.setId(DataUtility.getLong(request.getParameter("id")));
		dto.setCourseId(DataUtility.getLong(courseId));
		dto.setSubjectId(DataUtility.getInt(subjectId));
		dto.setSemester(DataUtility.getString(semester));
		dto.setDescription(DataUtility.getString(description));

		System.out.println(Exdate);
		if (!Exdate.equals("")) {
			dto.setExamDate(DataUtility.getDate(Exdate));
		}

		dto.setExamTime(DataUtility.getString(examTime));

		populate(dto, request);
		return dto;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		long id = DataUtility.getLong(request.getParameter("id"));

		TimetableDTO dto = null;

		TimetableModelInt model = ModelFactory.getInstance().getTimetableModel();

		if (id > 0) {
			try {
				dto = model.findByPK(id);
				ServletUtility.setDto(dto, request);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		ServletUtility.forward(getView(), request, response);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/* log.debug("TimeTableCtl Method doPost Started"); */
		String op = DataUtility.getString(req.getParameter("operation"));
		// get model

		TimetableModelInt model = ModelFactory.getInstance().getTimetableModel();
		long id = DataUtility.getLong(req.getParameter("id"));
		if (OP_SAVE.equalsIgnoreCase(op) || OP_UPDATE.equalsIgnoreCase(op)) {
			TimetableDTO bean = (TimetableDTO) populateDTO(req);
			try {
				if (id > 0) {
					try {
						model.update(bean);
					} catch (DatabaseException e) {
						e.printStackTrace();
					}
					ServletUtility.setDto(bean, req);
					ServletUtility.setSuccessMessage("Data is Successfully Updated", req);
				} else {
					long pk = model.add(bean);
					ServletUtility.setDto(bean, req);
					ServletUtility.setSuccessMessage("Data is Successfully Saved", req);
				}
			} catch (ApplicationException e) {
				log.error(e);
				e.printStackTrace();
				ServletUtility.handleException(e, req, resp);
				return;
			} catch (DuplicateRecordException e) {
				ServletUtility.setDto(bean, req);
				ServletUtility.setErrorMessage("TimeTable is already exists", req);
			}

		} else if (OP_DELETE.equalsIgnoreCase(op)) {

			TimetableDTO bean = (TimetableDTO) populateDTO(req);
			try {
				model.delete(bean);
				ServletUtility.redirect(ORSView.TIMETABLE_LIST_CTL, req, resp);
				return;
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, req, resp);
				return;
			}

		} else if (OP_RESET.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.TIMETABLE_CTL, req, resp);
			return;

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.TIMETABLE_LIST_CTL, req, resp);
			return;

		}
		ServletUtility.forward(getView(), req, resp);

		log.debug("TimeTableCtl Method doPost Ended");

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.co.rays.controller.BaseCtl#getView()
	 */
	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.TIMETABLE_VIEW;
	}

}
