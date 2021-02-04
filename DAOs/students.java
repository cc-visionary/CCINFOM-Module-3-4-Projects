/**
 * @author Christopher Lim 
 */

package enrollment;
import java.sql.*;
import java.util.*;

public class students {
    
    private int studentid;
    private String completename;
    private String degreeid;
    private ArrayList<students> studentlist = new ArrayList<>();
    
    public students () {
        this.studentid = 0;
        this.completename = "";
        this.degreeid = "";
        studentlist.clear();
    };
    
    public students (int studentid, String completename, String degreeid) {
        this.studentid = studentid;
        this.completename = completename;
        this.degreeid = degreeid;
        studentlist.clear();
    };
    
    public ArrayList<students> getStudentList() {
        return studentlist;
    };
    
    public int getStudentId() { 
        return studentid;
    };
    
    public String getCompleteName() {
        return completename;
    };
    
    public String getDegreeId() {
        return degreeid;
    };
    
    public void setStudentId(int studentid) { 
        this.studentid = studentid;
    };
    
    public void setCompleteName(String completename) {
        this.completename = completename;
    };
    
    public void setDegreeId(String degreeid) {
        this.degreeid = degreeid;
    };
    
    public int modRecord()  { 
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("UPDATE students set completename=?, degreeid=? WHERE studentid=?");
            pstmt.setInt(3, studentid);
            pstmt.setString(1, completename);
            pstmt.setString(2, degreeid);
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
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM students WHERE studentid=?");
            pstmt.setInt(1, studentid);
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
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO students VALUES (?, ?, ?)");
            pstmt.setInt(1, studentid);
            pstmt.setString(2, completename);
            pstmt.setString(3, degreeid);
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM students");
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                students s = new students(rs.getInt("studentid"), rs.getString("completename"), rs.getString("degreeid"));
                studentlist.add(s);
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM students WHERE studentid=?");
            pstmt.setInt(1, studentid);
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                setCompleteName(rs.getString("completename"));
                setDegreeId(rs.getString("degreeid"));
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
       students v_students = new students(11912345, "Joseph Monte Carlo", "BSCS");
//       v_students.addRecord();
//       v_students.modRecord();
//       v_students.delRecord();
       v_students.viewRecord();
       for(students student : v_students.getStudentList()) {
           System.out.println(student.getStudentId());
           System.out.println(student.getCompleteName());
           System.out.println(student.getDegreeId());
           System.out.println(".........................");
       }
    }
}
