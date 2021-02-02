/**
 * @author Christopher Lim 
 */

package enrollment;
import java.sql.*;
import java.util.*;

public class degree {
    
    private String degreeid;
    private String degreename;
    private ArrayList<degree> degreelist = new ArrayList<>();
     
    public degree () {
        this.degreeid = "";
        this.degreename = "";
        degreelist.clear();
    };
    
    public degree (String degreeid, String degreename) {
        this.degreeid = degreeid;
        this.degreename = degreename;
        degreelist.clear();
    };
    
    public ArrayList<degree> getDegreeList() {
        return degreelist;
    };
    
    public String getDegreeId() {
        return degreeid;
    };
    
    public String getDegreeName() {
        return degreename;
    };
    
    public void setDegreeId(String degreeid) {
        this.degreeid = degreeid;
    };
    
    public void setDegreeName(String degreename) {
        this.degreename = degreename;
    };
    
    public int modRecord()  { 
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("UPDATE degree set degreename=? WHERE degreeid=?");
            pstmt.setString(2, degreeid);
            pstmt.setString(1, degreename);
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
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM degree WHERE degreeid=?");
            pstmt.setString(1, degreeid);
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
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO degree VALUES (?, ?)");
            pstmt.setString(1, degreeid);
            pstmt.setString(2, degreename);
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM degree");
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                degree d = new degree(rs.getString("degreeid"), rs.getString("degreename"));
                degreelist.add(d);
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
//        degree v_degree = new degree("BSCS-ST", "Bachelor of Science in CS in ST");
//        v_degree.addRecord();
//        v_degree.modRecord();
//        v_degree.delRecord();
//        v_degree.viewRecord();
//        for(degree d : v_degree.getDegreeList()) {
//            System.out.println(d.getDegreeId());
//            System.out.println(d.getDegreeName());
//            System.out.println(".................");
//        }
    }
}
