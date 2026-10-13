<%@page import="java.util.List"%>
<%@page import="br.com.site_filme.model.Filme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Filme> filmes = (List<Filme>) request.getAttribute("filmes");
    if (filmes == null) {
        filmes = new java.util.ArrayList<Filme>();
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de Filmes - Metflix</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listar.css">
    </head>
    <body>

        <header class="topo">
            <a class="logo" href="${pageContext.request.contextPath}/">METFLIX</a>
            <a class="voltar" href="${pageContext.request.contextPath}/">&larr; Voltar para a Home</a>
        </header>

        <main class="conteudo">

            <h1>Filmes Cadastrados</h1>

            <% if (filmes.isEmpty()) { %>
                <p class="vazio">Nenhum filme cadastrado ainda.</p>
            <% } else { %>

            <div class="grade">

                <% for (Filme filme : filmes) { %>

                <article class="cartao">

                    <div class="capa">
                        <% if (filme.getImagem() != null && !filme.getImagem().isBlank()) { %>
                            <img src="<%= filme.getImagem() %>" alt="Capa de <%= filme.getNome() %>">
                        <% } else { %>
                            <span class="sem-capa">Sem capa</span>
                        <% } %>
                    </div>

                    <div class="detalhes">
                        <h2><%= filme.getNome() %></h2>

                        <p class="meta">
                            <span class="genero"><%= filme.getGenero() %></span>
                            <% if (filme.getAnoLancamento() > 0) { %>
                                <span class="ano"><%= filme.getAnoLancamento() %></span>
                            <% } %>
                        </p>

                        <p class="descricao"><%= filme.getDescricao() %></p>

                        <a class="excluir"
                           href="${pageContext.request.contextPath}/ExcluirFilmes?id=<%= filme.getId() %>"
                           onclick="return confirm('Excluir este filme?');">
                            Excluir
                        </a>
                    </div>

                </article>

                <% } %>

            </div>

            <% } %>

        </main>

    </body>
</html>