package br.com.site_filme.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.site_filme.DAO.FilmeDAOImpl;
import br.com.site_filme.DAO.GenericDAO;

public class ListarFilmes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            GenericDAO dao = new FilmeDAOImpl();
            request.setAttribute("filmes", dao.listar());
            request.getRequestDispatcher("view/listarfilmes.jsp").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Problemas na Controller ao Listar Filmes. Erro:" + ex.getMessage());
            ex.printStackTrace();
        }
    }
}