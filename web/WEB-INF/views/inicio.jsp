<%-- 
    Document   : inicio
    Created on : 20-jul-2020, 18:58:29
    Author     : flavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Login</title>
    </head>
    <body>
        <br><br><br><br><br><br><br>
        <div class="container">
            <div class="col-sm-12">
                <%//Si hay mensaje de error
                    if (request.getAttribute("error") != null) {
                %>
                <div class="col-sm-12">
                    <div 
                        class="alert alert-danger ">
                        <a href="#" 
                           class="close" data-dismiss="alert" 
                           aria-label="close" title="close"></a>
                        <strong>¡Error!</strong> 
                        <%=request.getAttribute("error")%>
                    </div>
                </div>
                <%}%>
            </div>
            <form action="login" method="POST">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email"
                           placeholder="Escribe tu email" value="f@gmail.com" >                       
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" value="12345"  class="form-control" id="password"  name="password"
                           placeholder="Escribe tu contraseña">
                </div>
                <button type="submit"  class="btn btn-primary" id="validar_login">Entrar</button>

                ´<a  href="registro">Registrarse</a>
            </form>

        </div>
    </body>
</html>
<script src="js/validaciones.js" type="text/javascript"></script>