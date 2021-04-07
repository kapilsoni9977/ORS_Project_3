package in.co.rays.proj3.DTO;

/**
 * subject JavaDto encapsulates subject attributes
 * 
 * @author Kapil Soni
 *
 */

public class SubjectDTO extends BaseDTO {
	private long subjectId;
	private long courseId;
	private String subjectName;
	private String courseName;
	private String description;

	public long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}

	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKey() { 
		return id + "";
	}

	public String getValue() { 
		return subjectName;
	}

}
