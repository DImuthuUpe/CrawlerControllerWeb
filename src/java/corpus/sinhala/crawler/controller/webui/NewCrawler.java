/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package corpus.sinhala.crawler.controller.webui;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author dimuthuupeksha
 */
@WebServlet(name = "NewCrawler", urlPatterns = {"/NewCrawler"})
@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024, 
    maxFileSize=1024*1024*50, maxRequestSize=1024*1024*50*5)
public class NewCrawler extends HttpServlet {

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
        try {
            int MAX_MEMORY_SIZE = 1024 * 1024 * 20;
            final int MAX_REQUEST_SIZE = 1024 * 1024 * 20;

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(MAX_MEMORY_SIZE);
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            String uploadFolder = SysProperty.getProperty("crawlerBase");
            out.print(uploadFolder);
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(MAX_REQUEST_SIZE);
            upload.setFileSizeMax(MAX_REQUEST_SIZE);

            try {
                List items = upload.parseRequest(request);
                String filePath = "";
                String visibleName = "";
                for (Object item1 : items) {
                    FileItem item = (FileItem) item1;

                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        filePath = uploadFolder + File.separator + fileName;
                        File uploadedFile = new File(filePath);

                        item.write(uploadedFile);

                    } else {
                        visibleName = item.getString();
                    }
                }
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://" + SysProperty.getProperty("dbHost") + ":3306/crawler_data",
                        SysProperty.getProperty("dbUser"), SysProperty.getProperty("dbPassword"));

                System.out.println("got connection");

                Statement s = con.createStatement();
                String sql = "INSERT into crawler (name,location) values ('" + visibleName + "','" + filePath + "')";
                s.executeUpdate(sql);
            } catch (Exception e) {
                e.printStackTrace();
                out.print(e.getMessage());
            }
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
