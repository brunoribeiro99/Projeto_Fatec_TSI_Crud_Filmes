<%@page import="java.util.List"%>
<%@page import="br.com.site_filme.model.Filme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Filmes</title>
    </head>
    <body>
        <table border="1" align="center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Ano de Lançamento</th>
                    <th>Descrição</th>
                    <th>Gênero</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Filme> filmes =
                        (List<Filme>) request.getAttribute("filmes");

                    for (Filme filme : filmes) {
                %>
                <tr>
                    <td><%= filme.getId() %></td>
                    <td><%= filme.getNome() %></td>
                    <td><%= filme.getAnoLancamento() %></td>
                    <td><%= filme.getDescricao() %></td>
                    <td><%= filme.getGenero() %></td>
                    <td>
                        <a href="ExcluirFilmes?id=<%= filme.getId() %>">
                            Excluir
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
