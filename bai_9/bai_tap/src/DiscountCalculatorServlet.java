import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountCalculatorServlet",urlPatterns = "/discountcalculator")
public class DiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("price");
        String b = request.getParameter("discount");
        double c = Integer.parseInt(a) * Integer.parseInt(b) * 0.01;

        request.setAttribute("discountamount",c);
        request.setAttribute("price",a);
        request.setAttribute("discount",b);
        request.getRequestDispatcher("display-discount.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
