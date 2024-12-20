
<?php
$servername = "localhost"; // Cambia esto si es necesario
$username = "ziriuson_orzaca";        // Usuario de la base de datos
$password = "Orzaca2024*";            // Contraseña de la base de datos
$database = "ziriuson_zirius"; // Nombre de tu base de datos

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar si la conexión fue exitosa
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
