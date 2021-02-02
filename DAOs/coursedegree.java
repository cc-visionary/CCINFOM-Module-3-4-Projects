/**
 * @author Christopher Lim 
 */

package enrollment;
import java.sql.*;
import java.util.*;

public class coursedegree {
    private String courseid;
    private String degree;
    private ArrayList<coursedegree> coursedegreelist = new ArrayList<>();
    
    public coursedegree () {
        courseid = "";
        degree = "";
        coursedegreelist.clear();
    };
   
    public coursedegree (String courseid, String degree) {
        this.courseid = courseid;
        this.degree = degree;
        coursedegreelist.clear();
    };
    
    public ArrayList<coursedegree> getCourseDegreeList() {
        return coursedegreelist;
    };
    
    public String getCourseId() {
        return courseid;
    };
    
    public String getDegree() {
        return degree;
    };
    
    public void setCourseId(String courseid) {
        this.courseid = courseid;
    };
    
    public void setDegree(String degree) {
        this.degree = degree;
    };
    
    public int modRecord()  { 
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("UPDATE coursedegree set courseid=? WHERE courseid=?");
            pstmt.setString(2, courseid);
            pstmt.setString(1, degree);
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
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM coursedegree WHERE courseid=?");
            pstmt.setString(1, courseid);
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
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO coursedegree VALUES (?, ?)");
            pstmt.setString(1, courseid);
            pstmt.setString(2, degree);
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM coursedegree");
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                coursedegree cd = new coursedegree(rs.getString("courseid"), rs.getString("degree"));
                coursedegreelist.add(cd);
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
//        coursedegree v_coursedegree = new coursedegree("CCPROG2", "BSIT");
//        v_coursedegree.addRecord();
//        v_coursedegree.modRecord();
//        v_coursedegree.delRecord();
//        v_coursedegree.viewRecord();
//        for(coursedegree cd : v_coursedegree.getCourseDegreeList()) {
//            System.out.println(cd.getCourseId());
//            System.out.println(cd.getDegree());
//            System.out.println(".................");
//        }
    }
}
