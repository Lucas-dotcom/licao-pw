<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page import="com.mysql.jdbc.Driver"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/estilos.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        
    </head>
               <%     
                Statement st = null;
                ResultSet rs = null;
             %>
    <body>
        <div id="fullscreen_bg" class="fullscreen_bg"/>

<div class="container">

	<form class="form-signin">
		<h1 class="form-signin-heading text-muted">Login</h1>
		<input type="text" class="form-control" placeholder="email" name="usuario" required="" autofocus="">
		<input type="text" class="form-control" placeholder="senha" name="senha" required="">
		<button class="btn btn-lg btn-primary btn-block" type="submit">
			Login
		</button>
	</form>

                        <%
                          String user = request.getParameter("usuario"); 
                          String pass = request.getParameter("senha"); 
                          String nomeUsuario = "";
                          String usuario = "";
                          String senha = "";
                          
                          int i = 0;


                          try{
                          st = new Conexao().conectar().createStatement();
                          rs = st.executeQuery("SELECT * FROM usuarios WHERE email = '"+user+"' and senha= '"+pass+"'");
                          while (rs.next()){
                             // out.println(rs.getString(2));
                             usuario = rs.getString(3);
                             senha = rs.getString(4);
                             nomeUsuario = rs.getString(2);
                             rs.last();
                             i = rs.getRow();
                          }
                          } catch (Exception e){
                              out.println(e);
                          }
                          
                          if((user == null) || (pass == null)){
                              out.println("Preencha os dados");
                          } else{
                              if(i>0){
                                  session.setAttribute("nomeUsuario", nomeUsuario);
                                  response.sendRedirect("usuarios.jsp");
                              }
                          }
                        %>
</div>
    </body>
</html>
