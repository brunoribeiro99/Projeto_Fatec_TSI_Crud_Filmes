<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="br.com.site_filme.model.Filme"%>
<%@page import="br.com.site_filme.DAO.FilmeDAOImpl"%>
<%@page import="br.com.site_filme.DAO.GenericDAO"%>
<%
    List<Object> filmes = new java.util.ArrayList<Object>();
    try {
        GenericDAO dao = new FilmeDAOImpl();
        filmes = dao.listar();
    } catch (Exception ex) {
        System.out.println("Problemas ao carregar o catálogo. Erro: " + ex.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Metflix</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
          crossorigin="anonymous">
    <link rel="stylesheet" href="./css/estilo.css">
</head>

<body>

<div class="intro">

    <svg class="logo-m" viewBox="0 0 200 250">
        <path
            class="m-traco"
            d="M 30 220 L 30 30 L 100 150 L 170 30 L 170 220"
        />
    </svg>
    <audio id="somIntro" src="./audio/tum.mp3" preload="auto"></audio>

</div>

    <header class="metflix-navbar">

        <nav class="navbar navbar-expand-lg">

            <div class="container-fluid">

                <a class="nome" href="${pageContext.request.contextPath}/">METFLIX</a>

                <button class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown"
                        aria-expanded="false"
                        aria-label="Abrir menu">

                    <span class="navbar-toggler-icon"></span>

                </button>

                <div class="collapse navbar-collapse" id="navbarNavDropdown">

                    <ul class="navbar-nav">

                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/">
                                Início
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/view/cadastrarfilme.jsp">
                                Cadastrar Filme
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/ListarFilmes">
                                Listar Filmes
                            </a>
                        </li>

                        <li class="nav-item dropdown">

                            <a class="nav-link dropdown-toggle"
                               href="#"
                               role="button"
                               data-bs-toggle="dropdown"
                               aria-expanded="false">

                                Outros

                            </a>

                            <ul class="dropdown-menu">

                                <li>
                                    <a class="dropdown-item" href="sobre.html">
                                        Sobre
                                    </a>
                                </li>

                                <li>
                                    <a class="dropdown-item" href="contato.html">
                                        Contato
                                    </a>
                                </li>

                            </ul>

                        </li>

                    </ul>

                </div>

            </div>

        </nav>

    </header>


    <section class="banner">

        <div class="banner-content">

            <h1 class="banner-title">
                Homem-Aranha: Um Novo Dia
            </h1>

            <p class="banner-desc">
                Após o mundo ter esquecido seu nome, Peter Parker inicia um novo capítulo em sua vida, conciliando as aulas da faculdade, um trabalho de meio período e sua responsabilidade como o Homem-Aranha. Mas quando uma força misteriosa começa a desmantelar a cidade de dentro para fora, Peter se vê preso entre inimigos poderosos, legados antigos e aliados inesperados.
            </p>

            <button class="btn-play">
                ► Assistir Agora
            </button>

        </div>

    </section>


    <main class="catalogo">

        <h2>Catálogo Disponível</h2>

        <div class="grid-filmes">

            <% if (filmes.isEmpty()) { %>

                <p>Nenhum filme cadastrado ainda.</p>

            <% } else {
                   for (Object obj : filmes) {
                       Filme filme = (Filme) obj;
            %>

            <div class="card-filme">

                                <div class="capa-filme"
                     <% if (filme.getImagem() != null && !filme.getImagem().isBlank()) { %>
                     style="background-image: url('<%= filme.getImagem() %>'); background-size: contain; background-repeat: no-repeat; background-position: center; background-color: #000;"
                     <% } %>>
                    <span><%= filme.getGenero() %></span>
                </div>

                <div class="info-filme">

                                        <h3>
                        <%= filme.getNome() %>
                    </h3>

                    <p style="margin: 0 0 6px; font-size: 13px; color: #aaa;">
                        <%= filme.getGenero() %>
                        <% if (filme.getAnoLancamento() > 0) { %>
                            &bull; <%= filme.getAnoLancamento() %>
                        <% } %>
                    </p>

                    <p>
                        <%= filme.getDescricao() %>
                    </p>

                    <button class="btn-play">
                        ► Assistir Agora
                    </button>

                </div>

            </div>

            <%     }
               } %>

        </div>

    </main>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous">
    </script>
<script>
    const som = document.getElementById("somIntro");

    setTimeout(function () {
        som.play().catch(function () {
            console.log("O navegador bloqueou o áudio automático.");
        });
    }, 2000);

    setTimeout(function () {
        document.querySelector(".intro").classList.add("sair");
    }, 2800);
</script>

</body>
</html>