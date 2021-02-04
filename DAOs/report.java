/**
 * @author Christopher Lim 
 */

package enrollment;
import java.sql.*;
import java.util.*;

public class report {
    private int                term;
    private int                schoolyear;
    private ArrayList<String>  courseList = new ArrayList<>();
    private ArrayList<Integer> countList  = new ArrayList<>();
    
    public report() {}
    
    public report(int term, int schoolyear) {
        this.term = term;
        this.schoolyear = schoolyear;
    }
    
    public int getTerm() {
        return term;
    }
    
    public int getSchoolYear() {
        return schoolyear;
    }
    
    public ArrayList<String> getCourseList() {
        return courseList;
    } 
    
    public ArrayList<Integer> getCountList() {
        return countList;
    }
    
    public void setTerm(int term) {
        this.term = term;
    }
    
    public void setSchoolYear(int schoolyear) {
        this.schoolyear = schoolyear;
    }
    
    public int clearReport() {
        courseList.clear();
        countList.clear();
        return 1;
    } 
    
    public int generateReport() {
        try {
            // 1. Instantiate a connection variable
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our SELECT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT courseid, COUNT(*) as coursecount FROM enrollment WHERE term=? AND schoolyear=? GROUP BY courseid");
            pstmt.setInt(1, term);
            pstmt.setInt(2, schoolyear);
            // 5. Supply the statement with values
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();   
            
            // 7. Get the results
            while (rs.next()) {
                String courseid = rs.getString("courseid");
                int count = rs.getInt("coursecount");
                
                courseList.add(courseid);
                countList.add(count);
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
//        report v_report = new report(1, 20192020);
//        v_report.generateReport();
//        for(int i = 0; i < v_report.getCourseList().size(); i++) {
//            System.out.println(v_report.getCourseList().get(i));
//            System.out.println(v_report.getCountList().get(i));
//            System.out.println("..........");
//        }
    }
}
