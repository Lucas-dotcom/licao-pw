<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page import="com.mysql.jdbc.Driver"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <link href="css/estilos.css" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://strap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndckocdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" intefrity=6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </head>
    <body>
        
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Usuários</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>

    </ul>
    <span class="navbar-text">
      Olá
         <%
            String nome = (String) session.getAttribute("nomeUsuario");
            out.println(nome);
            
            if(nome == null){
                response.sendRedirect("index.jsp");
            }
        %>
    </span>
    
    <button class="btn btn-outline-dark"><a href="logout.jsp"> Sair </a></button>
  </div>
</nav>
    
    <div class="container">
         
        <button class="btn btn-outline-dark" data-toggle="modal" data-target="#Inserir">Novo Usuário</button>
        <form class="form-inline my-2 my-lg-0">
            
        <input class= "form-control mr-sm-2" type= "search" name="txtbuscar" placeholder="Digite um nome" aria-label="Search">
        
        <button class="btn btn-outline-dark" type="submit">Buscar</button>
        
        </form>
   
    </div>
    
    <div class="container">   
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">id</th>
      <th scope="col">Nome</th>
      <th scope="col">Email</th>
      <th scope="col">Senha</th>
      <th scope="col">Nível</th>
    </tr>
  </thead>
  <tbody>
      
      <%
          Statement st = null;
          ResultSet rs = null;
          String id_usuario = "";
          String nome_usuario = "";
          String email_usuario = "";
          String senha_usuario = "";
          String nivel_usuario = "";
          
          try{
              st = new Conexao().conectar().createStatement();
              rs = st.executeQuery("SELECT * FROM usuarios");
              while (rs.next()) {
                  %>
                   <tr>
                <td><%= rs.getString(1)%></td>
                <td><%= rs.getString(2)%></td>
                <td><%= rs.getString(3)%></td>
                <td><%= rs.getString(4)%></td>
                <td><%= rs.getString(5)%></td>
                </tr>
                
            <%    
              }
          } catch (Exception e){
              out.println(e);
          }
          %>

  </tbody>
</table>
    </div>    
    </body>
</html>


<!-- Modal -->
<div class="modal fade" id="Inserir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cadastro de Usuário</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>


            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="cadastro-form" class="form" action="" method="post">
                            <div class="modal-body"
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="nome" name="Nome" id="Nome" required="" autofocus="">
                            </div>
                                <div class="form-group">
                                <input type="text" placeholder="email" name="email" id="email" class="form-control">
                            </div>
                            <div class="form-group">
                                <input type="password" placeholder="senha" name="senha" id="senha" class="form-control">
                            </div>
                                <div class="form-group">
                                <select class="form-control" placeholder="Nivel" name="txtNivel" id="txtNivel">
                                    <option> Comum </option>
                                    <option> Adm </option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn-secondary" data-dismiss="modal"> Fechar </button>
                                <button type="submit" name="btn-salvar" class="btn-primary"> Salvar </button>
                            </div>
                            </div>
                        </form>
                         
                    </div>
                   
      </div>
      
    </div>
  </div>
</div>

    <%
        if(request.getParameter("btn-salvar")!=null){
            
            String Nome = request.getParameter("Nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String nivel = request.getParameter("txtNivel");
            
            try{
                st= new Conexao().conectar().createStatement();
                
                rs= st.executeQuery("SELECT * FROM usuarios WHERE email = '"+ email +"'");
                while(rs.next()) {
                   rs.getRow();
                   if (rs.getRow()> 0){
                       out.println("<script>alert ('Usuário ja cadastrado'); </script>");
                       return;
                   }
                }
                
                
                st.executeUpdate ("INSERT INTO usuarios (nome, email, senha, nivel)" + 
                "VALUES ('"+ Nome +"','"+ email +"','"+ senha +"','"+ nivel +"')");
                
                response.sendRedirect("usuarios.jsp");
            }
            
            catch (Exception e){
                out.println(e);
            }
        }
        %>