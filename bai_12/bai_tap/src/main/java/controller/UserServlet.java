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

@WebServlet(name = "UserServlet",urlPatterns = {"","/User"})
public class UserServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default:
                showUserList(request,response);
                break;
        }
    }

    private void showUserList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.findAll();
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("/users/list.jsp").forward(request,response);
    }
}
