<?php
$Tipo_ID = $_POST ['Tipo_ID'];
$Id_Cliente = $_POST ['Id_cliente'];
$Nombre = $_POST ['nombre'];
$Apellido = $_POST ['apellido'];
$Correo = $_POST ['email'];
$Telefono = $_POST ['phone'];
echo $Tipo_ID;
echo $Id_Cliente;
echo $Nombre;
echo $Apellido;
echo $Correo;
echo $Telefono;

$MySqli = new MySqli ("localhost", "root", "", "garban");
If ($MySqli -> connect_errno){
echo "failed to connect to MySQL: " . $MySqli -> connect_error;
    exit();
}else {// conexcion exitosa
echo 'conexcion exitosa';
 } 
 $insertusuario= "INSERT INTO cliente (Tipo_ID, Id_Cliente, Nombre , Apellido , Correo , Telefono) values 
 ('$Tipo_ID', '$Id_Cliente','$Nombre','$Apellido', '$Correo', '$Telefono')";

  if ($MySqli->query($insertusuario)===TRUE) {  
?>

 <script>
  alert("información agregarda exitosamente");
  window. location = "Garban Proyect/registro.html"; 
   </script>
  
 <?php 
}
else{  // no se pudo hacer el insert?> 
<script>
alert( "No se pudo agregar al usuario"); 
window.location = "Garban Proyect/garban_home.html"; //redirigir al rgistro 
</script>
 <?php 
 echo "Error: " . $registro . "<br>" . $MySqli-> error;
 } 
?>