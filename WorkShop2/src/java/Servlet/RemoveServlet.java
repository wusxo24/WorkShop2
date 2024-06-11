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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class RemoveServlet extends HttpServlet {

    private static final String CART = "Cart.jsp";

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
        String url = CART;
        try {
            String MobileId = request.getParameter("MobileId");
            String MobileName = request.getParameter("MobileName");
            Double Price = Double.parseDouble(request.getParameter("Price"));
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("Cart");
            if (cart != null) {
                if (cart.getCart().containsKey(MobileId)) {
                    int oldCartAmount = cart.getCart().get(MobileId).getCartAmount();
                    String Description = cart.getCart().get(MobileId).getDescription();
                    int yearOfProduction = cart.getCart().get(MobileId).getYearOfProduction();
                    int quantity = cart.getCart().get(MobileId).getQuantity();
                    Boolean notSale = cart.getCart().get(MobileId).getNotSale();
                    Mobile mobile = new Mobile(MobileId, Description, Price, MobileName, yearOfProduction, quantity + oldCartAmount, notSale, oldCartAmount);
                    boolean check = cart.remove(mobile);
                    if (check) {
                        request.getSession().setAttribute("Cart", cart);
                        request.getSession().setAttribute("Remove", "Remove " + MobileName + " successfully");
                        MobileDAO mobiledao = new MobileDAO();
                        List<Mobile> updatedSearchList = mobiledao.getAllMobiles();
                        request.getSession().setAttribute("SearchPriceList", updatedSearchList);

                    }
                }
            }
        } catch (Exception ex) {
            log("Error at changeServlet:" + ex.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
