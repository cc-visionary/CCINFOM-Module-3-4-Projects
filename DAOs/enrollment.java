/**
 * @author Christopher Lim 
 */

package enrollment;
import java.sql.*;
import java.util.*;

public class enrollment {
    
    private int studentid;
    private String courseid;
    private int term;
    private int schoolyear;
    private ArrayList<enrollment> enrollmentlist = new ArrayList<>();
    
    public enrollment () {
        this.studentid = 0;
        this.courseid = "";
        this.term = 0;
        this.schoolyear = 0;
        enrollmentlist.clear();
    };
    
    public enrollment (int studentid, String courseid, int term, int schoolyear) {
        this.studentid = studentid;
        this.courseid = courseid;
        this.term = term;
        this.schoolyear = schoolyear;
        enrollmentlist.clear();
    };
    
    public ArrayList<enrollment> getEnrollmentList() {
        return enrollmentlist;
    };
    
    public int getStudentId() {
        return studentid;
    };
    
    public String getCourseId() {
        return courseid;
    };
    
    public int getTerm() {
        return term;
    };
    
    public int getSchoolYear() {
        return schoolyear;
    };
    
    
    public void setStudentId(int studentid) {
        this.studentid = studentid;
    };
    
    public void setCourseId(String courseid) {
        this.courseid = courseid;
    };
    
    public void setTerm(int term) {
        this.term = term;
    };
    
    public void setSchoolYear(int schoolyear) {
        this.schoolyear = schoolyear;
    };
    
    public int modRecord()  { 
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("UPDATE enrollment set courseid=?, term=?, schoolyear=? WHERE studentid=?");
            pstmt.setInt(4, studentid);
            pstmt.setString(1, courseid);
            pstmt.setInt(2, term);
            pstmt.setInt(3, schoolyear);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    public int delRecord()  { 
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM enrollment WHERE studentid=? AND courseid=? AND term=? AND schoolyear=?");
            pstmt.setInt(1, studentid);
            pstmt.setString(2, courseid);
            pstmt.setInt(3, term);
            pstmt.setInt(4, schoolyear);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    public int addRecord()  { 
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO enrollment VALUES (?, ?, ?, ?)");
            pstmt.setInt(1, studentid);
            pstmt.setString(2, courseid);
            pstmt.setInt(3, term);
            pstmt.setInt(4, schoolyear);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    public int viewRecord() { 
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM enrollment");
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                enrollment e = new enrollment(rs.getInt("studentid"), rs.getString("courseid"), rs.getInt("term"), rs.getInt("schoolyear"));
                enrollmentlist.add(e);
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
    
    public static void main(String args[]) {
//        enrollment v_enrollment = new enrollment(11912345, "CCPROG2", 1, 20202021);
//        v_enrollment.addRecord();
//        v_enrollment.modRecord();
//        v_enrollment.delRecord();
//        v_enrollment.viewRecord();
//        for(enrollment e : v_enrollment.getEnrollmentList()) {
//            System.out.println(e.getStudentId());
//            System.out.println(e.getCourseId());
//            System.out.println(e.getTerm());
//            System.out.println(e.getSchoolYear());
//            System.out.println(".................");
//        }
    }
}
