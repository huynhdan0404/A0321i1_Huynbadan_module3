package controller;

import model.bean.User;
import model.service.Impl.UserServiceImpl;
import model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet",urlPatterns = {"","/user"})
public class UserServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "find":
                findUser(request,response);
                break;
        }
    }

    private void findUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.findById(id);
        request.setAttribute("user",user);
        request.getRequestDispatcher("/find.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "find":
                findFormUser(request,response);
                break;
            default:
                showListCustomer(request,response);
                break;
        }
    }

    private void findFormUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/find.jsp");
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.findAll();
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }
}
