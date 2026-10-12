package br.com.site_filme.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import br.com.site_filme.DAO.FilmeDAOImpl;
import br.com.site_filme.DAO.GenericDAO;

@jakarta.servlet.annotation.WebServlet("/ListarFilmes")
public class ListarFilmes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            GenericDAO dao = new FilmeDAOImpl();

            request.setAttribute("filmes", dao.listar());

            request.getRequestDispatcher("/view/listarfilmes.jsp")
                    .forward(request, response);

        } catch (Exception ex) {
            System.out.println("Problemas na Controller ao Listar Filmes. Erro: "
                    + ex.getMessage());
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
