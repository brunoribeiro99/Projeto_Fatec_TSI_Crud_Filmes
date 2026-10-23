package br.com.site_filme.controller;

import java.io.IOException;

import br.com.site_filme.DAO.FilmeDAOImpl;
import br.com.site_filme.DAO.GenericDAO;
import br.com.site_filme.model.Filme;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@jakarta.servlet.annotation.WebServlet("/CadastrarFilme")
public class CadastrarFilme extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nomeFilme = request.getParameter("nomeFilme");
        String anoLancamento = request.getParameter("anoLancamento");
        String descricaoFilme = request.getParameter("descricaoFilme");
        String genero = request.getParameter("genero");
        String mensagem = null;
        String imagem = request.getParameter("imagem");

        Filme filme = new Filme();
        filme.setNome(nomeFilme);
        filme.setDescricao(descricaoFilme);
        filme.setGenero(genero);
        filme.setImagem(imagem);

        try {
            if (anoLancamento != null && !anoLancamento.isBlank()) {
                filme.setAnoLancamento(Integer.parseInt(anoLancamento.trim()));
            }

            GenericDAO dao = new FilmeDAOImpl();

            if (dao.cadastrar(filme)) {
                mensagem = "Filme cadastrado com sucesso!";
            } else {
                mensagem = "Problemas ao cadastrar Filme!";
            }

            request.setAttribute("sucesso", mensagem);
            request.getRequestDispatcher("/view/cadastrarfilme.jsp").forward(request, response);

        } catch (Exception ex) {
            System.out.println("Problemas ao cadastrar Filme Erro:" + ex.getMessage());
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