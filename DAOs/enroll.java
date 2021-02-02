/**
 * @author Christopher Lim 
 */

package enrollment;
import java.sql.*;
import java.util.*;

public class enroll {

    private students                 Student;
    private ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    private ArrayList<coursedegree>  CourseList      = new ArrayList<> ();
 
    // perform all the necessary data loading from DB
    public enroll() {
        this.Student = new students();
        EnrollmentList.clear();
        CourseList.clear();
        loadCourses();
    };         
    
    public enroll(students Student) {
        this.Student = Student;
        EnrollmentList.clear();
        CourseList.clear();
        loadCourses();
    }
    
    public ArrayList<enrollment> getEnrollmentList() {
        return EnrollmentList;
    }
    
    public ArrayList<coursedegree> getCourseList() {
        return CourseList;
    }
    
    public void setStudent(students Student) {
        this.Student = Student;
    }
    
    // clears enrollment data of the student 
    public int clearEnrollment ()   {  
        EnrollmentList.clear();
        loadCourses();
        return 1;
    };   
    
    // load valid courses into the course list
    public int loadCourses ()       {
      try {
            // 1. Instantiate a connection variable
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our SELECT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM coursedegree WHERE degree=? AND NOT EXISTS (SELECT (1) FROM enrollment WHERE studentid=? AND coursedegree.courseid=enrollment.courseid)");
            pstmt.setString(1, Student.getDegreeId());
            pstmt.setInt(2, Student.getStudentId());
            // 5. Supply the statement with values
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();   
            
            // 7. Get the results
            CourseList.clear();
            while (rs.next()) {
                coursedegree CD = new coursedegree(rs.getString("courseid"), rs.getString("degree"));
                CourseList.add(CD);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        }           
    };
    
    // saves enrollment data into the Database
    public int confirmEnrollment()  {   
        for(enrollment e : EnrollmentList) e.addRecord();
        return 1;
    };
    
    public static void main(String args[]) {
        students v_students = new students(11912345, "Joseph Monte Carlo", "BSCS");
        enroll v_enroll = new enroll(v_students);
        for(coursedegree cd : v_enroll.getCourseList()) {
            System.out.println(cd.getCourseId());
            System.out.println(cd.getDegree());
            System.out.println("...........");
        }
    }
}
