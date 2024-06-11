package Servlet;

import DAO.UserDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    private final String ERROR = "Error.jsp";
    private final String STAFF = "Staff.jsp";
    private final String USER = "User.jsp";
    private final String LOGIN = "Login.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN;
        String message = "Login failed ! <br> Please check your username and password again ! ";
        try {
            String userId = request.getParameter("txtuserId");
            int password = Integer.parseInt(request.getParameter("txtpassword"));
            UserDAO userdao = new UserDAO();
            String name = userdao.getUserById(userId).getFullName();
            HttpSession session = request.getSession();
            session.setAttribute("Name", name);
            if (userdao.login(userId, password)) {
                if (userdao.getUserById(userId).getRole() == 1) {
                    url = STAFF;
                    message = "Login successfully as a STAFF !";
                } else if (userdao.getUserById(userId).getRole() == 0) {
                    url = USER;
                    message = "Login successfully as a USER !";
                }
            }
        } catch (Exception ex) {
            url = ERROR;
        } finally {
            request.getSession().setAttribute("message", message);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "LoginServlet";
    }
}
