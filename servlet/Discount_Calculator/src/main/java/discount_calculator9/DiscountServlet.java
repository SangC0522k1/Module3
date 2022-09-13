package discount_calculator9;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter printWriter = resp.getWriter();
        String description = req.getParameter("description");
        float price = Float.parseFloat(req.getParameter("price"));
        float percent = Float.parseFloat(req.getParameter("percent"));
        float discountAmount = (float) (price * percent * 0.01);
        printWriter.println("<html>");
        printWriter.println("<h1> Result:</h1>");
        printWriter.println("<p> Product Description:"+description+"</p>");
        printWriter.println("<p> List Price:"+price+"</p>");
        printWriter.println("<p> Discount Percent:"+discountAmount+"</p>");
        printWriter.println("</html>");
    }
}
