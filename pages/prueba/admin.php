<?php
// admin.php
session_start();
require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';



// Redirigir si no está autenticado como administrador
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: login.php"); // Redirigir a la página de inicio de sesión si no está autenticado
    exit();
}

// Inicializar un mensaje de error o éxito
$message_status = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $mensaje = trim($_POST['mensaje']); // Limpiar el mensaje de entrada
    $sender_id = $_SESSION['user_id']; // Asumiendo que el ID del usuario está en la sesión

    // Comprobar si el mensaje no está vacío
    if (!empty($mensaje)) {
        $sql = "INSERT INTO mensajes (sender_id, receiver_role, mensaje) VALUES (?, 'redes', ?)";
        $stmt = $conn->prepare($sql);
        
        if ($stmt) {
            $stmt->bind_param("is", $sender_id, $mensaje);
            if ($stmt->execute()) {
                $message_status = 'Mensaje enviado exitosamente.';
            } else {
                $message_status = 'Error al enviar el mensaje. Intenta nuevamente.';
            }
            $stmt->close();
        } else {
            $message_status = 'Error en la consulta. Intenta nuevamente.';
        }
    } else {
        $message_status = 'El mensaje no puede estar vacío.';
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Admin</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Enviar Mensaje a Usuarios de Redes</h1>
    <?php if ($message_status): ?>
        <div class="status-message"><?php echo $message_status; ?></div>
    <?php endif; ?>
    <form id="messageForm" method="POST">
        <textarea name="mensaje" required></textarea>
        <button type="submit">Enviar</button>
    </form>
    <script src="admin.js"></script>
</body>
</html>
