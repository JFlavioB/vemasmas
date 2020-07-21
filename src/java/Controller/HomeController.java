/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.bean.Usuario;

/**
 *
 * @author flavi
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController", "/inicio", "/registro", "/menu",
    "/registrar", "/login", "/actualizar"
})
public class HomeController extends HttpServlet {

    ArrayList<Usuario> usuarios = new ArrayList<>();
    Usuario usuarioSesion = new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String url = request.getServletPath();
        try {

            switch (url) {
                case "/inicio":
                    request.getRequestDispatcher("WEB-INF/views/inicio.jsp").forward(request, response);
                    break;
                case "/registro":
                    request.getRequestDispatcher("WEB-INF/views/registro.jsp").forward(request, response);
                    break;

                case "/menu":
                    if (usuarioSesion.getNombre() != null) {
                        request.setAttribute("nombre", usuarioSesion.getNombre());
                        request.setAttribute("correo", usuarioSesion.getCorreo());
                        request.setAttribute("rfc", usuarioSesion.getRfc());
                        request.setAttribute("password", usuarioSesion.getPassword());
                        request.setAttribute("direccion", usuarioSesion.getDireccion());
                        request.setAttribute("telefono", usuarioSesion.getTelefono());
                        request.setAttribute("web", usuarioSesion.getWeb());
                    }
                    request.getRequestDispatcher("WEB-INF/views/menu.jsp").forward(request, response);
                    break;

            }

        } catch (Exception e) {
            System.err.println("ERROR EN EL METODO GET " + e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {

            switch (request.getServletPath()) {
                case "/registrar":
                    System.out.println("registrar");
                    Usuario user = new Usuario();

                    user.setNombre(request.getParameter("nombre"));
                    user.setCorreo(request.getParameter("email"));
                    user.setRfc(request.getParameter("rfc"));
                    user.setPassword(request.getParameter("password"));

                    boolean existe = false;

                    for (int i = 0; i < usuarios.size(); i++) {
                        if (user.getRfc().equals(usuarios.get(i).getRfc())) {
                            existe = true;
                        }
                    }
                    if (!existe) {
                        System.err.println("registro");
                        usuarios.add(user);
                        System.out.println("rfc0" + usuarios.get(0).getRfc());
                        //System.out.println("rfc1" +usuarios.get(1).getRfc());
                        response.sendRedirect("inicio");
                    } else {
                        request.setAttribute("error", "Ya existe el RFC");
                        request.getRequestDispatcher("WEB-INF/views/registro.jsp").forward(request, response);
                        System.out.println("No registro");
                    }
                    break;
                case "/login":
                    Usuario u = new Usuario();

                    u.setCorreo(request.getParameter("email"));
                    u.setPassword(request.getParameter("password"));
                    boolean acceso = false;
                    for (int i = 0; i < usuarios.size(); i++) {
                        if (u.getCorreo().equals(usuarios.get(i).getCorreo())
                                && u.getPassword().equals(usuarios.get(i).getPassword())) {
                            usuarioSesion.setNombre(usuarios.get(i).getNombre());
                            usuarioSesion.setCorreo(usuarios.get(i).getCorreo());
                            usuarioSesion.setPassword(usuarios.get(i).getPassword());
                            usuarioSesion.setRfc(usuarios.get(i).getRfc());
                            usuarioSesion.setDireccion("Sin Registrar");
                            usuarioSesion.setTelefono("Sin registrar");
                            usuarioSesion.setWeb("Sin Asignar");
                            acceso = true;
                        }
                    }
                    if (acceso) {
                        response.sendRedirect("menu");
                    } else {
                        request.setAttribute("error", "los valores introducidos no coinciden con el sistema");
                        request.getRequestDispatcher("WEB-INF/views/inicio.jsp").forward(request, response);
                        System.err.println("No existe usuario");
                    }
                    break;
                case "/actualizar":
                    Usuario usuarioActualizado = new Usuario();
                    
                    usuarioSesion.setNombre(request.getParameter("nombre"));
                    usuarioSesion.setRfc(request.getParameter("rfc"));
                    usuarioSesion.setDireccion(request.getParameter("direccion"));
                    usuarioSesion.setTelefono(request.getParameter("telefono"));
                    usuarioSesion.setWeb(request.getParameter("web"));
                    usuarioSesion.setPassword(request.getParameter("password"));
                    usuarioSesion.setCorreo(request.getParameter("correo"));
                    
                    response.sendRedirect("menu");
                    
                    
                    
                    
                    break;
            }
        } catch (Exception e) {
            System.err.println("ERROR EN EL METODO POST " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
