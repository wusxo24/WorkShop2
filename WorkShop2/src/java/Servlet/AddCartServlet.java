/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.MobileDAO;
import DTO.Cart;
import DTO.Mobile;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class AddCartServlet extends HttpServlet {

    private final String USER = "User.jsp";

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
        String url = null;
        String message = null;
        try {
            String mobileId = request.getParameter("MobileId");
            String description = request.getParameter("MobileDescription");
            Double price = Double.parseDouble(request.getParameter("MobilePrice"));
            String mobileName = request.getParameter("MobileName");
            int yearOfProduction = Integer.parseInt(request.getParameter("MobileYearOfProduction"));
            int quantity = Integer.parseInt(request.getParameter("MobileQuantity"));
            int CartAmount = Integer.parseInt(request.getParameter("CartAmount"));
            Boolean notSale = false;
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("Cart");
            MobileDAO mobiledao = new MobileDAO();
            Mobile mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, CartAmount);
            if (cart == null) {
                cart = new Cart();
            }
            boolean check = cart.add(mobile);
            if (check) {
                message = "You added " + CartAmount + " " + mobileName + " to the cart.";
                session.setAttribute("Cart", cart);
                session.setAttribute("message", message);
                mobiledao.updateQuantityByAddCartAmmount(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, CartAmount);
                List<Mobile> updatedSearchList = mobiledao.getAllMobiles();
                request.getSession().setAttribute("SearchPriceList", updatedSearchList);
                url = USER;
            }
        } catch (Exception e) {
            log("Error at AddCartServlet: " + e.toString());
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
