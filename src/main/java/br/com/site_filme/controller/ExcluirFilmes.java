package br.com.site_filme.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.site_filme.DAO.FilmeDAOImpl;
import br.com.site_filme.DAO.GenericDAO;

@javax.servlet.annotation.WebServlet("/ExcluirFilmes")

public class ExcluirFilmes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            GenericDAO dao = new FilmeDAOImpl();
            dao.excluir(id);

            request.getRequestDispatcher("/ListarFilmes").forward(request, response);

        } catch (Exception ex) {
            System.out.println("Problemas na Controller ao Excluir Filme: Erro: " + ex.getMessage());
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
