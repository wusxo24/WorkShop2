/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.MobileDAO;
import DAO.UserDAO;
import DTO.Mobile;
import DTO.User;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
public class UpdateServlet extends HttpServlet {

    private final String STAFF = "Staff.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = STAFF;
        String message;
        String mobileId = request.getParameter("txtMobileId");
        String description = request.getParameter("txtDescription");
        Double price = Double.parseDouble(request.getParameter("txtPrice"));
        String mobileName = request.getParameter("txtMobileName");
        int yearOfProduction = Integer.parseInt(request.getParameter("txtYearOfProduction"));
        int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
        boolean notSale = Boolean.valueOf(request.getParameter("notSale"));
        try {
            System.out.println("UpdateServlet received parameters:");
            System.out.println("MobileId: " + mobileId);
            System.out.println("Description: " + description);
            System.out.println("Price: " + price);
            System.out.println("MobileName: " + mobileName);
            System.out.println("YearOfProduction: " + yearOfProduction);
            System.out.println("Quantity: " + quantity);
            System.out.println("NotSale: " + notSale);
            
            MobileDAO mobiledao = new MobileDAO();
            if (mobiledao.updateMobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale)) {
                message = "Update Successfully";
                request.getSession().setAttribute("message", message);
                List<Mobile> updatedSearchList = mobiledao.getAllMobiles(); // Assuming getAllMobiles() fetches all mobiles
                request.getSession().setAttribute("SearchList", updatedSearchList);
            } else {
                message = "Update failed";
                request.getSession().setAttribute("message", message);
            }

        } catch (Exception e) {
            log("Error at UpdateServlet");
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
