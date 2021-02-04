/**
 * @author Chris Cheng
 */

package enrollment;
import java.sql.*;
import java.util.*;

public class drop {
    private int                      term;
    private int                      schoolyear;
    private students                 Student;
    private ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    private ArrayList<enrollment>    DropList        = new ArrayList<> ();

    // perform all the necessary data loading from DB
    public drop() {
        clearDrop();
    };             
    
    public drop(students Student) {
        this.Student = Student;
        clearDrop();
    }
    
    public students getStudent() {
        return Student;
    }
    
    public int getTerm() {
        return term;
    }
    
    public int getSchoolYear() {
        return schoolyear;
    }
    
    public ArrayList<enrollment> getEnrollmentList() {
        return EnrollmentList;
    }
    
    public ArrayList<enrollment> getDropList() {
        return DropList;
    }
    
    public void setStudent(students Student) {
        this.Student = Student;
    }
    
    public void setTerm(int term) {
        this.term = term;
    }
    
    public void setSchoolYear(int schoolyear) {
        this.schoolyear = schoolyear;
    }
    
    // clears dropping data of the student
    public int clearDrop () {  
        EnrollmentList.clear();
        DropList.clear();
        return 1;   
    }   
    
    // load enrollment data of the student 
    public int loadEnrollment () {  
      try {
            // 1. Instantiate a connection variable
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our SELECT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM enrollment WHERE studentid=? AND term=? AND schoolyear=?");
            pstmt.setInt(1, Student.getStudentId());
            pstmt.setInt(2, term);
            pstmt.setInt(3, schoolyear);
            // 5. Supply the statement with values
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();   
            
            // 7. Get the results
            EnrollmentList.clear();
            while (rs.next()) {
                enrollment E = new enrollment(rs.getInt("studentid"), rs.getString("courseid"), rs.getInt("term"), rs.getInt("schoolyear"));
                boolean notInDropList = true;
                for(enrollment e : DropList) {
                    if(e.getCourseId().equals(E.getCourseId())) {
                        notInDropList = false;
                        break;
                    }
                }
                if(notInDropList) EnrollmentList.add(E);
            }
            
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        }      
    }
    
    // saves dropping data into the Database
    public int confirmDrop() {   
        for(enrollment e : DropList) e.delRecord();
        return 1;
    }   
    
    public static void main(String args[]) {
//        students v_student = new students();
//        v_student.setStudentId(10100006);
//        v_student.getRecord();
//        drop v_drop = new drop(v_student, 3, 20202021);
//        v_drop.loadEnrollment();
//        for(enrollment e : v_drop.getEnrollmentList()) {
//            System.out.println(e.getCourseId());
//            System.out.println("........");
//        }
    }
}
