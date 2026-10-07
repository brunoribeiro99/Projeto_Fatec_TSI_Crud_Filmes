<%-- 
    Document   : cadastrardepartamento.jsp
    Created on : 07/10/2026 14:58
    Author     : Bruno Ribeiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Filme</title>
    </head>
    <body>
        <h1>Cadastro de Filme!</h1>
        <form name="cadastrarfilme" action="CadastrarFilme">
            Nome:<input type="text" name="nomeFilme" value="" size="15" />
            <br>
            Descrição:<input type="text" name="descricaoFilme" value="" size="30" />
            <br>
            <input type="submit" value="Cadastrar" name="cadastrar" />
            <input type="reset" value="Limpar" name="limpar" />
        </form>
        ${sucesso}
    </body>
</html>