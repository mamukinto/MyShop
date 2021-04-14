package service.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Base64;


@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 100, maxRequestSize = 1024 * 1024 * 100)
public class UploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("image64",encodeToBase64(req.getPart("image")));
        resp.sendRedirect(req.getContextPath() + "/admin/addNewProduct.jsp?img=added");
    }

    private static String encodeToBase64(Part part) {
        try {
            InputStream fileContent = part.getInputStream();
            byte[] byteArray = getByteArray(fileContent);
            return Base64.getEncoder().encodeToString(byteArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static byte[] getByteArray(InputStream is) throws Exception {
        ByteArrayOutputStream b = new ByteArrayOutputStream();
        BufferedOutputStream os = new BufferedOutputStream(b);
        while (true) {
            int i = is.read();
            if (i == -1) break;
            os.write(i);
        }
        os.flush();
        os.close();
        return b.toByteArray();
    }


}
