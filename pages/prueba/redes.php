<?php
// redes.php
session_start();
require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';

// Comprobación de sesión para asegurarte de que el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php"); // Redirigir a la página de inicio de sesión si no está autenticado
    exit();
}

$sql = "SELECT * FROM mensajes WHERE receiver_role = 'redes' ORDER BY timestamp DESC";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mensajes de Redes</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Mensajes Recibidos</h1>
    <div id="messages"></div>
    <script src="redes.js"></script>
</body>
</html>
