<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Filme - Metflix</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cadastrar.css">
    </head>
    <body>

        <header class="topo">
            <a class="logo" href="${pageContext.request.contextPath}/">METFLIX</a>
            <a class="voltar" href="${pageContext.request.contextPath}/">&larr; Voltar para a Home</a>
        </header>

        <main class="conteudo">

            <h1>Cadastrar Filme</h1>

            <% if (request.getAttribute("sucesso") != null) { %>
                <div class="mensagem">${sucesso}</div>
            <% } %>

            <form class="formulario" name="cadastrarfilme"
                  action="${pageContext.request.contextPath}/CadastrarFilme">

                <div class="campo">
                    <label for="nomeFilme">Nome</label>
                    <input type="text" id="nomeFilme" name="nomeFilme" required />
                </div>

                <div class="campo">
                    <label for="anoLancamento">Ano de Lançamento</label>
                    <input type="number" id="anoLancamento" name="anoLancamento" min="1888" max="2100" />
                </div>

                <div class="campo">
                    <label for="genero">Gênero</label>
                    <input type="text" id="genero" name="genero" />
                </div>

                <div class="campo">
                    <label for="imagem">Link da Imagem</label>
                    <input type="text" id="imagem" name="imagem" placeholder="https://..." />
                </div>

                <div class="campo">
                    <label for="descricaoFilme">Descrição</label>
                    <textarea id="descricaoFilme" name="descricaoFilme" rows="4"></textarea>
                </div>

                <div class="acoes">
                    <button type="submit" name="cadastrar" class="btn-principal">Cadastrar</button>
                    <button type="reset" name="limpar" class="btn-secundario">Limpar</button>
                </div>

            </form>

        </main>

    </body>
</html>