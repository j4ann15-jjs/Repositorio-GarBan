<?php
// Capturar los datos del formulario de forma segura
$Tipo_ID = $_POST['Tipo_ID'] ?? '';
$Id_Cliente = $_POST['Id_cliente'] ?? '';
$Nombre = $_POST['nombre'] ?? '';
$Apellido = $_POST['apellido'] ?? '';
$Correo = $_POST['email'] ?? '';
$Telefono = $_POST['phone'] ?? '';
$Contrasena = $_POST['password'] ?? '';

// Conexión a la base de datos usando MySQLi
$MySqli = new mysqli("localhost", "root", "", "garban");

if ($MySqli->connect_errno) {
    echo "Fallo al conectar a MySQL: " . $MySqli->connect_error;
    exit();
} else {
    echo "Conexión exitosa<br>";
}

// ENCRIPTACIÓN DE CONTRASEÑA
$contrasena_hash = password_hash($Contrasena, PASSWORD_DEFAULT);

// Verificar si el correo ya existe en la base de datos 
$consulta = $MySqli->prepare("SELECT Id_Cliente FROM cliente WHERE Correo = ?");
$consulta->bind_param("s", $Correo);
$consulta->execute();
$consulta->store_result();

if ($consulta->num_rows > 0) {
    // Si el correo ya está registrado
    echo "
    <script>
    alert('El correo ya está registrado');
    window.history.back();
    </script>
    ";
    exit();
}
$consulta->close();

// INSERTAR USUARIO (Usando sentencia preparada)
$insertusuario = $MySqli->prepare("INSERT INTO cliente (Tipo_ID, Id_Cliente, Nombre, Apellido, Correo, Telefono, Contrasena) VALUES (?, ?, ?, ?, ?, ?,?)");
$insertusuario->bind_param("sssssss", $Tipo_ID, $Id_Cliente, $Nombre, $Apellido, $Correo, $Telefono, $contrasena_hash);


if ($insertusuario->execute()) {
    ?>
    <script>
    alert("Información agregada exitosamente");
    window.location = "garban_home.html";
    </script>
    <?php
} else {
    ?>
    <script>
    alert("No se pudo agregar al usuario");
    window.location = "Garban Proyect/garban_home.html";
    </script>
    <?php
    echo "Error: " . $MySqli->error;
}

exit;
$insertusuario->close();
$MySqli->close();
?>