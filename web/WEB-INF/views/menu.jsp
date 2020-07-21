<%-- 
    Document   : menu
    Created on : 21-jul-2020, 0:12:34
    Author     : flavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>Menu</title>
    </head>
    <body>
        <button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#exampleModal">Configuracion de la cuenta</button>
        <button type="button" class="btn btn-secondary btn-lg btn-block">Algoritmo</button>
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Actualizar Datos</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="actualizar" method="POST">
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" value="<%=request.getAttribute("nombre")%>" class="form-control validation"
                                       id="nombre" name="nombre" placeholder="Escribe tu nombre">
                                  <input type="text" value="<%=request.getAttribute("correo")%>" class="form-control validation"
                                       id="correo" name="correo" >
                            </div>
                            <div class="form-group">
                                <label for="rfc">RFC</label>
                                <input type="text" class="form-control " id="rfc" name="rfc"
                                       placeholder="Escribe tu RFC" value="<%=request.getAttribute("rfc")%>">                       
                            </div>
                            <div class="form-group">
                                <label for="rfc">Direccion</label>
                                <input type="text" class="form-control " id="direccion" name="direccion"
                                       placeholder="Escribe tu Direccion" value="<%=request.getAttribute("direccion")%>">                       
                            </div>
                            <div class="form-group">
                                <label for="rfc">Teléfono</label>
                                <input type="text" class="form-control " id="telefono" name="telefono"
                                       placeholder="Escribe tu telefono" value="<%=request.getAttribute("telefono")%>">                       
                            </div>
                            <div class="form-group">
                                <label for="rfc">Web Site</label>
                                <input type="text" class="form-control " id="web" name="web"
                                       placeholder="Escribe tu telefono" value="<%=request.getAttribute("web")%>">                       
                            </div>                      
                            <div class="form-group">
                                <label for="c_password">Contraseña</label>
                                <input type="text" value="" class="form-control" id="password" name="password"
                                       placeholder="Escribe tu contraseña nueva">
                            </div>
                            <div class="form-group">
                                <label for="c_password">Confirma tu contraseña</label>
                                <input type="text" value="" class="form-control" id="c_password"  
                                       name="c_password"
                                       placeholder="Confirma tu contraseña">
                            </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" id="actualizar_datos" class="btn btn-primary">Guardar Cambios</button>
            </div>
        </form>
    </div>
</div>
</div>


</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
