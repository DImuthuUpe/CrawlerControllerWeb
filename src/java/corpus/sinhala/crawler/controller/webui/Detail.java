/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package corpus.sinhala.crawler.controller.webui;

import corpus.sinhala.crawler.controller.webui.beans.DateRange;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dimuthuupeksha
 */
@WebServlet(name = "Detail", urlPatterns = {"/Detail"})
public class Detail extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        List<DateRange> ranges = new ArrayList<DateRange>();
        try {
            String crawlerId = request.getParameter("id");
            try {
                // Step 1. Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Step 2. Create a Connection object
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/crawler_data",
                        "root", "");

                System.out.println("got connection");


                // Step 3. Create a Statement object and call its executeUpdate 
                // method to insert a record
                Statement s = con.createStatement();

                // Step 4. Use the same Statement object to obtain a ResultSet object
                String sql = "SELECT DATE FROM completed where CRAWLERID= " + crawlerId+" order by DATE ASC";
                ResultSet rs = s.executeQuery(sql);
                while (rs.next()) {
                    String rawDate = rs.getString(1);
                    out.print(rawDate+"<br/>");
                    String str[] = rawDate.split("/");
                    int year = Integer.parseInt(str[0]);
                    int month = Integer.parseInt(str[1]);
                    int day = Integer.parseInt(str[2]);
                    
                    boolean catched = false;
                    for(int i=0;i<ranges.size();i++){
                        DateRange range = ranges.get(i);
                        if(range.nextDay(year, month, day)){
                            range.eYear =year;
                            range.eMonth = month;
                            range.eDay = day;
                            ranges.set(i, range);
                            catched = true;
                            break;
                        }
                    }
                    if(!catched){
                        DateRange range = new DateRange(year, month, day);
                        ranges.add(range);
                    }
                }
                rs.close();
                s.close();
                con.close();
            } catch (ClassNotFoundException e1) {
                // JDBC driver class not found, print error message to the console
                System.out.println(e1.toString());
            } catch (SQLException e2) {
                // Exception when executing java.sql related commands, print error message to the console
                System.out.println(e2.toString());
            } catch (Exception e3) {
                // other unexpected exception, print error message to the console
                System.out.println(e3.toString());
            }
            request.setAttribute("ranges", ranges);
            request.setAttribute("id", crawlerId);
            
            RequestDispatcher disp = request.getRequestDispatcher("detail.jsp");
            disp.forward(request, response);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
