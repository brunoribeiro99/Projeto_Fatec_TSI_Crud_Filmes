package br.com.site_filme.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.site_filme.DAO.FilmeDAOImpl;
import br.com.site_filme.DAO.GenericDAO;
import br.com.site_filme.model.Filme;

public class CadastrarFilme extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nomeFilme = request.getParameter("nomeFilme");
        String descricaoFilme = request.getParameter("descricaoFilme");
        String mensagem = null;

        Filme filme = new Filme();
        filme.setNome(nomeFilme);
        filme.setDescricao(descricaoFilme);

        try {
            GenericDAO dao = new FilmeDAOImpl();

            if (dao.cadastrar(filme)) {
                mensagem = "Filme cadastrado com sucesso!";
            } else {
                mensagem = "Problemas ao cadastrar Filme!";
            }

            request.setAttribute("sucesso", mensagem);
            request.getRequestDispatcher("view/cadastro.jsp").forward(request, response);

        } catch (Exception ex) {
            System.out.println("Problemas ao cadastrar Filme Erro:" + ex.getMessage());
            ex.printStackTrace();
        }
    }
}