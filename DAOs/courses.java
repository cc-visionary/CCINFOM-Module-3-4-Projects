/**
 * @author Christopher Lim 
 */

package enrollment;
import java.sql.*;
import java.util.*;

public class courses {
    private String courseid;
    private String coursename;
    private String department;
    private ArrayList<courses> courselist = new ArrayList<>();
    
    public courses () {
        this.courseid = "";
        this.coursename = "";
        this.department = "";
        courselist.clear();
    };
    
    public courses (String courseid, String coursename, String department) {
        this.courseid = courseid;
        this.coursename = coursename;
        this.department = department;
        courselist.clear();
    };
    
    public ArrayList<courses> getCourseList() {
        return courselist;
    };
    
    public String getCourseId() {
        return courseid;
    };
    
    public String getCourseName() {
        return coursename;
    };
    
    public String getDepartment() {
        return department;
    };
    
    public void setCourseId(String courseid) {
        this.courseid = courseid;
    };
    
    public void setCourseName(String coursename) {
        this.coursename = coursename;
    };
    
    public void setDepartment(String department) {
        this.department = department;
    };
    
    /**
     * Steps to accessing the Database
     * 1. Prepare connection to MySQL
     * 2. Prepare the SQL Statement
     * 3. Put the values to the SQL Statement
     * 4. Execute the SQL Statement
     * 5. Close the connections and SQL Statements
     */
    public int modRecord()  { 
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("UPDATE courses set coursename=?, department=? WHERE courseid=?");
            pstmt.setString(3, courseid);
            pstmt.setString(1, coursename);
            pstmt.setString(2, department);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    public int delRecord() { 
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM courses WHERE courseid=?");
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
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO courses VALUES (?, ?, ?)");
            pstmt.setString(1, courseid);
            pstmt.setString(2, coursename);
            pstmt.setString(3, department);
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM courses");
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                courses c = new courses(rs.getString("courseid"), rs.getString("coursename"), rs.getString("department"));
                courselist.add(c);
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
    
    public int getRecord() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM courses WHERE courseid=?");
            pstmt.setString(1, courseid);
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                setCourseName(rs.getString("coursename"));
                setDepartment(rs.getString("department"));
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
    
    public static void main(String args[]) {
//        courses v_courses = new courses("CSADPRG", "Advanced Programming and Theory of PLs", "Software Technology");
//        v_courses.addRecord();
//        v_courses.modRecord();
//        v_courses.delRecord();
//        v_courses.viewRecord();
//        for(courses course : v_courses.getCourseList()) {
//            System.out.println(course.getCourseId());
//            System.out.println(course.getCourseName());
//            System.out.println(course.getDepartment());
//            System.out.println(".................");
//        }
    }
}
