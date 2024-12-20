<?php
session_start();
include(__DIR__ . '/../includes/db.php');

// Verifica si el usuario está logueado como admin
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: login.php");
    exit;
}

// Verifica que se haya enviado un mensaje
if (isset($_POST['mensaje'])) {
    $mensaje = $_POST['mensaje'];

    // Recupera todos los usuarios con el rol 'telefonico'
    $sql = "SELECT id FROM users WHERE role = 'telefonico'";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $telefonicos = $stmt->fetchAll();

    // Envía el mensaje a todos los usuarios 'telefonico'
    foreach ($telefonicos as $usuario) {
        $user_id = $usuario['id'];
        $insertMensaje = "INSERT INTO mensajes (user_id, mensaje) VALUES (?, ?)";
        $stmtInsert = $pdo->prepare($insertMensaje);
        $stmtInsert->execute([$user_id, $mensaje]);
    }

    echo 'Mensaje enviado a todos los usuarios telefónicos';
} else {
    echo 'No se recibió mensaje';
}
?>
